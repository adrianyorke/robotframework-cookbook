*** Settings ***
Documentation     A test suite with test cases for valet parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Force Tags        BDD
Resource          resource.resource

*** Test Cases ***
Less Than Five Hours
    I want to use    Valet Parking
    When I park    @{FOR_ONE_HOUR}
    Then the calculated costs should be    $ 12.00

Exactly Five Hours
    I want to use    Valet Parking
    When I park    @{FOR_FIVE_HOURS}
    Then the calculated costs should be    $ 12.00

More Than Five Hours
    I want to use    Valet Parking
    When I park    @{FOR_SIX_HOURS}
    Then the calculated costs should be    $ 18.00

Multiple Days
    I want to use    Valet Parking
    When I park    @{FOR_FOUR_DAYS}
    Then the calculated costs should be    $ 72.00
