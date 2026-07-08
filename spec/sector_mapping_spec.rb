# frozen_string_literal: true

require 'spec_helper'
require 'csv'
require 'set'

# Guarantees that the mapping, node labels, emissions store and the gquery corpus are
# mutually consistent.
RSpec.describe 'Sector mapping validation' do
  # The GHGs the mapped EMISSIONS form aggregates over.
  GHGS = %i[co2 other_ghg].freeze

  def normalise(value)
    Atlas::SectorMapping.normalize(value)
  end

  def mapping
    @mapping ||= Atlas::SectorMapping.load
  end

  def labelled_nodes
    @labelled_nodes ||=
      (Atlas::EnergyNode.all + Atlas::MoleculeNode.all).select(&:sector_label)
  end

  # Check 1: every labelled node's (label, use) pair exists as a mapping row.
  # An unset `use` on a labelled node fails here (its pair is [label, nil]).
  def nodes_off_mapping(nodes, pairs)
    nodes.reject do |node|
      pairs.include?([node.sector_label, normalise(node.use)])
    end
  end

  # Check 2: every row's sector_label == slug(sector) + '_' + slug(subsector).
  def rows_with_drifted_join_key(rows)
    rows.reject do |row|
      joined = [row[:emissions_sector], row[:emissions_subsector]].compact.join('_')
      row[:sector_label] == (joined.empty? ? nil : joined.to_sym)
    end
  end

  # Check 3: every mapping (sector, subsector, use) x GHG has an emissions row.
  def uncovered_store_tuples(rows, present_tuples, allowlist)
    rows.flat_map do |row|
      GHGS.filter_map do |ghg|
        tuple = [row[:emissions_sector], row[:emissions_subsector], row[:use], ghg]
        next if present_tuples.include?(tuple) || allowlist.include?(tuple)

        tuple
      end
    end
  end

  # Check 4: scheme names must not collide with the sector labels used as the
  # EMISSIONS first argument, or the EMISSIONS scheme dispatch is ambiguous.
  def scheme_label_collisions(schemes, rows)
    schemes & rows.filter_map { |row| row[:sector_label] }.uniq
  end

  # Check 5: static scan of a GQL string for literal scheme-form calls which
  # name an unknown scheme or an unresolvable value. Returns a list of messages.
  CALL_RE = /\b(SECTOR|MSECTOR|EMISSIONS)\(([^()]*)\)/

  def scan_offences(text, source)
    text.to_s.scan(CALL_RE).flat_map do |func, arglist|
      args = arglist.split(',').map { |arg| unquote(arg) }.reject(&:empty?)
      offence_for(func, args, source)
    end.compact
  end

  # ---------------------------------------------------------------------------

  describe 'check 1: labelled nodes exist in the mapping' do
    it 'has every labelled node (label, use) pair in the mapping' do
      offenders = nodes_off_mapping(labelled_nodes, mapping.pairs).map do |node|
        "#{node.key} -> (#{node.sector_label.inspect}, #{normalise(node.use).inspect})"
      end

      expect(offenders).to(
        be_empty,
        "Labelled nodes whose (sector_label, use) pair is not a mapping row " \
        "(populate the mapping or fix the node's use):\n  #{offenders.join("\n  ")}"
      )
    end
  end

  describe 'check 2: join-key pin' do
    it 'has every row label equal to slug(sector)_slug(subsector)' do
      offenders = rows_with_drifted_join_key(mapping.rows).map do |row|
        "#{row[:sector_label].inspect} != " \
        "#{row[:emissions_sector].inspect}_#{row[:emissions_subsector].inspect}"
      end

      expect(offenders).to(
        be_empty,
        "Mapping rows whose sector_label drifted from sector+subsector:\n  " \
        "#{offenders.join("\n  ")}"
      )
    end
  end

  describe 'check 3: emissions store coverage' do
    it 'has an emissions row for every mapping pair x GHG' do
      uncovered = uncovered_store_tuples(
        mapping.rows, present_emissions_tuples, STORE_COVERAGE_ALLOWLIST
      ).map { |tuple| tuple.map(&:to_s).join('_') }

      expect(uncovered).to(
        be_empty,
        "Mapping pairs with no emissions-store coverage in #{default_dataset} " \
        "(add data or allowlist):\n  #{uncovered.join("\n  ")}"
      )
    end
  end

  describe 'check 4: scheme names disjoint from sector keys' do
    it 'has no scheme name equal to a sector label' do
      collisions = scheme_label_collisions(mapping.scheme_names, mapping.rows)

      expect(collisions).to(
        be_empty,
        "Scheme names colliding with EMISSIONS sector keys: #{collisions.inspect}"
      )
    end
  end

  describe 'check 5: gqueries and inputs reference known schemes/values' do
    Atlas::Gquery.all.each do |gquery|
      it "resolves every literal scheme-form call in gquery #{gquery.key}" do
        expect(scan_offences(gquery.query, "gquery #{gquery.key}")).to eq([])
      end
    end

    Atlas::Input.all.each do |input|
      it "resolves every literal scheme-form call in input #{input.key}" do
        gql = [
          input.query, input.start_value_gql,
          input.min_value_gql, input.max_value_gql
        ].join("\n")

        expect(scan_offences(gql, "input #{input.key}")).to eq([])
      end
    end
  end

  describe 'check 6: reverse coverage is deliberately NOT enforced' do
    it 'allows mapping rows with zero labelled nodes during incremental rollout' do
      # Intentionally no assertion: a mapping row without a labelled node is
      # legal so `sector_label` can be populated incrementally. Documented here
      # so its absence is a decision, not an oversight.
      expect(true).to be(true)
    end
  end

  # The following specs test that the checks fail on broken inputs.

  describe 'each check turns red on a broken input' do
    let(:broken_node) do
      Struct.new(:key, :sector_label, :use).new(:bad, :industry_steel, 'energetic')
    end

    it 'check 1 flags a node whose pair is missing from the mapping' do
      expect(nodes_off_mapping([broken_node], Set.new)).to eq([broken_node])
    end

    it 'check 2 flags a drifted join key' do
      rows = [{ sector_label: :wrong, emissions_sector: :energy, emissions_subsector: :steel }]
      expect(rows_with_drifted_join_key(rows)).to eq(rows)
    end

    it 'check 3 flags a pair with no store coverage' do
      rows = [{ emissions_sector: :energy, emissions_subsector: :steel, use: :energetic }]
      expect(uncovered_store_tuples(rows, Set.new, Set.new)).not_to be_empty
    end

    it 'check 4 flags a scheme name that is also a sector label' do
      rows = [{ sector_label: :klimaattafel }]
      expect(scheme_label_collisions(%i[klimaattafel], rows)).to eq(%i[klimaattafel])
    end

    it 'check 5 flags an unknown scheme in a call' do
      expect(scan_offences("SECTOR(impossible, query)", 'test'))
        .to include(/impossible/)
    end

    it 'check 5 flags an unresolvable value in a known scheme' do
      expect(scan_offences("SECTOR(klimaattafel, 'Nonexistent')", 'test'))
        .to include(/Nonexistent/)
    end

    it 'check 5 accepts a resolvable literal call' do
      expect(scan_offences("SECTOR(klimaattafel, 'Industrie')", 'test')).to eq([])
    end

    it 'check 5 leaves legacy one-argument SECTOR untouched' do
      expect(scan_offences("SECTOR(households)", 'test')).to eq([])
    end
  end

  private

  def default_dataset
    @default_dataset ||= YAML.load_file(Atlas.data_dir.join('config/default_dataset.yml'))
  end

  def present_emissions_tuples
    @present_emissions_tuples ||= begin
      path = Atlas.data_dir.join('datasets', default_dataset, 'emissions.csv')
      CSV.read(path, headers: true).each_with_object(Set.new) do |row, set|
        set << [
          normalise(row['etm_sector']), normalise(row['etm_subsector']),
          normalise(row['use']), normalise(row['ghg'])
        ]
      end
    end
  end

  def unquote(arg)
    arg.strip.gsub(/\A['"]|['"]\z/, '')
  end

  # Returns an offence message for a literal call, or nil when it is legal or
  # out of static reach (legacy one-arg SECTOR, non-scheme EMISSIONS). A value
  # resolves when it appears in the scheme's column, even with zero labelled
  # nodes (the mapping, not node labelling, is what is being validated).
  def offence_for(func, args, source)
    return nil if args.empty?

    scheme = args.first

    if func == 'EMISSIONS'
      # Only the mapped form is in reach; a non-scheme first arg is legacy.
      return nil unless mapping.scheme?(scheme)

      values = args[1, 1] # the value; trailing ghg / 1990 are not scheme values
    else # SECTOR / MSECTOR
      return nil if args.size < 2 # legacy one-argument form

      values = args.drop(1)
    end

    unless mapping.scheme?(scheme)
      return "#{source}: #{func}(#{args.join(', ')}) names unknown scheme " \
             "#{scheme.inspect}; valid schemes: #{mapping.scheme_names.inspect}"
    end

    unresolved = values.reject { |value| mapping.lookup(scheme, value).any? }
    return nil if unresolved.empty?

    "#{source}: #{func}(#{args.join(', ')}) has unresolvable value(s) " \
    "#{unresolved.inspect} for scheme #{scheme.inspect}"
  end
end
