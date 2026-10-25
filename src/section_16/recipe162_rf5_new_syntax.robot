*** Settings ***
Documentation    CONTEXT:
...              You would like to learn the new syntax features which were
...              introduced in Robot Framework 5, such as native TRY and EXCEPT,
...              WHILE loops, the RETURN statement, BREAK and CONTINUE.
...              DISCUSSION:
...              Robot Framework 5 introduced a set of new syntax features that
...              make test scripts shorter and more readable.  Previously, these
...              behaviours required workarounds with keywords such as
...              'Run Keyword And Expect Error' or nested IF statements.
...              - Native TRY, EXCEPT and FINALLY blocks for error handling.
...              - Native WHILE loops, which run a block of commands while a
...              condition remains true.
...              - The RETURN statement, which ends a test case or keyword
...              early, and which can return a value from a keyword.
...              - Inline IF, which fits a whole conditional on a single line.
...              - BREAK and CONTINUE, which leave a loop early or skip to the
...              next iteration.
...              This recipe demonstrates each feature with a small test case
...              that uses only built-in keywords.  Run the recipe and closely
...              examine the log to see the new commands.
...              SEE ALSO:
...              Recipe 16.1 Robot Framework 4 - New Syntax
...              https://github.com/adrianyorke/robotframework-cookbook
...              Robot Framework 5 Release Notes
...              https://robotframework.org/robotframework/latest/RobotFramework-5-Release-Notes.html
...              Issue 61
...              https://github.com/adrianyorke/robotframework-cookbook/issues/61
Test Tags        py3.11    py3.12

*** Variables ***
${recipe}         Recipe 16.2 Robot Framework 5 - New Syntax
${level}          Beginner
${category}       Robot Framework 5

*** Test Cases ***
Check TRY EXCEPT and FINALLY
    TRY
        ${result} =    Evaluate    10 / 0
    EXCEPT    ZeroDivisionError
        Log    ZeroDivisionError was expected.
    EXCEPT
        Log    Some other exception was raised.
    FINALLY
        Log    FINALLY always runs, even when the TRY block fails.
    END

Check WHILE Loop
    ${i} =    Set Variable    1
    ${total} =    Set Variable    0
    WHILE    ${i} <= 5
        Log    Iteration ${i}
        ${total} =    Evaluate    ${total} + ${i}
        ${i} =    Evaluate    ${i} + 1
    END
    Should Be Equal As Integers    ${total}    15

Check BREAK
    ${i} =    Set Variable    1
    WHILE    True
        Log    Counting ${i}
        ${i} =    Evaluate    ${i} + 1
        IF    ${i} == 5
            Log    BREAK leaves the loop early.
            BREAK
        END
    END
    Should Be Equal As Integers    ${i}    5

Check CONTINUE
    ${i} =    Set Variable    1
    ${count} =    Set Variable    0
    WHILE    ${i} <= 5
        ${i} =    Evaluate    ${i} + 1
        IF    ${i} == 4
            Log    CONTINUE skips the rest of iteration ${i - 1}.
            CONTINUE
        END
        Log    Processing iteration ${i - 1}
        ${count} =    Evaluate    ${count} + 1
    END
    Should Be Equal As Integers    ${count}    4

Check RETURN
    ${result} =    Determine Result    42
    Should Be Equal    ${result}    Passed

Check Inline IF
    ${score} =    Set Variable    87
    ${label} =    Run Keyword If    ${score} >= 90    Set Variable    Distinction
    ...             ELSE IF    ${score} >= 70    Set Variable    Merit
    ...             ELSE        Set Variable    Pass
    Log    Classic inline IF gives ${label}
    Should Be Equal    ${label}    Merit

Check General Inline IF
    # Requires Robot Framework 6.1 or newer.
    ${score} =    Set Variable    87
    ${label} =    IF    ${score} >= 90    Set Variable    Distinction
    ...           ELSE IF    ${score} >= 70    Set Variable    Merit
    ...           ELSE    Set Variable    Pass
    Log    General inline IF gives ${label}
    Should Be Equal    ${label}    Merit

*** Keywords ***
Determine Result
    [Arguments]    ${value}
    IF    ${value} != 42
        Log    Early RETURN for an unexpected value.
        RETURN    Failed
    END
    Log    Value is 42, continuing to the final RETURN.
    RETURN    Passed
