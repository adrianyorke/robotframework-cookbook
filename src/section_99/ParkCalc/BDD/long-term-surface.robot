*** Settings ***
Documentation     A test suite with tests for long-term (Surface) parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Force Tags        BDD
Resource          resource.resource

*** Test Cases ***
First Hour
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_ONE_HOUR}
    Then the calculated costs should be    $ 2.00

Three Hours
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_THREE_HOURS}
    Then the calculated costs should be    $ 6.00

Six Hours
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_SIX_HOURS}
    Then the calculated costs should be    $ 10.00

First Day
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_ONE_DAY}
    Then the calculated costs should be    $ 10.00

Five Days
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_FIVE_DAYS}
    Then the calculated costs should be    $ 50.00

Seven Days
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_SEVEN_DAYS}
    Then the calculated costs should be    $ 60.00

Three Weeks
    Given I want to use    Long-Term Surface Parking
    When I park    @{FOR_THREE_WEEKS}
    Then the calculated costs should be    $ 180.00
