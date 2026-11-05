*** Settings ***
Documentation    CONTEXT:
...              You want to simulate different geolocations in the same browser instance.
...              DISCUSSION:
...              This recipe demonstrates the usage of contexts with different geolocations.
...              The contexts are all created in the same browser and do not influence each other.
...              SEE ALSO:
...              Beside the geolocation it is also possible to specify more options for each context.
...              For example the timezone, different permissions, Java Script is disabled,
...              This recipe has the following external dependencies:
...              $ pip install -U robotframework-browser
...              $ rfbrowser init
Library          Browser
Test Tags        py3.11    py3.12

*** Variables ***
${recipe}         Recipe 15.1 Working With Browser Contexts
${level}          Intermediate
${category}       External Library: Browser
@{permissions}    geolocation
${geolocate}      button.maplibregl-ctrl-geolocate

*** Test Cases ***
Context with Geolocation set to Helsinki
    New Context                geolocation={'latitude': 60.1698, 'longitude': 24.9386}    permissions=${permissions}    ignoreHTTPSErrors=True
    New Page                   https://www.openstreetmap.org/
    Wait For Load State        load    timeout=10s
    Log Map Diagnostics
    Wait For Elements State    ${geolocate}    enabled    timeout=30s
    Click                      ${geolocate}
    Take Screenshot

Context with Geolocation set to Sydney
    New Context                geolocation={'latitude': -33.8675, 'longitude': 151.207}    permissions=${permissions}    ignoreHTTPSErrors=True
    New Page                   https://www.openstreetmap.org/
    Wait For Load State        load    timeout=10s
    Log Map Diagnostics
    Wait For Elements State    ${geolocate}    enabled    timeout=30s
    Click                      ${geolocate}
    Take Screenshot

Context with no Geolocation Permission
    New Context
    New Page                   https://www.openstreetmap.org/
    Wait For Load State        load    timeout=10s
    Log Map Diagnostics
    Wait For Elements State    ${geolocate}    enabled    timeout=30s
    Click                      ${geolocate}
    Take Screenshot

*** Keywords ***
Log Map Diagnostics
    [Documentation]    TEMPORARY (#192): capture why the MapLibre controls never attach in CI.
    Sleep    5s
    Take Screenshot    filename=diag-{index}
    ${env}=    Evaluate JavaScript    ${None}
    ...    () => { const c = document.createElement('canvas'); return { userAgent: navigator.userAgent, webgl: !!c.getContext('webgl'), webgl2: !!c.getContext('webgl2'), title: document.title, url: location.href, maplibreCanvas: document.querySelectorAll('canvas.maplibregl-canvas').length, maplibreControls: document.querySelectorAll('.maplibregl-ctrl').length, leafletControls: document.querySelectorAll('.leaflet-control').length, geolocateButtons: document.querySelectorAll('button.maplibregl-ctrl-geolocate').length }; }
    Log    ${env}    level=WARN
    ${console}=    Get Console Log    full=True
    Log    ${console}    level=WARN
    ${source}=    Get Page Source
    Log    ${source}
