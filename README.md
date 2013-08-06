# ETSource

![Master branch build status][build-status]

**This document is written from the perspective of the "new" ETSource
repository which will come into being once the "Kill InputExcel" project is
finished. This new repo can be found in the `./data` directory. Parts of the
original readme, can be found [at the end][original]**

ETSource contains the data used by Quintel applications for modelling energy
transition. The files contained herein are a mixture of human-editable
"documents", source files used to do offline calculations with [Tome][tome]
and [Refinery][refinery], and files containing the results of these
calculations for use in [ETEngine][etengine].

You may also wish to view the [Tome readme][tome-readme] for information on
loading the ETSource data in a console, importing data from the old InputExcel
output files, or for instructions on exporting data for ETEngine.

## "Active" Documents

Files with an ".ad" extension are editable through the [Tome console][console]
and are used by ETEngine to set up the graph structure. These files typically
contain global data which applies to all regions.

If you prefer, ActiveDocument files can be editted in your favourite text
editor. Each document is split into two sections: a comments section where
each line begins with a hash ("#"), a section containing attributes values.

```
# This is the comment section. You can wrap across as many lines as you want,
# but each one should begin with a hash.
#
# Paragraphs are also acceptable.

- use = energetic
- renewability = 1.0

~ demand = EB(something, something)
```

#### Comments Section

The comment section is optional, and should be placed at the top of the
document. When the file is loaded by Tome, the comment is available as the
`description` attribute.

```ruby
document.description
# => "String containing the file comment"
```

#### Attributes Section

The attributes section is parsed so that each one is available with a native
Ruby datatype. Attributes are specified with one on each line and preceeded
with a dash and space.

```ruby
# - use = energetic
# - renewability = 1.0

document.use           # => "energetic" (String)
document.renewability  # => 1.0 (Float)
```

Values may also be an array of numbers or strings by wrapping each one in
square brackets.

```ruby
# - range = [1, 2.0, 3, 4.5, 9]
# - strs  = [a, b, c]

document.range  # => [1, 2.0, 3, 4.5, 9]
document.strs   # => ['a', 'b', 'c']
```

##### Multi-line Attributes

An attribute value may span multiple lines so long as each line is intended
with spaces:

```
- description =
    Felis catus is your taxonomic nomenclature,
    An endothermic quadruped, carnivorous by nature;
    Your visual, olfactory, and auditory senses
    Contribute to your hunting skills and natural defenses.
```

The leading spaces will be trimmed:

```ruby
# - query =
#     SUM(
#       MAX(1, 2),
#       MAX(3, 4)
#     )

puts document.query

# SUM(
#   MAX(1, 2),
#   MAX(3, 4)
# )
```

##### Hashes and Namespaces

You can specify "namespaced" attributes which are converted to hashes in the
Ruby model:

```ruby
# - efficiency.gas = 0.5
# - efficiency.electricity = 0.6

document.efficiency  # => { gas: 0.5, electricity: 0.6 }

# - one.two = 2
# - one.three.four = 4

document.one # => { two: 2, three: { four: 4 } }
```

##### Dynamic Attributes

All of the attributes described so far are "static" -- they are the same for
every region and do not require any extra processing. However some
attributes, such as the demand of a node, or the share of an edge, may vary
from region-to-region, or depend on external (CSV) sources.

These values are assigned by writing a query which outputs the desired value.

Queries are prefixed with a `~` instead of the usual `-`, and are followed by
the query to be executed:

```ruby
~ demand =
    EB(residential, gas) +
      EB(residential, electricity) +
      EB(residential, infinite_improbability_drive)
```

The values output by queries are used during for Refinery calculations. You
may set the following attributes using a query:

* Node: `demand`.
* Edge: `parent_share`, `child_share`, or `demand`.
* Slot: `share` ("conversion").

Set a slot share by adding an appropriate query in the node document:

```ruby
~ output.coal = CONVERSION(my_node_outputs, coal)
```

##### EB(use, carrier)

The `EB()` function returns the value of a cell from the energy balance data.
This data is stored in a CSV file in "data/energy_blanace". Supply the use
(the name of a row in the CSV) with a carrier (a column name):

```ruby
EB(industry, electricity) # => 140673.72
```

##### AREA(attribute)

