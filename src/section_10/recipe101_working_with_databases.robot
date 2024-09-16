*** Settings ***
Documentation    PROBLEM:
...              You want to interact with a relational database using database library.
...              DISCUSSION:
...              Uses SQLite as it is available in all Python and Robot Framework installations.
...              Demonstrates adding tags to test cases which can be used to include/exclude certain types of tests.
...              Also demonstrates installing and using an external library.
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-databaselibrary
Library          OperatingSystem
Library          String
Library          DatabaseLibrary
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}        Recipe 10.1 Working With Databases
${level}         Advanced
${category}      External Library: DatabaseLibrary
${DBName}        my_db_test_101

*** Test Cases ***
Remove old DB if exists
    [Tags]    smoke
    ${TEMPDIR} =    Replace String    ${TEMPDIR}    \\    \\\\
    ${Status}    ${value} =    Run Keyword And Ignore Error    File Should Not Exist    ${TEMPDIR}/${DBName}.db
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword And Ignore Error    Remove File    ${TEMPDIR}/${DBName}.db
    File Should Not Exist    ${TEMPDIR}/${DBName}.db
    Comment    Sleep    1s

Connect To Database
    [Tags]    smoke
    ${TEMPDIR} =    Replace String    ${TEMPDIR}    \\    \\\\
    Connect To Database Using Custom Params    sqlite3    database="${TEMPDIR}/${DBName}.db", isolation_level=None

Create User Table
    [Tags]    smoke
    ${output} =    Execute SQL String    CREATE TABLE user (id integer unique, first_name varchar, last_name varchar);

Table Must Exist - user
    [Tags]    smoke
    Table Must Exist    user

Insert Data Into Table - user
    [Tags]    smoke
    ${output} =    Execute SQL String    INSERT INTO user VALUES(1, 'Ada', 'Lovelace');
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
    ${output} =    Execute SQL String    INSERT INTO user VALUES(2, 'Charles', 'Babbage');
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify Query - Row Count user Table
    [Tags]    smoke
    Row Count Is Equal To X    SELECT * FROM user;    2
