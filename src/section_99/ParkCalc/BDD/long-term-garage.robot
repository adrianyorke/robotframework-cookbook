*** Settings ***
Documentation     A test suite with tests for long-term (Garage) parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Force Tags        BDD
Resource          resource.resource

*** Test Cases ***
First Hour
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_ONE_HOUR}
    Then the calculated costs should be    $ 2.00

Three Hours
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_THREE_HOURS}
    Then the calculated costs should be    $ 6.00

Seven Hours
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_SEVEN_HOURS}
    Then the calculated costs should be    $ 12.00

Full Day
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_ONE_DAY}
    Then the calculated costs should be    $ 12.00

Six Days
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_SIX_DAYS}
    Then the calculated costs should be    $ 72.00

Full Week
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_ONE_WEEK}
    Then the calculated costs should be    $ 72.00

Three Weeks
    Given I want to use    Long-Term Garage Parking
    When I park    @{FOR_THREE_WEEKS}
    Then the calculated costs should be    $ 126.00