Retrieve a single attribute value from the area data with the `AREA()`
function. The area data is stored in "data/datasets/:area/:area.ad".

```ruby
AREA(coast_line) # => 451.0
```

##### SHARE(file_name, attribute)

Files containing share data (application and technology splits) are found at
"data/datasets/:area/shares". Provide the name of the share file, plus the
column name, and you'll get the share value:

```ruby
SHARE(cng, cars) # => 0.5
```

CSV files containing shares can be given whatever name you want, but it should
be consistent across every region, i.e. if you add a "cng.csv" file to
"datasets/nl/shares", then a similar file should be added for the other
regions also.

##### CHP(node_key)

Research data containing demands of CHP nodes is at
"data/datasets/:area/chp.csv" and can be accessed by calling `CHP()` with name
of the node whose demand you want:

```ruby
CHP(households_collective_chp_network_gas) # => 0.0
```

##### CENTRAL_PRODUCTION(node_key)

Like CHP data, the energy output of central production nodes is specified in
a separate CSV file. This is at "data/datasets/:area/central_producers.csv".
Provide the node key to retrieve the demand:

```ruby
CENTRAL_PRODUCTION(energy_power_solar_csp_solar_radiation) # => 5678.0
```

#### Before Committing...

After editing documents by hand, you should run the Tome validation to ensure
that you did not introduce any illegal changes:

```
$ cd ~/code/tome
$ rake validate[../etsource/data]
OK
```

#### Special Attributes

##### Node

You can set a slot share ("conversion") for a node like so:

```
- input.gas = 0.4
- input.oil = 0.6
```

This tells the node that is has two input slots; gas providing 40%, and oil
providing 60% of the demanded energy. Swapping "input" for "output" does the
same for output slots.

A special "elastic" value will tell the node that this slot should fill up
whatever share is required to sum to 1.0:

```
- output.heat = 0.2
- output.electricity = 0.5
- output.loss = elastic
```

This node outputs 20% of its energy has heat, and 50% as electricity. The
elastic slot will therefore take the remaining 30%. A node may not contain
more than one elastic input slot, and one elastic output slot.

Slot share may vary depending on the share of the inputs; this is called
"carrier efficiency", and is often used to model converters whose efficiency
varies depending on the energy source given to them. In this case, you need
to provide the efficiency of the slot if the node were to be given 100% of
each input.

```
- output.electricity.coal = 0.4
- output.electricity.biomass = 0.5
```

This tells ETSource/Tome that the "electricity" output slot has a share of 0.4
when only coal is given to the node, and a share of 0.5 when only biomass is
given. In reality, your node will likely have a split of inputs; you **must**
provide a share for each input:

```
- input.coal = 0.7
- input.biomass = 0.3
- output.electricity.coal = 0.4
- output.electricity.biomass = 0.5
- output.loss = elastic
```

## CSV Documents

Throughout the ETSource repo are ".csv" files which contain raw data used by
Tome for creating the processed files for ETEngine. Many are sourced from
third-parties (such as energy-balance data from the IEA), while others are
created by Quintel staff.

## Directory Structure

The ETSource repository is split into many directories, each containing files
serving different purposes. Data is either **global** and affects all regions,
or is **regional** and affects only one area.

#### ./carriers (global)

Contains a document for each type of carrier in the Energy Transition Model.
In each file is global data specifying how the carrier works, such as whether
the energy is infinite in supply.

#### ./datasets (regional)

Inside the datasets directory is a subdirectory for each region. Inside each
of those folders is *regional* data: an ActiveDocument whose name matches the
folder. Each also has a "shares" subdirectory containing CSVs whose values
are used by Tome to set edige shares.

#### ./edges (global)

ActiveDocuments; one for each edge ("link") between nodes in the graph. Each
filename contains the supplier ("parent" or "output") node, and the consumer
("child" or "input") node, and the name of the carrier in the format:
`consumer-supplier@carrier`.

Edges are typically organised into subdirectories whose names match the sector
of the supplier node. This may change in the future, and presently nothing
will break if you put an edge in the wrong subdirectory.

#### ./energy_balances (regional)

Raw energy balance data from the IEA; can be read by Excel. Normally you won't
edit these by hand but will simply overwrite the old file with a new one
when the IEA releases new data. Each file is *regional* and the name matches
the region to which it applies.

#### ./gqueries (global)

