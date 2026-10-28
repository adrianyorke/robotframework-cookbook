language: fi

*** Settings ***
Documentation    CONTEXT:
...              You would like to learn the new syntax features which were
...              introduced in Robot Framework 6, such as the AS alias for
...              importing libraries and the new Test Tags and Keyword Tags
...              settings.
...              DISCUSSION:
...              Robot Framework 6 introduced a set of new syntax features
...              that make test scripts shorter and more consistent.
...              - AS is the new way to import a library with an alias.
...              # Deprecated in RF 6.0:    Import Library    Collections    WITH NAME    C
...              Import Library    Collections    AS    C
...              - The Force Tags setting has been renamed to Test Tags.
...              This recipe uses Test Tags for the py3.11 and py3.12 tags.
...              - Keyword Tags is a new setting which tags all keywords in
...              the suite file or a resource file.  It is used in this
...              recipe to tag the Log Recipe keyword below.
...              This recipe demonstrates each feature with a small test case
...              that uses the Collections library and built-in keywords.
...              - Robot Framework 6 supports localization.  The language
...              of a suite can be changed with the language: fi syntax and
...              this recipe uses the Finnish language to demonstrate
...              localized Boolean values such as Tosi and Kyllä.
...              Run the recipe and closely examine the log to see the new
...              commands.
...              SEE ALSO:
...              Recipe 16.2 Robot Framework 5 - New Syntax
...              src/section_16/recipe162_rf5_new_syntax.robot
...              Robot Framework 6 Release Notes
...              https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.0.rst
...              Related Issue(s):
...              https://github.com/adrianyorke/robotframework-cookbook/issues/71
Test Tags        py3.11    py3.12
Keyword Tags     rf6

*** Variables ***
${recipe}         Recipe 16.3 Robot Framework 6 - New Syntax
${level}          Beginner
${category}       Robot Framework 6

*** Test Cases ***
Check Import Library With AS Alias
    Import Library    Collections    AS    C
    ${d} =    Create Dictionary    name    Adrian    role    cook
    ${keys} =    C.Get Dictionary Keys    ${d}
    Should Contain    ${keys}    name
    Should Contain    ${keys}    role

Check Set To Dictionary And Get Dictionary Items
    ${d} =    Create Dictionary
    C.Set To Dictionary    ${d}    a=1    b=2
    ${items} =    C.Get Dictionary Items    ${d}
    Should Contain    ${items}    a
    C.Dictionary Should Contain Item    ${d}    a    1
    Log Recipe

Check Localized Boolean
    Should Be Equal    Tosi    ${True}    types=boolean
    Should Be Equal    Ei    ${False}    types=boolean

*** Keywords ***
Log Recipe
    Log    ${recipe}
    Log    ${level}
    Log    ${category}
