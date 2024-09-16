*** Settings ***
Documentation    PROBLEM:
...              You want to implement basic FOR loop or WHILE loop logic.
...              DISCUSSION:
...              FOR loop syntax is available as part of the built-in standard library.
...              There is no specific WHILE syntax but it can be simulated using the
...              Exit For Loop If keyword as the first statement within a
...              large iteration FOR loop.
...              No Operation keyword is used to "do nothing" although you may disagee.
...              This recipe only using keywords from BuiltIn standard library so there is no Library import.
...              NOTE: the old FOR syntax should no longer be used but you may still find it in old posts.
Test Tags        py3.10    py3.11

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

Testing Basic FOR Loop (New Syntax)
    [Documentation]    Basic For loop construct, loops over values from 0 to 9.
    FOR    ${i}    IN RANGE    10
        Log    ${i}    console=yes
    END

Testing WHILE Loop
    [Documentation]    Simulated WHILE loop construct, loops over large range appropriate within context.
    FOR    ${i}    IN RANGE    999999
        Exit For Loop If    ${i} == 10
        No Operation
    END
