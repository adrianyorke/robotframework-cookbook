*** Settings ***
Documentation    CONTEXT:
...              You would like to learn the new syntax features which were
...              introduced in Robot Framework 7, such as the native VAR syntax
...              and the ability to remove tags with the '-tag' syntax.
...              DISCUSSION:
...              Robot Framework 7 introduced a set of new syntax features that
...              make test scripts shorter and more readable.  Previously, these
...              behaviours required workarounds with keywords such as
...              'Set Variable' or the deprecated 'Default Tags' setting.
...              - Native VAR syntax makes it possible to create variables
...              dynamically during execution.  Variables can be created in
...              different scopes, as lists or dictionaries and with long
...              values.
...              - Individual tests and keywords can remove tags that have been
...              set in the Settings section with the Test Tags or Keyword Tags
...              settings by using the '-tag' syntax with their own [Tags] setting.
...              This recipe demonstrates each feature with a small test case
...              that uses only built-in syntax.  Run the recipe and closely
...              examine the log to see the new commands.
...              SEE ALSO:
...              Recipe 16.3 Robot Framework 6 - New Syntax
...              src/section_16/recipe163_rf6_new_syntax.robot
...              Robot Framework 7 Release Notes
...              https://robotframework.org/robotframework/latest/RobotFramework-7-Release-Notes.html
...              Issue 133
...              https://github.com/adrianyorke/robotframework-cookbook/issues/133
Test Tags        py3.11    py3.12    regression
Keyword Tags     rf7

*** Variables ***
${recipe}         Recipe 16.4 Robot Framework 7 - New Syntax
${level}          Beginner
${category}       Robot Framework 7

*** Test Cases ***
Check Native VAR Syntax
    VAR    ${local}    value
    Should Be Equal    ${local}    value

Check Native VAR Syntax With Suite Scope
    VAR    ${suite}    value    scope=SUITE
    Should Be Equal    ${suite}    value

Check Native VAR Syntax With List
    VAR    @{list}    a    b    c
    ${expected} =    Evaluate    ['a', 'b', 'c']
    Should Be Equal    ${list}    ${expected}

Check Native VAR Syntax With Dictionary
    VAR    &{dict}    key=value    second=item
    Should Be Equal    ${dict}[key]    value

Check Native VAR Syntax With Conditional Creation
    VAR    ${flag}    True
    IF    ${flag}
        VAR    ${x}    true value
    ELSE
        VAR    ${x}    false value
    END
    Should Be Equal    ${x}    true value

Check Remove Tag Using Minus Tag Syntax
    [Tags]    smoke    -regression
    No Operation

*** Keywords ***
Log Recipe
    Log    ${recipe}
    Log    ${level}
    Log    ${category}
