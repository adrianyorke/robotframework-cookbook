*** Settings ***
Documentation    CONTEXT:
...              You would like to use the Robot Framework Faker library (`FakerLibrary`)
...              to generate synthetic test data.
...              DISCUSSION:
...              This recipe demonstrates how to generate random test data using the Robot
...              Framework Faker library.  A FOR loop is used to generate five 'people', each
...              with a name, address and email address.  Notice how each person record is
...              logged as it is generated and how the complete list of people is logged at
...              the end of the test.
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-faker
...              SEE ALSO:
...              https://github.com/adrianyorke/robotframework-cookbook/issues/72
Test Tags        py3.11    py3.12
Library          FakerLibrary
Library          Collections

*** Variables ***
${recipe}         Recipe 17.1 Faker - Basic Tests
${level}          Beginner
${category}       External Library: FakerLibrary

*** Test Cases ***
Generate People Test Data
    ${people} =    Create List
    FOR    ${i}    IN RANGE    1    6
        ${name} =      FakerLibrary.Name
        ${address} =   FakerLibrary.Address
        ${email} =     FakerLibrary.Email
        ${person} =    Create Dictionary    name=${name}    address=${address}    email=${email}
        Append To List    ${people}    ${person}
        Log    Person ${i}: ${person}
    END
    Log    ${people}
