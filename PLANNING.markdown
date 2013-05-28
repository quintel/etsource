# The Road towards a better InputTool

## Main objective

The project 'towards a better InputTool' is primary concerned with replacing
the current Excel file and optimizing the input and permutations.

Reasons why:
* Currently it is hard to manage data without any version control being
available in Excel.
* There is no (proper) debugging.
* There are no tests possible in Excel.

### Requirements

* `need` Defining the Graph structure with Version Control (VC)
* `need` Read the Final Demand energy balance values and link them to the
  appropiate converter(s).
* `need` A clean object mapper for the fundamental objects, such as converters,
  links, graphs, energy balances etc in order to make e.g. validations happen.
* `need` Validations of input data (e.g. is everything defined that we need?,
  are there no loose ends?).
* `need` Division up of Converters into Nodes, Converters, UsefulDemandNodes,
  FinalDemandNodes, etc in order to make validations manageable.
* `need` Define technology/market shares and application shares in an
  understable and standardized way.
* `need` Being able to import/load all the required objects from ETSource.
* `nice` Cut up the definition of the Graph in subgraph which can be added to
  each other (e.g. households etc.) to make it more managable.
* `nice` Use standardized Energy Balances for different countries.

Later, we want *other* people from outside of Quintel also to work more closely
with datasets. This will have to be taken into account when making our design
choices.

## Road Map / Planning

In this project the challenges we have can be subdivided in two flavors:
(1) Mapping data to graph: the technological challenge of mapping and
transposing data to our Graph structure. (2) Making sure that the data is
sound, and that we can run validations, mass updates etc.

### Mapping Data to Graph

1. **Proof of Concept** that we can build up a graph easily and transparantly.
   **DONE** with [Turbine].
2. **Proof of Concept** that we can reproduce the ability of the current
   InputExcel to generate `preset_demands` from `final_demands` in the graph.
**PARTIALLY DONE** with Refinery.
3. Build the current ETSource graph in Turbine/Refinery. **DONE**
4. Calculate the current ETSource graph with Refinery and start
   abstracting final_demands from Energy Balances. **DONE** with
   ETSource. **HELP WANTED FROM WOUTER/CHAEL**
   * transport **DONE**
   * agriculture
   * energy_production
5. Refinery validations **DONE**
   *Refinery performs some checks after its calculations to ensure that the
   values make sense; that the energy flowing into a node through "in slots"
   matches that which leaves through "out slots". It raises an error when
   insufficient information is available to perform the calculation, listing
   the nodes and edges which could not be given a "demand" value. A Diagram
   generator can provide a visual representation instead.*
6. Refinery `child_share` and `parent_share` **DONE**
   *Refinery implements - and uses - both.*
7. Refinery efficiencies and conversions. **DONE, PENDING FURTHER DISCUSSIONS**
   *Efficiency is implemented as in ETEngine: with an output "loss" slot.
   Setting a "share" (otherwise known as "conversion" in ETEngine) on the loss
   slot will model loss. For example, if the node is 90% efficient, adding a
   loss slot with a share of 0.1 will have the desired effect.*
   * carrier dependent efficiencies.
8. Adding DataSet and making that top level for other objects. **DONE**
9. Abstracting technology shares and application shares to ETSource. **DONE**
   *ShareData files, stored in `datasets/:area`, allow you to define shares in
   CSV format, and have those numbers made available through Rubel ("GQL")
   queries.*
10. Abstracting production characteristics to ETSource.
11. Abstracting converter efficiencies for other areas.
12. All other stuff (such as costs, energy balance group colors, whatever).
13. Map country-specific data/adjustments from ETSource. (Area)
14. Clean library-style imports from ETSource/Refinery in ETEngine. **PART DONE**
   *Partially done in a recent ETEngine commit, but reverted until a robust
   way to use ETSource is added. We need to be able to support a Gem-style
   import for production and users who don't modify ETSource, and a "local"
   import for programmers and modellers (like the current system).*
15. Validating demands with EnergyBalance `primary_demands`
16. Add a "production" mode to ETSource.
   *Production mode will disable Rubel queries, and instead load
   pre-calculated values from a CSV file.*

### Data Integrity and moving data

1. **Proof** that we can use validations on objects. **DONE**
2. Create foundations for the data mapper **DONE**
3. `waiting` Define subclassed for Converters/Nodes and experiment with Concerns
   (instance mixins) **DONE**
   *Subclasses for some different types of nodes have been added already. This
   allows us to support different validators on different types of node, as
   well as custom attributes.*
