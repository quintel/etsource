# The Road to a better InputTool

## Objective

The project 'to a better InputTool' is primary concerned with replacing the
current Excel file and optimizing the input and permutations that happen to it.

### List of sub objectives

* `need` Defining the Graph structure with Version Control (VC)
* `nice` Cut up the definition of the Graph in subgraph which can be added to
  each other (e.g. households etc.) to make it more managable.
* `need` Read the Final Demand energy balance values and link them to the
  appropiate converter(s).
* `nice` Use standardized Energy Balances for different countries
* `need` A clean object mapper for the fundamental objects, such as converters,
  links, graphs, energy balances etc in order to make e.g. validations happen
* `need` Validations of input data (e.g. is everything defined that we need?,
  are there no loose ends?)
* `need` Division up of Converters into Nodes, Converters, UsefulDemandNodes,
  FinalDemandNodes, etc in order to make validations manageable.
* `need` Define technology/market shares and application shares in an
  understable and standardized way
* `need` Being able to import/load all the required objects from ETSource.

Later, we want *other* people from outside of Quintel also to work more closely
with datasets. This will have to be taken into account when making our design
choices.

## Road Map / Planning

In this project the challenges we have can be subdivised in two flavors:
(1) Mapping data to graph: the technological challenge of mapping and
transposing data to our Graph structure. (2) Making sure that the data is
sound, and that we can run validations, mass updates etc.

### Mapping Data to Graph

1. **Proof** that we can build up a graph easily and transparantly. **DONE**
   with Turbine
2. **Proof** that we can reproduce the ability of the current InputExcel to
   generate `preset_demands` from `final_demands` in the graph. **80% DONE**
with Refinery
3. Start abstracting final_demands from Energy Balances. **20% DONE** with
   ETSource
4. Start abstracting technology shares and application shares to ETSource.
5. Clean library-style imports from ETSource/Refinery in ETEngine

### Data Integrity and moving data

This borders the projects Dataset Restructuring that Alexander and Wouter are
working on.

1. **Proof** that we can use validations on objects. **DONE**
2. Create the foundations for the data mapper **DONE**
3. Define subclassed for Converters/Nodes and experiment with Concerns
   (instance mixins)
4. Split Topoplogy in files per sector
5. Split converters in one file per converter
6. Port converters attributes to ETSource ( **Q**: and think about what need to
   be changed? attributes <-> methods?)

### Timing

To be added later when list of activities is complete we can start making an
estimate of time of migration.

## Current situation (IST analysis)

In order to understand what we are replacing, we should thing about the curent
responsabilities of the InputExcel and the Datasets.

### InputExcel

The InputExcel file has the following responsibilities:
* Defining
  * `converters`, amongst which "final demand"
  * `links`
  * `energy_balance_groups`
* Defining the structure of the graph
  * (between which converters?, what kind of links?)
* Calculating the Final Energy Demand back to Usefull Energy Demand
* Taking input from a 'Dataset' and use that for defining attributes

### Datasets

Currenly, the datasets are another Excel files, many of them are outdated. They
basically list and permutate attributes for Converters and links (shared), put
them in one big column which can be copy-pasted (or linked) to the
InputExcel.

**NOTE:** curently, a strict separation between dataset and inputexcel does not
exist: sometimes data is defined and 'lives' in the InputExcel.

## Applications/Libraries involved:

Currenly we the following applications:

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

Of course, everybody from Quintel in involved, but most importantly:

* Dennis Schoenmakers: project manager (~0.4 FTE)
* Anthony Williams: Driving Technical Developer, Quality Assurance  (1 FTE)
* Chael Kruip: Advisor on how current solution works and future
  user of the product(s) (~0.3 FTE)
* Alexander Wirtz: Furture user of the product(s) and manager of Dataset
  Restructuring (~0.1 FTE)
* Wouter Meyers: (~0.1 FTE) providing input for Data changes and validations.

## Risks

List of risks, and the ideas to do something with them:

#### 1. Wanting too much

We might be waning to change to much so that nothing moves anymore.

We could mitigate this by being very critical on 'need-to-haves' and
'nice-to-haves'.

#### 2. Migration might be daunting

Migrating from current solution to the new one might be a big move. It might
be so big that we cannot find the guts or time.

We might mitigate this risk by moving in a quiet time (e.g. summer?)

#### 3. People might not want to change.

The peoples minds will have to migrate too from the old solution to the new.
Some things will not be possible any more, which might lead to a lot of
complaints or a pessimistic atmosphere.

### Clean up old stuff

1. Delete excess stuff on ETSource, ETEngine

### Documentation and Training

1. Create proper documentation (if not already exists) on the technology and
   the use of the different parts of the new solution.
2. Explaing to others how the new stuff works in a presentation

### Wrap up

1. Create recommendations for next project
2. File debts


[Turbine]: https://github.com/quintel/turbine
[Refinery]: https://github.com/quintel/refinery
[ETSource]: https://github.com/quintel/etsource
[ETEngine]: https://github.com/quintel/etengine
