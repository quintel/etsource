# frozen_string_literal: true

task deduplicate_curves: :environment do
  require 'pathname'

  def dedup_curves(parent_curve_dir, child_curve_dir)
    Pathname.glob(parent_curve_dir.join('**/*.csv')).each do |parent_c_path|
      name = parent_c_path.relative_path_from(parent_curve_dir)
      child_c_path = child_curve_dir.join(name)

      next unless child_c_path.exist? &&
        child_c_path.read == parent_c_path.read &&
        child_c_path.expand_path.to_s == child_c_path.realpath.to_s

      child_c_path.unlink

      FileUtils.ln_s(
        parent_c_path.relative_path_from(child_c_path.dirname),
        child_c_path
      )

      puts "Duplicate: #{name}"
    end
  end

  Atlas::Dataset::Derived.all.each do |ds|
    dedup_curves(
      ds.parent.dataset_dir.join('curves'),
      ds.dataset_dir.join('curves')
    )
  end

  nl = Atlas::Dataset.find(:nl)

  Atlas::Dataset::Full.all.each do |ds|
    next if ds.key == :nl

    dedup_curves(
      nl.dataset_dir.join('curves'),
      ds.dataset_dir.join('curves')
    )
  end
end
