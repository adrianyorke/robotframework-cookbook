*** Settings ***
Documentation    PROBLEM:
...              You want to reduce the overall test execution time and run all test cases
...              within a test suite in parallel using parallel executor (pabot).
...              DISCUSSION:
...              When you run tests with pabot it will create a results directory
...              (pabot_results) in the current working directory and a hidden file that
...              contains execution details (.pabotsuitenames).
...              Test case 2 & 4 are expected to fail.  This demonstrates how the failure of
...              test cases does not affect the execution or success of other test cases.
...              This recipe also demonstrates installing and using an external library.
...              A library keyword is not required as you execute the test suite using
...              the pabot shell command.
...              Sample shell command:
...              $ pabot --testlevelsplit recipe121_running_tests_in_parallel.robot
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-pabot

*** Variables ***
${recipe}         Recipe 121 Running Tests in Parallel
${level}          Intermediate
${category}       External Library: pabot
${DELAY}          10

*** Test Cases ***
Test Case 1
    Log      Starting Test Case 1 using delay ${DELAY}
    Sleep    ${DELAY}

Test Case 2
    Log      Starting Test Case 2 using delay ${DELAY}
    Sleep    ${DELAY}
    Should Be Equal    foo    bar

Test Case 3
    Log      Starting Test Case 3 using delay ${DELAY}
    Sleep    ${DELAY}

Test Case 4
    Log      Starting Test Case 4 using delay ${DELAY}
    Sleep    ${DELAY}
    Should Be Equal    foo    bar
