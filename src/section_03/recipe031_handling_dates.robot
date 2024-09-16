*** Settings ***
Documentation    PROBLEM:
...              You want to handle dates within a Robot Framework test case
...              without using lower level Python code or develop a custom library.
...              DISCUSSION:
...              This recipe demonstrates:
...              - using keywords from the DateTime library,
...              - changing the default result_format and using timedelta
...              instead of number or time string formats,
...              - using extended variable syntax.
Library          DateTime
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 3.1 Handling Dates
${level}          Beginner
${category}       Internal Library: DateTime
${unicode_release_date}    1991-10-01

*** Test Cases ***
How Much Time Has Passed Since Unicode 1.0 Was Released
    ${current_date}=    Get Current Date
    ${time_passed_since_release}=    Subtract Date From Date
    ...    ${current_date}    ${unicode_release_date}    result_format=verbose
    Log    ${time_passed_since_release}

How Many Days And Years Passed Since Unicode 1.0 Was Released
    ${current_date}=    Get Current Date
    ${days_passed_since_release}=    Subtract Date From Date
    ...    ${current_date}    ${unicode_release_date}    result_format=timedelta
    Log    ${days_passed_since_release.days} days passed!
    Log    ${days_passed_since_release.days / 365} years passed!
