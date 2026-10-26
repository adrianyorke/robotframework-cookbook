*** Settings ***
Documentation    CONTEXT:
...              You want to load data from a structured text file, such as CSV, for example after
...              reading it from an external data file or receiving it from an external API, using Robot Framework.
...              DISCUSSION:
...              This recipe demonstrates how to load a CSV document into a Python list of lists with
...              the help of the built-in 'Evaluate' keyword and the Python 'csv' module.  The CSV
...              content is read from an external CSV file (data/british_authors.csv) which is then parsed
...              into a native Python list of lists during the execution of the test.  After the parsing,
...              the content can be queried with ordinary list syntax or with the convenience keywords
...              provided by the Collections library.
...              This recipe has no external dependencies.
...              SEE ALSO:
...              https://github.com/adrianyorke/robotframework-cookbook/issues/6
Test Tags        py3.11    py3.12
Library          Collections

*** Variables ***
${recipe}         Recipe 8.3 Working With CSV
${level}          Beginner
${category}       Internal Library: BuiltIn

*** Test Cases ***
Load CSV Into List Of Lists
    ${csv_rows} =    Evaluate    list(__import__('csv').reader(open('data/british_authors.csv')))
    Should Be Equal    ${csv_rows}[0][0]    Name
    Should Be Equal    ${csv_rows}[1][0]    William Shakespeare

Count Authors In Dataset
    ${author_count} =    Evaluate    len(list(__import__('csv').reader(open('data/british_authors.csv')))) - 1
    Should Be Equal    ${author_count}    ${10}

Find Author With Earliest Birth Year
    ${earliest_author} =    Evaluate    min(list(__import__('csv').reader(open('data/british_authors.csv')))[1:], key=lambda row: int(row[1]))[0]
    Should Be Equal    ${earliest_author}    William Shakespeare

Find Author With Longest Lifespan
    ${longest_lived_author} =    Evaluate    max(list(__import__('csv').reader(open('data/british_authors.csv')))[1:], key=lambda row: int(row[2]) - int(row[1]))[0]
    Should Be Equal    ${longest_lived_author}    Thomas Hardy
