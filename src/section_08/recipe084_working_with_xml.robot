*** Settings ***
Documentation    CONTEXT:
...              You want to query the content of structured XML data, for example after
...              reading it from a file or receiving it from an external API, using Robot Framework.
...              DISCUSSION:
...              This recipe demonstrates how to load an XML document into a Python object with
...              the help of the built-in 'Evaluate' keyword and the Python 'xml.etree.ElementTree' module.  The XML
...              content is read from an external XML file (data/person.xml) which is then parsed
...              into a native Python object during the execution of the test.  After the parsing,
...              the content can be queried with ordinary Python object syntax or with the convenience
...              keywords provided by the Collections library.
...              This recipe has no external dependencies.
...              SEE ALSO:
...              https://github.com/adrianyorke/robotframework-cookbook/issues/153
Test Tags        py3.11    py3.12
Library          Collections

*** Variables ***
${recipe}         Recipe 8.4 Working With XML
${level}          Beginner
${category}       Internal Library: BuiltIn

*** Test Cases ***
Load XML Into Python Element
    ${tag} =    Evaluate    xml.etree.ElementTree.fromstring(open('data/person.xml').read()).tag    modules=xml.etree.ElementTree
    Should Be Equal    ${tag}    person

Query XML Content
    ${name} =    Evaluate    xml.etree.ElementTree.fromstring(open('data/person.xml').read()).find('name').text    modules=xml.etree.ElementTree
    Should Be Equal    ${name}    James Bond
    ${city} =    Evaluate    xml.etree.ElementTree.fromstring(open('data/person.xml').read()).find('city').text    modules=xml.etree.ElementTree
    Should Be Equal    ${city}    London
    ${country} =    Evaluate    xml.etree.ElementTree.fromstring(open('data/person.xml').read()).find('country').text    modules=xml.etree.ElementTree
    Should Be Equal    ${country}    England
