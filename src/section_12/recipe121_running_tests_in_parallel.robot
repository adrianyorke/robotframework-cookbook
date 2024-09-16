*** Settings ***
Documentation    PROBLEM:
...              You want to reduce the overall test execution time by running all test cases
...              within a test suite in parallel using parallel executor (pabot).
...              DISCUSSION:
...              When you run tests in parallel with pabot it will create a results directory
...              (pabot_results) in the current working directory and a hidden file that
...              contains execution details (.pabotsuitenames).
...              Pabot will split test execution from suite files by default so we use the
...              --testlevelsplit flag to split individual test cases.
...              Test case 2 & 4 are expected to fail.  This demonstrates how the failure of
...              a test case does not affect the execution or success of other test cases.
...              This recipe also demonstrates installing and using an external library.
...              A library keyword is not required as you execute the test suite using
...              the pabot shell command like this:
...              $ pabot --testlevelsplit recipe121_running_tests_in_parallel.robot
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-pabot
Test Tags        pabot    py3.10    py3.11

*** Variables ***
${recipe}         Recipe 12.1 Running Tests in Parallel
${level}          Intermediate
${category}       External Library: pabot
${DELAY}          5

*** Test Cases ***
Test Case 1
    Log      Starting Test Case 1 using delay ${DELAY}
    Sleep    ${DELAY}

Test Case 2
    Log      Starting Test Case 2 using delay ${DELAY}
    Sleep    ${DELAY}
    Run Keyword And Ignore Error    Should Be Equal    foo    bar

Test Case 3
    Log      Starting Test Case 3 using delay ${DELAY}
    Sleep    ${DELAY}

Test Case 4
    Log      Starting Test Case 4 using delay ${DELAY}
    Sleep    ${DELAY}
    Run Keyword And Ignore Error    Should Be Equal    foo    bar
