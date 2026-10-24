*** Settings ***
Documentation    CONTEXT:
...              You want to implement basic FOR loop or WHILE loop logic.
...              DISCUSSION:
...              FOR loop syntax is available as part of the built-in standard library.
...              Robot Framework 5.0 introduced native WHILE syntax. For versions
...              without it, a WHILE loop can be simulated using the Exit For Loop If keyword as
...              the first statement within a bounded FOR loop.
...              The final test case demonstrates a native WHILE loop, available since Robot Framework 5.0.
...              No Operation keyword is used to "do nothing" although you may disagee.
...              This recipe only using keywords from BuiltIn standard library so there is no Library import.
...              NOTE: the old FOR syntax should no longer be used but you may still find it in old posts.
Test Tags        py3.11    py3.12

*** Variables ***
${recipe}         Recipe 1.2 Looping
${level}          Beginner
${category}       Internal Library: BuiltIn

*** Test Cases ***
Testing FOR IN Syntax
    [Documentation]    Basic For in syntax, loops over given weekdays.
    FOR    ${weekday}    IN    monday    tuesday    wednesday    thursday    friday
        Log    ${weekday}    console=yes
    END

Testing Basic FOR Loop
    [Documentation]    Basic For loop construct, loops over values from 0 to 9.
    FOR    ${i}    IN RANGE    10
        Log    ${i}    console=yes
    END

Testing Simulated WHILE Loop (Robot Framework < 5.0)
    [Documentation]    Simulated WHILE loop construct, loops over large range appropriate within context.
    FOR    ${i}    IN RANGE    9999
        Exit For Loop If    ${i} == 10
        No Operation
    END

Testing Native WHILE Loop (Robot Framework >= 5.0)
    [Documentation]    Native WHILE loop construct, loops over large range appropriate within context.
    ${i}    Set Variable    10
    WHILE    ${i} > 1
        Log    ${i}    console=yes
        ${i}    Evaluate    ${i} - 1
    END
    Should Be Equal As Integers    ${i}    1
