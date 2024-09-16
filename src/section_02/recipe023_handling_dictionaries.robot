*** Settings ***
Documentation    PROBLEM:
...              You want to handle a dictionary within a Robot Framework script without needing to develop
...              a custom library using Java or Python.
...              DISCUSSION:
...              This recipe demonstrates using keywords from BuiltIn and Collections libraries.
...              Dictionary variables are created using keywords from the BuiltIn Library.
...              SEE ALSO:
...              BuiltIn library also has keywords for creating dictionaries, checking length or count and
...              checking membership.
...              Recipe 041 demonstrates using list & dictionaries using only BuiltIn library keywords.
Library          Collections
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 2.3 Handling Dictionaries
${level}          Intermediate
${category}       Internal Library: Collections

*** Test Cases ***
Dictionary Testing
    &{dict1} =    Create Dictionary    team=Wolverhampton Wanderers
    &{dict2} =    Create Dictionary    stadium=Molineux
    # merge dictionaries, if keys appear multiple times final value will be used.
    &{dict} =     Create Dictionary    &{dict1}    &{dict2}    nickname=Wolves
    Should Be True    ${dict} == {'team': 'Wolverhampton Wanderers', 'stadium': 'Molineux', 'nickname': 'Wolves'}
    # demonstrate dot access
    Should Be Equal    ${dict.stadium}     Molineux
    Should Be Equal    ${dict.nickname}    Wolves
    Should Not Be Equal    ${dict.nickname}    The Red Devils
    Dictionary Should Contain Key    ${dict}    nickname
    Dictionary Should Contain Value    ${dict}    Wolves
    ${val} =    Pop From Dictionary    ${dict}    nickname
    # use $ variable prefix to access dictionary as a single, scalar value
    Log    ${dict}
    # use & variable prefix to expand the dictionary into key-value pairs
    Log Many    &{dict}
    Log Dictionary    ${dict}
