# robotframework-cookbook
A curated list of delicious Robot Framework recipes that will help you develop new test automation scripts faster, especially for beginner or intermediate level engineers.

If you need help writing Robot Framework scripts or wish to update older scripts to use newer syntax then you have come to the right place.  Here we will compile and maintain recipes of working Robot Framework scripts that can be used in your domain.

In the first part of the cookbook there are many simple recipes showing how to use builtin keywords and additional keywords from both internal and external Robot Framework libraries.  Towards the back of the cookbook there will be complete case studies demonstrating whole projects and test automation solutions.

# Other useful resources
* [Robot Framework Organization](https://robotframework.org/)
* [Beginners Guide to Robot Framework](https://github.com/robotframework/BeginnersGuide)
* [Robot Framework Quick Start Guide](https://github.com/robotframework/QuickStartGuide/blob/master/QuickStart.rst)
* [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
* [Robot Framework documentation](https://robotframework.org/robotframework/)
* [GitHub (Documentation, Source Code & Issue Tracker)](https://github.com/robotframework/robotframework)
* [Awesome Robot Framework](https://github.com/fkromer/awesome-robotframework)

# Notes for contributors
Contributions from the wider community are most welcome!  Contributions can be either single recipes or whole case studies.

Initially, there is no CI running so please confirm any submissions are working and use `robot.tidy` to standardise the format of the scripts.

We also welcome Issues where you may post ideas for new recipes or report bugs for exisiting recipes.

For larger submissions simply clone this repository, create a feature branch and submit a pull request to merge your branch.  If you are not comfortable with Git workflow then simply post your submission on [#cookbook](https://app.slack.com/client/T07PJQ9S7/CU5RQ87K3/thread/C3C28F9DF-1582792104.080900) channel and I will help you publish your recipe or case study.

# Table of contents
1. Standard Library - [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
   * [Recipe 001 - Hello World Logging](src/section_01/recipe001_hello_world_logging.robot)
1. Standard Library - [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html)
   * [Recipe 021 - Explaining Variable Prefixes](src/section_02/recipe021_explaining_variable_prefixes.robot)
   * [Recipe 022 - Handling Lists](src/section_02/recipe022_handling_lists.robot)
   * [Recipe 023 - Handling Dictionaries](src/section_02/recipe023_handling_dictionaries.robot)
1. Standard Library - DateTime
1. Standard Library - OperatingSystem
   * [Recipe 041 - Working With File System](src/section_04/recipe041_working_with_file_system.robot)
1. Standard Library - [Process](https://robotframework.org/robotframework/latest/libraries/Process.html)
1. Standard Library - Remote
1. Standard Library - [String](https://robotframework.org/robotframework/latest/libraries/String.html)
1. Standard Library - XML
1. External Libraries - REST API
   * [Recipe 091 - Working With Requests Library](src/section_09/recipe091_working_with_requests_library.robot)
   * [Recipe 092 - Working With RESTinstance Library](src/section_09/recipe092_working_with_rest_library.robot)
1. External Libraries - Databases
   * [Recipe 101 - Working With Databases](src/section_10/recipe101_working_with_databases.robot)
   * [Recipe 102 - Hacking Database View](src/section_10/recipe102_breaking_database_view.robot)
1. External Libraries: SSH
   * [Recipe 111 - Working With SSH](src/section_11/recipe111_working_with_ssh_library.robot)
1. External Libraries: [Parallel executor for Robot Framework test cases (pabot)](https://github.com/mkorpela/pabot)
   * [Recipe 121 - Running Tests in Parallel](src/section_12/recipe121_running_tests_in_parallel.robot)
1. Case Studies
   * [Case Study 01 - Regression Testing Gerald Ford International Airport (GFIA) Parking Lot Calculation Tool](https://github.com/adrianyorke/robotframework-cookbook/blob/master/src/section_99/casestudy01_README.md)
