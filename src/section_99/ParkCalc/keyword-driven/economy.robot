*** Settings ***
Documentation     A test suite with tests for economy parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Test Setup        Input Parking Lot    Economy Parking
Force Tags        KDT
Resource          resource.resource

*** Test Cases ***
First Hour
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    12:59    AM
    Calculated Cost Should Be    $ 2.00

Four Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    04:00    AM
    Calculated Cost Should Be    $ 8.00

Five Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    05:00    AM
    Calculated Cost Should Be    $ 9.00

First Day
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/05/2010    12:00    AM
    Calculated Cost Should Be    $ 9.00

Four Days
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/08/2010    12:00    AM
    Calculated Cost Should Be    $ 36.00

First Week
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/11/2010    12:00    AM
    Calculated Cost Should Be    $ 54.00

Three Weeks
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/25/2010    12:00    AM
    Calculated Cost Should Be    $ 162.00
