*** Settings ***
Documentation    PROBLEM:
...              You would like to test the native IF, ELSE and ELSE IF syntax which was
...              introduced in Robot Framework 4.
...              DISCUSSION:
...              Robot Framework 4 introduced native IF, ELSE and ELSE IF syntax.  Previously, it
...              was necessary to use the 'Run Keyword If' keyword which made test scripts more
...              difficult to read and understand.
...              Run this recipe and closely examine the log.  Please note: you must use
...              Robot Framework 4 to run this recipe.  Notice the new column Skip in the
...              Test Statistics table in the log output.  Also Pass/Fail/Skip column now includes
...              Skip statistics.
...              Observe the IF, ELSE and ELSE IF native commands.  Where a condition has not
...              been met, the command will be greyed out.  Otherwise the command will be green
...              to show the path taken by the logic.
...              SEE ALSO:
...              Recipe 3.1 Handling Dates
...              https://github.com/robotframework/robotframework/issues/3074
Library          DateTime
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 95.1 Robot Framework 4 Native IF, ELSE, ELSE IF Syntax
${level}          Beginner
${category}       Robot Framework 4
${answer}         42

*** Test Cases ***
Check Basic IF
    IF    ${answer} == 42
        Log    Answer to the Ultimate Question of Life, the Universe, and Everything.
    END

Check ELSE
    ${date} =    Get Current Date    result_format=datetime
    Log    Month = ${date.month}
    IF    ${date.month} < 7
        Log    First Half of Year
    ELSE
        Log    Second Half of Year
    END

Check ELSE IF
    ${date} =    Get Current Date    result_format=datetime
    Log    Hour is ${date.hour}
    IF    ${date.hour} < 12
        Log    Good morning!
    ELSE IF    ${date.hour} < 18
        Log    Good afternoon!
    ELSE
        Log    Good evening!
    END
