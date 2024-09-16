*** Settings ***
Documentation    PROBLEM:
...              You want to handle lists natively within Robot Framework scripts without needing to
...              use lower level Python code or develop a custom library.
...              DISCUSSION:
...              This recipe demonstrates using keywords from the Collections library.
...              List variables are created using Create List keyword from the BuiltIn Library.
...              This recipe also demonstrates how to extend Robot Framework using Evaluate keyword to implement
...              small snippets of embedded Python code.
...              SEE ALSO:
...              BuiltIn library also has keywords for creating lists and dictionaries, checking
...              length or count and checking membership or equality.
...              Recipe 041 also demonstrates using list & dictionaries using only BuiltIn library keywords.
Library          Collections
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 2.2 Handling Lists
${level}          Intermediate
${category}       Internal Library: Collections

*** Test Cases ***
Testing List of Numbers
    # Scalar variables start with $ prefix
    # Expanded list variables start with @ prefix
    ${randlist}=    Evaluate    random.sample(range(1, 20), 5)    modules=random
    ${itemcount} =    Get Length    ${randlist}
    ${numbers} =    Create List    @{randlist}
    Log List    ${numbers}
    Sort List    ${numbers}
    Log List    ${numbers}

Testing List Of Letters
    ${letters} =    Create List    a    b    c
    ${matches} =    Count Values In List    ${letters}    c
    Log List    ${letters}
    List Should Contain Value        ${letters}    b
    List Should Not Contain Value    ${letters}    z
    Remove Values From List    ${letters}    a    c
    Log List    ${letters}
    Append To List    ${letters}    z    x    j    f
    Sort List    ${letters}
    Log List    ${letters}
