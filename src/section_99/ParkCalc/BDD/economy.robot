*** Settings ***
Documentation     A test suite with tests for economy parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Force Tags        BDD
Resource          resource.resource

*** Test Cases ***
First Hour
    Given I want to use    Economy Parking
    When I park    @{FOR_ONE_HOUR}
    Then the calculated costs should be    $ 2.00

Four Hours
    Given I want to use    Economy Parking
    When I park    @{FOR_FOUR_HOURS}
    Then the calculated costs should be    $ 8.00

Five Hours
    Given I want to use    Economy Parking
    When I park    @{FOR_FIVE_HOURS}
    Then the calculated costs should be    $ 9.00

First Day
    Given I want to use    Economy Parking
    When I park    @{FOR_ONE_DAY}
    Then the calculated costs should be    $ 9.00

Four Days
    Given I want to use    Economy Parking
    When I park    @{FOR_FOUR_DAYS}
    Then the calculated costs should be    $ 36.00

First Week
    Given I want to use    Economy Parking
    When I park    @{FOR_ONE_WEEK}
    Then the calculated costs should be    $ 54.00

Three Weeks
    Given I want to use    Economy Parking
    When I park    @{FOR_THREE_WEEKS}
    Then the calculated costs should be    $ 162.00
