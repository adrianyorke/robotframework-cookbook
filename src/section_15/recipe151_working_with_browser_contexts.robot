*** Settings ***
Documentation    PROBLEM:
...              You want to simulate different geolocations in the same browser instance.
...              DISCUSSION:
...              This recipe demonstrates the usage of contexts with different geolocations.
...              The contexts are all created in the same browser and do not influence each other.
...              SEE ALSO:
...              Beside the geolocation it is also possible to specify more options for each context.
...              For example the timezone, different permissions, Java Script is disabled, ...
Library          Browser
Force Tags       py3.7    py3.8


*** Variables ***
${recipe}         Recipe 15.1 Working With Browser Contexts
${level}          Intermediate
${category}       External Library: Browser


*** Tasks ***
Context with no Geolocation Permission
    New Context
    New Page           https://www.openstreetmap.org/
    Click              span.icon.geolocate
    Wait Until Network Is Idle
    Take Screenshot

Context with Geolocation set to Helsinki
    New Context        geolocation={'latitude': 60.1698, 'longitude': 24.9386}    permissions=['geolocation']
    New Page           https://www.openstreetmap.org/
    Click              span.icon.geolocate
    Wait Until Network Is Idle
    Take Screenshot

Context with Geolocation set to Sydney
    New Context        geolocation={'latitude': -33.8675, 'longitude': 151.207}    permissions=['geolocation']
    New Page           https://www.openstreetmap.org/
    Click              span.icon.geolocate
    Wait Until Network Is Idle
    Take Screenshot