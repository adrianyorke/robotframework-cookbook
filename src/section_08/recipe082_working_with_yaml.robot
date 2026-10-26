*** Settings ***
Documentation    CONTEXT:
...              You want to query the content of semi-structured YAML data, for example after
...              reading it from a file or receiving it from an external API, using Robot Framework.
...              DISCUSSION:
...              This recipe demonstrates how to load a YAML document into a Python dictionary with
...              the help of the built-in 'Evaluate' keyword and the Python 'yaml' module.  The YAML
...              content is read from an external YAML file (data/person.yaml) which is then parsed
...              into a native Python dictionary during the execution of the test.  After the parsing,
...              the content can be queried with ordinary dictionary syntax or with the convenience
...              keywords provided by the Collections library.  This recipe requires the Python 'yaml'
...              module (PyYAML) to be installed.
...              SEE ALSO:
...              https://github.com/adrianyorke/robotframework-cookbook/issues/64
Test Tags        py3.11    py3.12
Library          Collections

*** Variables ***
${recipe}         Recipe 8.2 Working With YAML
${level}          Beginner
${category}       Internal Library: BuiltIn

*** Test Cases ***
Load YAML Into Python Dictionary
    ${data} =          Evaluate            yaml.safe_load(open('data/person.yaml').read())
    Should Be Equal    ${data}[name]       Harry Potter
    Should Be Equal    ${data}[city]       Little Whinging
    Should Be Equal    ${data}[country]    England

Query YAML Content
    ${data} =    Evaluate    yaml.safe_load(open('data/person.yaml').read())
    Dictionary Should Contain Key          ${data}    name
    Dictionary Should Contain Value        ${data}    Little Whinging
    Dictionary Should Not Contain Value    ${data}    Tampere
    Log Dictionary    ${data}
