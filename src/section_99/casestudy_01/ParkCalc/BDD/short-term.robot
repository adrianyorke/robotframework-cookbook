*** Settings ***
Documentation     A test suite with functional tests for ParkCalc in a keyword-driven format.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Force Tags        BDD
Resource          resource.resource

*** Test Cases ***
First Hour
    I want to use    Short-Term Parking
    When I park    @{FOR_ONE_HOUR}
    Then the calculated costs should be    $ 2.00

One And An Additional Half Hour
    I want to use    Short-Term Parking
    When I park    @{FOR_ONE_AND_A_HALF_HOUR}
    Then the calculated costs should be    $ 3.00

Three Hours
    I want to use    Short-Term Parking
    When I park    @{FOR_THREE_HOURS}
    Then the calculated costs should be    $ 6.00

Twelve And A Half Hour
    I want to use    Short-Term Parking
    When I park    @{FOR_TWELVE_AND_A_HALF_HOUR}
    Then the calculated costs should be    $ 24.00
