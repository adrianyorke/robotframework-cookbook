*** Settings ***
Documentation    PROBLEM:
...              You want to send a simple HTTP request using RESTinstance library.
...              DISCUSSION:
...              This recipe demonstrates installing and using an external library.
...              This recipe has the following external dependencies:
...              $ pip install -U RESTinstance
Library          Collections
Library          REST    https://api.github.com
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 9.2 Working With REST Library
${level}          Intermediate
${category}       External Library: REST

*** Test Cases ***
Get Request
    GET        /users/adrianyorke
    Output     response
    Integer    response status    200
    # Validate the value individual properties
    String     response body name        Adrian Yorke
    String     response body location    Helsinki, Finland
    # Save the body in a variable so we can prove that something isn't in it
    ${body}=    Output    response body
    Dictionary Should Not Contain Value    ${body}    The Black Knight
