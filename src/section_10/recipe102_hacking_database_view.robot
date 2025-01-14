*** Settings ***
Documentation    PROBLEM:
...              You want to demonstrate how database views can be broken by deleting a base table
...              that is referenced by the view SELECT statement.
...              DISCUSSION:
...              This recipe demonstrates creating a datase table and view, then breaking the view.
...              We confirm the view is broken by attempting to SELECT data from it.
...              This recipe also demonstrates "Run Keyword And Ignore Error" and
...              "Run Keyword And Expect Error" keywords.
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-databaselibrary
...              SEE ALSO:
...              In the next recipe, we will create a script that checks all views are still working.
Library          OperatingSystem
Library          String
Library          DatabaseLibrary
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}        Recipe 10.2 Breaking Database View
${level}         Advanced
${category}      External Library: DatabaseLibrary
${DBName}        my_db_test_102

*** Test Cases ***
Remove old DB if exists
    [Tags]    smoke
    ${TEMPDIR} =    Replace String    ${TEMPDIR}    \\    \\\\
    ${Status}    ${value} =    Run Keyword And Ignore Error    File Should Not Exist    ${TEMPDIR}/${DBName}.db
	Log    ${Status}
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

Insert Data Into Table - user
    [Tags]    smoke
    ${output} =    Execute SQL String    INSERT INTO user VALUES(1, 'Tim', 'Berners-Lee');
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
    ${output} =    Execute SQL String    INSERT INTO user VALUES(2, 'Eben', 'Upton');
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Create User View - Filter First Name = Eben
    [Tags]    smoke
    ${sql} =    Set Variable    CREATE VIEW vw_User AS SELECT id, first_name, last_name FROM user WHERE first_name = 'Eben';
    ${output} =    Execute SQL String    sql_string=${sql}

Drop Table - user
    ${sql} =    Set Variable    DROP TABLE user;
    ${output} =    Execute SQL String    sql_string=${sql}

Verify Query - User View - expected to fail
    [Tags]    smoke
    ${sql} =    Catenate    SELECT *    FROM vw_User    LIMIT 1;
    Run Keyword And Ignore Error    Execute SQL String    sql_string=${sql}
    ${expectederror} =    Set Variable    OperationalError: no such table: main.user
    Run Keyword And Expect Error    ${expectederror}    Execute SQL String    sql_string=${sql}
