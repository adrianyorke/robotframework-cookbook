# <img src="/img/logo_b+w_transparent.png" width="100"/><br>robotframework-cookbook

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-12-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
[![Actions Status](https://github.com/adrianyorke/robotframework-cookbook/workflows/Continuous%20integration/badge.svg)](https://github.com/adrianyorke/robotframework-cookbook/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/adrianyorke)


A curated list of delicious Robot Framework recipes that will help you develop new test automation scripts faster, especially for beginner or intermediate level engineers.

If you need help writing Robot Framework scripts or wish to update older scripts to use newer syntax then you have come to the right place.  Here we will compile and maintain recipes of working Robot Framework scripts that can be used in your domain.

In the first part of the cookbook there are many simple recipes showing how to use builtin keywords and additional keywords from both internal and external Robot Framework libraries.  Towards the back of the cookbook there are complete case studies demonstrating whole projects and test automation solutions.

# Other useful resources
* [Robot Framework Organization](https://robotframework.org/)
* [Beginners Guide to Robot Framework](https://github.com/robotframework/BeginnersGuide)
* [Robot Framework Quick Start Guide](https://github.com/robotframework/QuickStartGuide/blob/master/QuickStart.rst)
* [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
* [Robot Framework documentation](https://robotframework.org/robotframework/)
* [GitHub (Documentation, Source Code & Issue Tracker)](https://github.com/robotframework/robotframework)
* [Awesome Robot Framework](https://github.com/fkromer/awesome-robotframework)
* [Robot Framework - Learn the basics](https://dev.szabolcstoth.eu/robotframework-basics/)
* [Robot Framework Cheat Sheet and Quick Reference (credit: robocorp)](https://robocorp.com/docs/languages-and-frameworks/robot-framework/cheat-sheet)

# Notes for contributors
Contributions from the wider community are most welcome!  Contributions can be either single recipes or whole case studies.

We recommend using [Robotidy](https://robotidy.readthedocs.io/en/latest/) to help standardise the format of the Robot Framework code.

We also recommend using the [Robot Framework Robocop](https://github.com/MarketSquare/robotframework-robocop) static analysis tool to check your scripts are clean before submission.
Robocop can be installed using pip:
> $ pip install -U robotframework-robocop

[Issues](https://github.com/adrianyorke/robotframework-cookbook/issues) are welcome and you can use them to post ideas for new recipes or report bugs and other observations for exisiting recipes.

For larger submissions simply clone this repository, create a feature branch (or work directly on master) and submit a pull request to merge your branch.  If you are not comfortable with Git workflow then simply post your submission on the [#cookbook](https://app.slack.com/client/T07PJQ9S7/CU5RQ87K3) Slack channel and I will help you publish your recipe or case study.

# Table of contents
1. Standard Library - [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)<br>
   * [Recipe 1.1 - Hello World Logging](src/section_01/recipe011_hello_world_logging.robot)<br>
   * [Recipe 1.2 - For Loop](src/section_01/recipe012_looping.robot)<br>
1. Standard Library - [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html)
   * [Recipe 2.1 - Explaining Variable Prefixes](src/section_02/recipe021_explaining_variable_prefixes.robot)<br>
   * [Recipe 2.2 - Handling Lists](src/section_02/recipe022_handling_lists.robot)<br>
   * [Recipe 2.3 - Handling Dictionaries](src/section_02/recipe023_handling_dictionaries.robot)<br>
1. Standard Library - [DateTime](https://robotframework.org/robotframework/latest/libraries/DateTime.html)
   * [Recipe 3.1 - Handling Dates](src/section_03/recipe031_handling_dates.robot)<br>
1. Standard Library - OperatingSystem
   * [Recipe 4.1 - Working With File System](src/section_04/recipe041_working_with_file_system.robot)<br>
1. Standard Library - [Process](https://robotframework.org/robotframework/latest/libraries/Process.html)
1. Standard Library - Remote
1. Standard Library - [String](https://robotframework.org/robotframework/latest/libraries/String.html)
   * [Recipe 7.1 - String Manipulation Examples](src/section_07/recipe071_string_manipulation_examples.robot)<br>
1. Standard Library - [XML](https://robotframework.org/robotframework/latest/libraries/XML.html)
1. External Library - REST API
   * [Recipe 9.1 - Working With Requests Library](src/section_09/recipe091_working_with_requests_library.robot)<br>
   * [Recipe 9.2 - Working With RESTinstance Library](src/section_09/recipe092_working_with_rest_library.robot)<br>
   * [Recipe 9.3 - Working With Browser Library](src/section_09/recipe093_working_with_browser_library.robot)
1. External Library - Databases
   * [Recipe 10.1 - Working With Databases](src/section_10/recipe101_working_with_databases.robot)<br>
   * [Recipe 10.2 - Hacking Database View](src/section_10/recipe102_hacking_database_view.robot)<br>
1. External Library - [SSH](https://github.com/robotframework/SSHLibrary)
   * [Recipe 11.1 - Working With SSH](src/section_11/recipe111_working_with_ssh_library.robot)<br>
   * [Recipe 11.2 - Retrieve Output from SSH Run Command](src/section_11/recipe112_retrieve_output_file_of_ssh_run_command.robot)<br>
1. External Library - [Parallel executor for Robot Framework test cases (pabot)](https://github.com/mkorpela/pabot)<br>
   * [Recipe 12.1 - Running Tests in Parallel](src/section_12/recipe121_running_tests_in_parallel.robot)<br>
1. External Library - [SeleniumLibrary](https://github.com/robotframework/seleniumlibrary) and [SeleniumTestability](https://github.com/rasjani/robotframework-seleniumtestability)
   * [Recipe 13.1 - SeleniumLibrary & SeleniumTestability setup](src/section_13/recipe131_selenium_setup.robot)<br>
1. External Library - [AWSLibrary - for interacting with Amazon Web Services (AWS) Cloud Computing Services](https://github.com/teaglebuilt/robotframework-aws)
   * [Recipe 14.1 - AWS Simple Storage Service (S3)](src/section_14/recipe141_aws_simple_storage_service.robot)<br>
1. External Library - [Robot Framework Browser library powered by Playwright.](https://github.com/MarketSquare/robotframework-browser)
   * [Recipe 15.1 - Working With Browser Contexts](src/section_15/recipe151_working_with_browser_contexts.robot)<br>
1. Robot Framework 4
   * [Recipe 95.1 - Robot Framework 4 Native IF, ELSE, ELSE IF Syntax](src/section_95/recipe951_rf4_native_if_else_elseif.robot)<br>
1. Case Studies
   * [Case Study 01 - Regression Testing Gerald Ford International Airport (GFIA) Parking Lot Calculation Tool](src/section_99/casestudy_01/README.md)<br>
   * [Case Study 02 - Transcoding video library to a contemporary format suitable for all play back devices, e.g. mp4 or mkv](src/section_99/casestudy_02/README.md)<br>

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/adrianyorke"><img src="https://avatars1.githubusercontent.com/u/30093433?v=4?s=100" width="100px;" alt="Adrian Yorke"/><br /><sub><b>Adrian Yorke</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=adrianyorke" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=adrianyorke" title="Documentation">📖</a> <a href="#maintenance-adrianyorke" title="Maintenance">🚧</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/pulls?q=is%3Apr+reviewed-by%3Aadrianyorke" title="Reviewed Pull Requests">👀</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://www.tompurl.com"><img src="https://avatars1.githubusercontent.com/u/588713?v=4?s=100" width="100px;" alt="Tom Purl"/><br /><sub><b>Tom Purl</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=tompurl" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=tompurl" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://szabolcstoth.eu"><img src="https://avatars3.githubusercontent.com/u/1639751?v=4?s=100" width="100px;" alt="Szabolcs Tóth"/><br /><sub><b>Szabolcs Tóth</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=szabolcstoth" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=szabolcstoth" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://rasjani.github.io"><img src="https://avatars3.githubusercontent.com/u/27887?v=4?s=100" width="100px;" alt="Jani Mikkonen"/><br /><sub><b>Jani Mikkonen</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=rasjani" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=rasjani" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/bhirsz"><img src="https://avatars3.githubusercontent.com/u/8532066?v=4?s=100" width="100px;" alt="Bartłomiej Hirsz"/><br /><sub><b>Bartłomiej Hirsz</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=bhirsz" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=bhirsz" title="Documentation">📖</a> <a href="#maintenance-bhirsz" title="Maintenance">🚧</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/pulls?q=is%3Apr+reviewed-by%3Abhirsz" title="Reviewed Pull Requests">👀</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/tuxmux28"><img src="https://avatars1.githubusercontent.com/u/2794048?v=4?s=100" width="100px;" alt="Christoph"/><br /><sub><b>Christoph</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=tuxmux28" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=tuxmux28" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/mkorpela"><img src="https://avatars1.githubusercontent.com/u/136885?v=4?s=100" width="100px;" alt="Mikko Korpela"/><br /><sub><b>Mikko Korpela</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=mkorpela" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=mkorpela" title="Documentation">📖</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/ericbjones"><img src="https://avatars2.githubusercontent.com/u/1847952?v=4?s=100" width="100px;" alt="ericbjones"/><br /><sub><b>ericbjones</b></sub></a><br /><a href="#design-ericbjones" title="Design">🎨</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=ericbjones" title="Code">💻</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=ericbjones" title="Documentation">📖</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://emnaayadi.wordpress.com/"><img src="https://avatars.githubusercontent.com/u/6690738?v=4?s=100" width="100px;" alt="Emna Ayadi"/><br /><sub><b>Emna Ayadi</b></sub></a><br /><a href="#userTesting-emna24" title="User Testing">📓</a> <a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=emna24" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://medium.com/@joonasvenlinen"><img src="https://avatars.githubusercontent.com/u/38143731?v=4?s=100" width="100px;" alt="Joonas Venäläinen"/><br /><sub><b>Joonas Venäläinen</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=joonvena" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/olakowalczyk"><img src="https://avatars.githubusercontent.com/u/60587401?v=4?s=100" width="100px;" alt="Aleksandra Kowalczyk"/><br /><sub><b>Aleksandra Kowalczyk</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=olakowalczyk" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/kiblik1"><img src="https://avatars.githubusercontent.com/u/12598836?v=4?s=100" width="100px;" alt="Martin Škopek"/><br /><sub><b>Martin Škopek</b></sub></a><br /><a href="https://github.com/adrianyorke/robotframework-cookbook/commits?author=kiblik1" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
