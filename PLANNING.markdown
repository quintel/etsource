# The Road towards a better InputTool

## Main objective

The project 'towards a better InputTool' is primary concerned with replacing
the current Excel file and optimizing the input and permutations.

Reasons why:
* Currently it is hard to manage data without any version control being
available in Excel.
* Furthermore, there is no (proper) debugging.
* Unit tests in Excel.

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

1. **Proof of Concept** that we can build up a graph easily and transparantly. **DONE**
   with [Turbine].
2. **Proof of Concept** that we can reproduce the ability of the current InputExcel to
   generate `preset_demands` from `final_demands` in the graph. **88% DONE**
with Refinery.
3. `new` Build the current ETSource graph in Turbine/Refinery. **DONE**
4. `new` Calculate the current ETSource graph with Refinery. **33% DONE**
5. `new` Start abstracting final_demands from Energy Balances. **DONE** with
   ETSource. **HELP WANTED FROM WOUTER/CHAEL**
5. `new` Refinery validations
5. `new` Refinery efficiencies
6. `new` Adding DataSet and making that top level for other objects.
7. Abstracting technology shares and application shares to ETSource.
8. Abstracting production characteristics to ETSource.
9. Abstracting converter efficiencies for other areas.
10. All other stuff (such as costs, energy balance group colors, whatever).
11. Map country-specific data/adjustments from ETSource. (Area)
12. Clean library-style imports from ETSource/Refinery in ETEngine.
13. Validating demands with EnergyBalance `primary_demands`

### Data Integrity and moving data

1. **Proof** that we can use validations on objects. **DONE**
2. Create foundations for the data mapper **DONE**
3. `waiting` Define subclassed for Converters/Nodes and experiment with Concerns
   (instance mixins) **WAITING ON CHAEL AND WOUTER**
4. Split Topoplogy into files per sector
5. Split converters into one file per converter
6. Port converters attributes to ETSource ( **Q**: and think about what need to
   be changed? attributes <-> methods?)

### Clean up old stuff

1. Delete excess stuff on ETSource, ETEngine

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
