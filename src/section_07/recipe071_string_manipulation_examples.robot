*** Settings ***
Documentation     PROBLEM:
...               You want to process strings within a Robot Framework test case
...               without using lower level Python code or develop a custom library.
...               DISCUSSION:
...               This recipe demonstrates:
...               - using keywords from the String library
Library           String

*** Variables ***
${recipe}         Recipe 7.1 String Manipulation Examples
${category}       Internal Library: String

*** Test Cases ***
Check Title Case Convertions
    [Documentation]    Output variables & text messages to the log, console or both.
    ${str1} =    Convert To Title Case    harry potter
    ${str2} =    Convert To Title Case    hermione granger
    ${str3} =    Convert To Title Case    ron weasley
    ${str4} =    Convert To Title Case    rubeus hagrid
    Should Be Equal    ${str1}    Harry Potter
    Should Be Equal    ${str2}    Hermione Granger
    Should Be Equal    ${str3}    Ron Weasley
    Should Be Equal    ${str4}    Rubeus Hagrid
