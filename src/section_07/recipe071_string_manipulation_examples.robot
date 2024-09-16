*** Settings ***
Documentation    PROBLEM:
...              You want to manipulate strings within a Robot Framework test case
...              without using low-level Python code or developing a custom library.
...              DISCUSSION:
...              This recipe demonstrates using keywords from String standard library.
Library          String
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 7.1 String Manipulation Examples
${level}          Beginner
${category}       Internal Library: String

*** Test Cases ***
Check Lower Case Keywords
    [Documentation]    Testing lower case string keywords.
    ${name}    Convert To Lower Case    Harry Potter
    Should Be Equal    ${name}    harry potter
    Should Be Lowercase    ${name}

Check Title Case Keywords
    [Documentation]    Testing title case string keywords.
    ${name}    Convert To Title Case    hermione granger
    Should Be Equal    ${name}    Hermione Granger
    Should Be Titlecase    ${name}

Check Upper Case Keywords
    [Documentation]    Testing upper case string keywords.
    ${name}    Convert To Upper Case    ron weasley
    Should Be Equal    ${name}    RON WEASLEY
    Should Be Uppercase    ${name}

Check Other String Keywords
    [Documentation]    Testing other string keywords.
    ${name}    Replace String    Nigel Hagrid    Nigel    Rubeus
    Should Be Equal    ${name}    Rubeus Hagrid
    Should Be String       ${name}
    @{Characters}    Split String To Characters    ${name}
