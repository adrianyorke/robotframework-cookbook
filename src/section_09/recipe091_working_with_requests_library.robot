*** Settings ***
Documentation    PROBLEM:
...              You want to send a simple HTTP request using Requests library.
...              DISCUSSION:
...              This recipe demonstrates using keywords from Collections standard library.
...              This recipe also demonstrates installing and using an external library.
...              This recipe has the following external dependencies:
...              $ pip install -U requests
...              $ pip install -U robotframework-requests
Library          Collections
Library          RequestsLibrary
Force Tags       py3.6    py3.7    py3.8

*** Variables ***
${recipe}         Recipe 9.1 Working With Requests Library
${level}          Intermediate
${category}       External Library: RequestsLibrary

*** Test Cases ***
Get Request
    Create Session    github    https://api.github.com
    ${response} =    GET On Session    github    /users/adrianyorke
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Not Contain Value    ${response.json()}    The Black Knight
    Dictionary Should Contain Value    ${response.json()}    Adrian Yorke
    Dictionary Should Contain Value    ${response.json()}    Helsinki, Finland
