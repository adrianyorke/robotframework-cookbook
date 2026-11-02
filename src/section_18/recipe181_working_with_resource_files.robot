*** Settings ***
Documentation    CONTEXT:
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
...              Resource files documentation: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#resource-files
...              BuiltIn library also has keywords for creating lists and dictionaries, checking
...              length or count and checking membership or equality.
Library          Collections
Resource         resource.resource
Test Tags        py3.11    py3.12

*** Variables ***
${recipe}        Recipe 18.1 Working With Resource Files
${level}         Intermediate
${category}      Internal Library: Collections

*** Test Cases ***
Lists Lists Lists
   ${list} =          Create List    a    b    c
   @{also_list} =     Set Variable   a   b   c
   Eat One List       ${also_list}
   Eat Many Values    @{list}
   Eat Many Values    d   e   @{also_list}
   ${a} =             Create List    a
   @{bc} =            Set Variable    b    c
   Log ABC            ${a}    @{bc}
