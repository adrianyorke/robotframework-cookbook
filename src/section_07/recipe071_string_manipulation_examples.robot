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
${level}          Beginner
${category}       Internal Library: String


*** Test Cases ***
Check Common String Manipulations
    [Documentation]    Check string manipulations working correctly.
    ${str1}    Convert To Lower Case    Harry Potter
    ${str2}    Convert To Title Case    hermione granger
    ${str3}    Convert To Upper Case    ron weasley
    ${str4}    Replace String    Nigel Hagrid    Nigel    Rubeus  
    Should Be Equal    ${str1}    harry potter
    Should Be Equal    ${str2}    Hermione Granger
    Should Be Equal    ${str3}    RON WEASLEY
    Should Be Equal    ${str4}    Rubeus Hagrid
    Should Be Lowercase    ${str1}
	Should Be Titlecase    ${str2}
	Should Be Uppercase    ${str3}
	Should Be String       ${str4}
    @{Characters} =    Split String To Characters    ${str1}
