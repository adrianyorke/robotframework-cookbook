*** Settings ***
Documentation    CONTEXT:
...              You want to query the current time and weather information for one or more cities using the
...              World Time & Weather API.
...              DISCUSSION:
...              This recipe demonstrates how to use the keywords from the RequestsLibrary together with the
...              Python 'requests' library to query the sample endpoints offered by the World Time & Weather API.
...              The index endpoint is used to inspect the available endpoints and the city endpoint is used to
...              query the time and weather information for a single city.
...              This recipe has the following external dependencies:
...              $ pip install -U requests
...              $ pip install -U robotframework-requests
...              SEE ALSO:
...              https://github.com/adrianyorke/robotframework-cookbook/issues/188
Library          Collections
Library          RequestsLibrary
Test Tags        no-ci-testing

*** Variables ***
${recipe}         Recipe 9.4 Working With World Time And Weather API
${level}          Intermediate
${category}       External Library: RequestsLibrary

*** Test Cases ***
Get Index
    Create Session    worldtimeweather    https://worldtimeweather.com/api/v1
    ${response} =    GET On Session    worldtimeweather    /index.json
    Should Be Equal As Strings    ${response.status_code}    200
    ${version} =    Evaluate    $response.json()['version']
    Should Be Equal    ${version}    v1

Get City
    Create Session    worldtimeweather    https://worldtimeweather.com/api/v1
    ${response} =    GET On Session    worldtimeweather    /city/helsinki.json
    Should Be Equal As Strings    ${response.status_code}    200
    ${time} =    Evaluate    $response.json()['time']
    ${timezone} =    Evaluate    $time['timezone']
    Should Be Equal    ${timezone}    Europe/Helsinki
    ${weather} =    Evaluate    $response.json()['weather']
    Dictionary Should Contain Key    ${weather}    temperature_c

Get Cities
    Create Session    worldtimeweather    https://worldtimeweather.com/api/v1
    ${response} =    GET On Session    worldtimeweather    /cities.json
    Should Be Equal As Strings    ${response.status_code}    200
    ${cities} =    Evaluate    $response.json()['data']
    ${helsinki} =    Evaluate    [city for city in $cities if city['name'] == 'Helsinki'][0]
    ${slug} =    Evaluate    $helsinki['slug']
    Should Be Equal    ${slug}    helsinki

Get Timezones
    Create Session    worldtimeweather    https://worldtimeweather.com/api/v1
    ${response} =    GET On Session    worldtimeweather    /timezones.json
    Should Be Equal As Strings    ${response.status_code}    200
    ${timezones} =    Evaluate    $response.json()['data']
    Dictionary Should Contain Key    ${timezones}    Europe/Helsinki
