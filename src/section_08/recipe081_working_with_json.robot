*** Settings ***
Documentation    CONTEXT:
...              You want to query the content of semi-structured JSON data, for example after
...              reading it from a file or receiving it from an external API, using Robot Framework.
...              DISCUSSION:
...              This recipe demonstrates how to load a JSON document into a Python dictionary with
...              the help of the built-in 'Evaluate' keyword and the Python 'json' module.  The JSON
...              content is read from an external JSON file (data/person.json) which is then parsed
...              into a native Python dictionary during the execution of the test.  After the parsing,
...              the content can be queried with ordinary dictionary syntax or with the convenience
...              keywords provided by the Collections library.
...              This recipe has no external dependencies.
...              SEE ALSO:
...              https://github.com/adrianyorke/robotframework-cookbook/issues/64
Test Tags        py3.11    py3.12
Library          Collections

*** Variables ***
${recipe}         Recipe 8.1 Working With JSON
${level}          Beginner
${category}       Internal Library: BuiltIn

*** Test Cases ***
Load JSON Into Python Dictionary
    ${data} =    Evaluate    json.load(open('data/person.json'))
    Should Be Equal    ${data}[name]    James Bond
    Should Be Equal    ${data}[city]    London
    Should Be Equal    ${data}[country]    England

Query JSON Content
    ${data} =    Evaluate    json.load(open('data/person.json'))
    Dictionary Should Contain Key    ${data}    name
    Dictionary Should Contain Value    ${data}    London
    Dictionary Should Not Contain Value    ${data}    Tampere
    Log Dictionary    ${data}
