*** Settings ***
Documentation    PROBLEM:
...              You want to send a simple HTTP request using Browser library.
...              DISCUSSION:
...              Making a request from inside a page context allows use of page
...              cookies and other headers that maybe difficult to gain without
...              using browser. This method also detects some cross site problems that
...              may not occur without a browser.
...              This recipe demonstrates using keywords from Collections standard library.
...              This recipe also demonstrates installing and using an external library.
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-browser
...              $ rfbrowser init
Library          Collections
Library          Browser
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 9.3 Working With Browser Library
${level}          Intermediate
${category}       External Library: Browser

*** Test Cases ***
Get Request
    New Page    https://www.github.com
    &{response} =    HTTP    https://api.github.com/users/adrianyorke
    Should Be Equal    ${response}[status]    ${200}
    Dictionary Should Not Contain Value    ${response}[body]    The Black Knight
    Dictionary Should Contain Value    ${response}[body]    Adrian Yorke
    Dictionary Should Contain Value    ${response}[body]    Helsinki, Finland
