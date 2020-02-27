*** Settings ***
Documentation    PROBLEM: You want to send a simple HTTP request using Requests library.
...              This recipe demonstrates using keywords from Collections standard library.
...              This recipe also demonstrates installing and using an external library.
...              This recipe has the following dependencies:
...              $ pip install -U requests
...              $ pip install -U robotframework-requests
Library          Collections
Library          RequestsLibrary

*** Variables ***
${recipe}         Recipe 091 Working With Requests Library
${level}          Intermediate
${category}       External Library: RequestsLibrary

*** Test Cases ***
Get Request
    Create Session    github    https://api.github.com
    ${response} =    Get Request    github    /users/adrianyorke
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Not Contain Value    ${response.json()}    The Black Knight
    Dictionary Should Contain Value    ${response.json()}    Adrian Yorke
    Dictionary Should Contain Value    ${response.json()}    Helsinki, Finland