4. Split Topology into files per sector **DONE**
   *Nodes, edges, and slots have all been split into one file each. It is
   likely we will define subgraphs through subsets of edges. Presently,
   subgraphs can be created by the sector in which the parent (supplier) node
   belongs.*
5. Split converters into one file per converter **DONE**
6. Port converters attributes to ETSource (we keep attributes and methods as
   they are).
   * costs
   * fce
   * much more in the InputExcel
   * some more in the Research dataset
7. Edges defined in ETSource **DONE**

### Clean up old stuff

1. Delete excess stuff on ETSource, ETEngine
2. MUCH MORE!

### Documentation and Training

1. Create proper documentation (if not already exists) on the technology and
   the use of the different parts of the new solution.
2. Explaing to others how the new stuff works in a presentation

### Wrap up

1. Create recommendations for next project
2. File debts

### Timing

To be added later when list of activities is complete we can start making an
estimate of time of migration.

## Current situation (IST analysis)

In order to understand what we are replacing, we should think about the curent
responsabilities of the InputExcel and the Datasets.

### InputExcel

The InputExcel file has the following responsibilities:
* Defining
  * `converters`, among others "final demand"
  * `links`
  * `energy_balance_groups`
* Defining the structure of the graph
  * (between which converters?, what kind of links?)
* Calculating Useful Energy Demand from Final Energy Demand
* Taking input from a 'Dataset' and using that for defining attributes

### Datasets

Currenly, the datasets are (yet more) Excel files, many of them are outdated. They
basically list and permutate attributes for Converters and links (shared), put
them in one big column which can be copy-pasted (or linked) to the
InputExcel.

**NOTE:** curently, a strict separation between dataset and inputexcel does not
exist: sometimes data is defined and 'lives' in the InputExcel.

## Applications/Libraries involved:

Currenly we use the following applications:

* [Turbine][Turbine]: responsible for defining a graph with nodes and edges and
  setting and getting its properties
* [Refinery][Refinery]: responsible for calculating demands and shares in an
  *energy* graph.
* [ETSource][ETSource]: responsible for data persistence, version control of
  input data on *all* objects that are used in the above (and more, such as
  gqueries)
* [ETEngine][ETEngine]: currently does a lot of tricks, such as
  * building the graph, which will be given to Turbine etc.
  * Manages user input and output (gqueries/GQL)

## Resource Management

Of course, everybody from Quintel is involved, but most importantly:

* Dennis Schoenmakers: project manager (~0.4 FTE)
* Anthony Williams: Driving Technical Developer, Quality Assurance  (1 FTE)
* Chael Kruip: Advisor on how current solution works and future
  user of the product(s) (~0.3 FTE)
* Alexander Wirtz: Furture user of the product(s) and manager of Dataset
  Restructuring (~0.1 FTE)
* Wouter Meyers: (~0.1 FTE) providing input for Data changes and validations.

## Discussion / Questions

#### How do we want to deal with area dependent properties?

Currently, a converter can have different properties depending on the area. The
(same) coal power plant in Germany can be more or less efficient

This creates all kinds of challenges:
* Since converters can have different efficiencies for different carriers, the
  list of property specs per country quickly explodes.
* Hard to track where properties come from and redundant data.
* More maintenance

##### Possible solutions:

1. Making graph the unique difference point for areas, and creating sub graphs,
   so that we can reuse parts of it in other graphs.

   Of course, nodes can occur in different graphs, so that e.g. the Netherlands
   uses 500 nodes in a certain order, while Germany has 800, of which 400 are
   the same.

   Difficulties:
   * What to do with Gqueries that refer to Nodes that do not exist anymore???


## Risks

#### 1. Wanting too much

We might be wanting to change too much so that nothing moves anymore.

We could mitigate this by being very critical on 'need-to-haves' and
'nice-to-haves'.
Or we could define some first quick wins and gain momentum by successfully 
completing these first steps.
We can also choose to temporarily remove some functionality in the ETM and
add it later in a Phase 2.

#### 2. Migration might be daunting

Migrating from current solution to the new one might be a big move. It might
be so big that we cannot find the guts or time.

We might mitigate this risk by moving in a quiet time (e.g. summer?)

#### 3. People might not want to change.

The peoples minds will have to migrate too from the old solution to the new.
Some things will not be possible any more, which might lead to a lot of
complaints or a pessimistic atmosphere.

We can mitigate this by pointing out the benefits of leaving behind the 
InputExcel, which is universally seen as a 'sub-optimal' solution.




[Turbine]: https://github.com/quintel/turbine
[Refinery]: https://github.com/quintel/refinery
[ETSource]: https://github.com/quintel/etsource
[ETEngine]: https://github.com/quintel/etengine
