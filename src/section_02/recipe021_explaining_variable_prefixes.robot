*** Settings ***
Documentation    PROBLEM:
...              You are confused by variable prefixes in Robot Framework and don't know which
...              one to use and when.
...              DISCUSSION:
...              This is a common problem for test engineers new to Robot Framework but it's not
...              difficult once you understand what each prefix does.
...              Run this recipe and closely examine the results in the log.
...              Scalar variables start with $ prefix and should be considered a single value.
...              The @ prefix is similar to the * (expansion or unpacking) operator in Python.
...              Ruby and Perl developers will be familiar with the term "splat".
...              JavaScript community will know this as the spread operator.
...              This recipe also demonstrates how to create your own user keywords and use
...              these in your test cases without needing to create lower level library keywords
...              using Java or Python.
...              SEE ALSO:
...              BuiltIn library also has keywords for creating lists and dictionaries, checking
...              length or count and checking membership or equality.
Library          Collections
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 2.1 Explaining Variable Prefixes
${level}          Beginner
${category}       Internal Library: Collections

*** Test Cases ***
Lists Lists Lists
   ${list} =    Create List    a    b    c
   @{also_list} =     Set Variable   a   b   c
   Eat One List      ${also_list}
   Eat Many Values   @{list}
   Eat Many Values   d   e   @{also_list}
   ${a} =    Create List    a
   @{bc} =    Set Variable    b    c
   Log ABC    ${a}    @{bc}

*** Keywords ***
Eat One List
   [Arguments]    ${li}
   Log Many    @{li}
   Log         ${li}

Eat Many Values
   [Arguments]   @{li}
   Log Many    @{li}
   Log         ${li}

Log ABC
   [Arguments]    ${a}    @{bc}
   Log   ${a}
   Log   ${bc}[0]
   Log   ${bc}[1]
