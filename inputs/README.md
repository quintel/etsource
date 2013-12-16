# Inputs

Inputs are **update procedures** that are stored in a file. If the
user wants to change the number of `agriculture_chp_engine_biogas` he can use
number_of_agriculture_chp_engine_biogas.ad (coupled to a slider)
to accomplish this.

Sliders in the front-end are linked to inputs through the **key** of the input.
This key is simply the name of the file (minus the .ad extention).

## General structure of an input

An input can contain the following items:

* **comments**: preceded by '#' (optional)
* **query**: This is the most complex part of the input. It contains the 
instructions to the engine about **what** to update and by **how much**.
The syntax is similar to GQL but has some unique keywords such as
  * UPDATE
  * EACH
  * USER_INPUT(): refers to the slider position
  * ... 
* **priority**: This number should be larger than or equal to 0.
Larger values tell the engine to execute the input **prior** to inputs with 
lower values (required)
* **max_value**: hard-coded maximum for the slider (required in absence of 
`max_value_gql`)
* **min_value**: hard-coded minimum for the slider (required in absence of 
`min_value_gql`)
* **max_value_gql**: gquery that dynamically determines the maximum of a slider
(required in absence of `max_value`)
* **min_value_gql**: gquery that dynamically determines the minimum of a slider
(required in absence of `min_value`)
* **start_value**: hard-coded initial position of a slider (
required in absense of `start_value_gql`)
* **start_value_gql**: gquery to determine the initial position of a slider (
required in absense of `start_value`)
* **step_value**: determines the step-size of the slider (required)
* **unit**: unit of the slider (%, MJ, etc)
* **update_period**: whether the input updates the "future" or the "present"
graph (required)
* **update_type**: (optional, defaults to "**update with absolute number**")
one of of the following
 * absolute number (default): y = x
 * growth percentage: y = y * (1 + x)
 * yearly growth: y = y * (1 + x)^(duration of scenario in years)

We will not give an exhaustive description of the syntax here and advice the 
user to learn from existing input statements rather than from this text.

An example:

    # The max value is dynamically determined by how many CHPs would be build if
    # all of the electricity demand would be supplied by this specific CHP.

    - query =
        EACH(
          UPDATE(V(agriculture_chp_engine_network_gas), number_of_units, USER_INPUT()),
          UPDATE(OUTPUT_LINKS(V(agriculture_chp_engine_network_gas),constant), share, V(agriculture_chp_engine_network_gas, production_based_on_number_of_units)),
        )
    - priority = 0
    - max_value = 1214.0
    - max_value_gql = present:Q(maximum_number_of_chps_in_agriculture)
    - min_value = 0.0
    - start_value_gql = present:V(agriculture_chp_engine_network_gas,number_of_units)
    - step_value = 0.1
    - unit = #
    - update_period = future

## Folder structure

Inputs have been subdivided into the following main folders, which roughly
correspond to the sidebar items:

* costs
* demand
* misc
* modules
* supply
* targets
