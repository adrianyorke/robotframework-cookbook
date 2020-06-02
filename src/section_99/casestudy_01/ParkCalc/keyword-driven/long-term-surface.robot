*** Settings ***
Documentation     A test suite with tests for long-term (Surface) parking.
Suite Setup       Open ParkCalc
Suite Teardown    Close Browser
Test Setup        Input Parking Lot    Long-Term Surface Parking
Force Tags        KDT
Resource          resource.resource

*** Test Cases ***
First Hour
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    12:59    AM
    Calculated Cost Should Be    $ 2.00

Three Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    03:00    AM
    Calculated Cost Should Be    $ 6.00

Six Hours
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/04/2010    05:59    AM
    Calculated Cost Should Be    $ 10.00

First Day
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/05/2010    12:00    AM
    Calculated Cost Should Be    $ 10.00

Five Days
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/09/2010    12:00    AM
    Calculated Cost Should Be    $ 50.00

Seven Days
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/11/2010    12:00    AM
    Calculated Cost Should Be    $ 60.00

Three Weeks
    Input Entry Date    05/04/2010    12:00    AM
    Input Leaving Date    05/25/2010    12:00    AM
    Calculated Cost Should Be    $ 180.00