ActiveDocuments detailing the queries which may be performed on ETEngine by
application such as ETModel and ETFlex. The subdirectories have no
significance except to keep things organised.

#### ./import

Files used by Tome [when importing][import] older "legacy" InputExcel output
files into the new ActiveDocument format.

#### ./inputs (global)

Documents containing values which may be set on ETEngine by applications like
ETModel. One file per input, and the directories are purely for organisation
and have no significance.

#### ./nodes (global)

Contains documents for nodes. One document per node, organised into
subdirectories whose names indicate the sector to which the node belongs.

#### ./slots (global)

Optional documents which can be used to set additional attributes for the
slots on a node. These are often not necessary unless you want to specify a
custom "share", or want to tell ETEngine to use a special class (such as for
carrier-efficient nodes). The naming format is similar to edges:
`node+@carrier` for input slots, and `node-@carrier` for output slots. See
the Tome [Slot class description][slot] for the rationale behind this naming
convention.

## Safe To Edit?

Some documents in the repository should not be hand-edited **yet** as they are
frequently overwritten when a new [Tome import][import] is performed. See
Tome's list of [safe-to-edit files][safe] for a list of what you can and
cannot edit.

# Original README

### Folder structure

#### data

The `data` folder is the previsioned new folder where all the data is stored.
Currently, it contains the `gueries` and `inputs`, that are used by the
Object Mapper.

#### models

The model folders contains other models. Mostly for illustration,
documentation and testing purposes. These models can be run and tested using
the etengine command line interface. For instance, models/minimal contains
the minimal set of files and content for a simple two-converter graph. To
illustrate the behaviour of flex-max links see the `models/flex_max folder`.

#### scripts

The folder 'scripts' contains the scripts used to alter the names and content
of the queries.  The folder `change_reports` within 'scripts' contains the
changes made in the queries, one for each of the query groups.

### Rules and best practices

Try to make one commit for each batch of changes you make to the files,
related to one issue. For example, if a query is changed, try to alter all
queries and inputs related to the query in a single commit.

### Updating from the InputExcel guide

You have to copy the zip file to the etsource directory and enter the
following command in your terminal:

    $ cd your-etsource-directory $ ruby scripts/xls2yml/xls2yml.rb

If you changed anything converter keys, naming, structure, in general to the
topology, you have to export all countries. If you only update a country
dataset with new numbers, you don't have to update all countries.

After this you can commit your changes.

Adding or updating carriers, you have to do in
etsource/datasets/.../carriers.yml.

### Datasets

A dataset is the collection of all _data buckets_ within a _section_. Look at
it as one big _data bucket_. A dataset is virtual, and not commited to Github.
The merging of all buckets happens during runtime. There are three independent
levels: default, country and wizard datasets. Each can overwrite values of the
former.

#### Default Dataset (datasets/_defaults)

Contains all the values that are a) the same for every country or b) should be
treated as default/start values. Values here are overwritten in the country
dataset. That means we can put the data that sometimes changes in a _default
dataset_ and overwrite it in the _country dataset_ when it does actually
change.

#### Country Dataset (datasets/:area_code)

The precise name would be area(-specific) dataset (area can be a country 'nl',
or a region 'nl-drenthe'). But country dataset is a clear enough and
human-friendly name and is easy on the lips.

#### Overwriting Rules

    # _defaults/area.yml ...  :area_data: :co2_price: 0.002 :has_fce: false
    # nl/area.yml ...  :area_data: :number_of_households: 100_000 :has_fce: true
    # => {:area_data: {:co2_price: 0.002, :number_of_households: 100_000, :has_fce: true }}

[build-status]: https://semaphoreapp.com/api/v1/projects/63d00abb0b002bb34bdbe9602aee85a2a0d42f56/25174/badge.png
[tome]:         https://github.com/quintel/tome
[tome-readme]:  https://github.com/quintel/tome#readme
[refinery]:     https://github.com/quintel/refinery
[etengine]:     https://github.com/quintel/etengine
[console]:      https://github.com/quintel/tome#using-the-tome-console
[import]:       https://github.com/quintel/tome#importing-legacy-etsource-files
[slot]:         https://github.com/quintel/tome/blob/master/lib/tome/slot.rb
[safe]:         https://github.com/quintel/tome#safe-to-edit
[original]:     #original-readme
