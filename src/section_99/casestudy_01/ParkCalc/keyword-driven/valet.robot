*** Settings ***
Documentation     A test suite with test cases for valet parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Test Setup        Input Parking Lot    Valet Parking
Force Tags        KDT
Resource          resource.resource

*** Test Cases ***
Less Than Five Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    01:00    AM
    Calculated Cost Should Be    $ 12.00

Exactly Five Hours
    Input Entry Date    05/04/2010    12:34    AM
    Input Leaving Date    05/04/2010    05:34    AM
    Calculated Cost Should Be    $ 12.00

More Than Five Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    12:00    PM
    Calculated Cost Should Be    $ 18.00

Multiple Days
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/08/2010    12:00    AM
    Calculated Cost Should Be    $ 72.00
