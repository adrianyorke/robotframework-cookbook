*** Settings ***
Documentation     A test suite with functional tests for ParkCalc in a data-driven format.
Suite Setup       Open Park Calc Page
Suite Teardown    Close Browser
Force Tags        DDT
Resource          resource.resource

*** Variables ***
@{FOR_ONE_HOUR}    05/04/2010    12:00    AM    05/04/2010    01:00    AM    # ${entryDate} \ ${entryTime} \ ${entryAmPm} \ ${exitDate} \ ${exitTime} \ ${exitAmPm}
@{FOR_ONE_AND_A_HALF_HOUR}    05/04/2010    12:00    AM    05/04/2010    01:30    AM
@{FOR_THREE_HOURS}    05/04/2010    12:00    AM    05/04/2010    03:00    AM
@{FOR_FOUR_HOURS}    05/04/2010    12:00    AM    05/04/2010    04:00    AM
@{FOR_FIVE_HOURS}    05/04/2010    12:00    AM    05/04/2010    05:00    AM
@{FOR_SIX_HOURS}    05/04/2010    12:00    AM    05/04/2010    06:00    AM
@{FOR_SEVEN_HOURS}    05/04/2010    12:00    AM    05/04/2010    07:00    AM
@{FOR_TWELVE_HOURS}    05/04/2010    12:00    AM    05/04/2010    12:00    PM
@{FOR_TWENTY_THREE_HOURS}    05/04/2010    12:00    AM    05/04/2010    11:00    PM
@{FOR_ONE_DAY}    05/04/2010    12:00    AM    05/05/2010    12:00    AM
@{FOR_TWO_DAYS}    05/04/2010    12:00    AM    05/06/2010    12:00    AM
@{FOR_THREE_DAYS}    05/04/2010    12:00    AM    05/07/2010    12:00    AM
@{FOR_SIX_DAYS}    05/04/2010    12:00    AM    05/10/2010    12:00    AM
@{FOR_ONE_WEEK}    05/04/2010    12:00    AM    05/11/2010    12:00    AM
@{FOR_THREE_WEEKS}    05/04/2010    12:00    AM    05/25/2010    12:00    AM

*** Test Cases ***
Valet Parking Test
    Run Keyword And Continue On Failure    Valet Parking    @{FOR_ONE_HOUR}    $ 12.00
    Run Keyword And Continue On Failure    Valet Parking    @{FOR_FIVE_HOURS}    $ 12.00
    Run Keyword And Continue On Failure    Valet Parking    @{FOR_ONE_DAY}    $ 18.00
    Run Keyword And Continue On Failure    Valet Parking    @{FOR_THREE_DAYS}    $ 54.00

Short-Term Parking
    Run Keyword And Continue On Failure    Short-Term Parking    @{FOR_ONE_HOUR}    $ 2.00
    Run Keyword And Continue On Failure    Short-Term Parking    @{FOR_ONE_AND_A_HALF_HOUR}    $ 3.00
    Run Keyword And Continue On Failure    Short-Term Parking    @{FOR_THREE_HOURS}    $ 6.00
    Run Keyword And Continue On Failure    Short-Term Parking    @{FOR_TWELVE_HOURS}    $ 24.00
    Run Keyword And Continue On Failure    Short-Term Parking    @{FOR_TWENTY_THREE_HOURS}    $ 24.00
    Run Keyword And Continue On Failure    Short-Term Parking    @{FOR_TWO_DAYS}    $ 48.00

Long-Term Garage Parking
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_ONE_HOUR}    $ 2.00
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_THREE_HOURS}    $ 6.00
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_SIX_HOURS}    $ 12.00
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_SEVEN_HOURS}    $ 12.00
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_SIX_DAYS}    $ 72.00
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_ONE_WEEK}    $ 72.00
    Run Keyword And Continue On Failure    Long-Term Garage Parking    @{FOR_THREE_WEEKS}    $ 216.00

Long-Term Surface Parking
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_ONE_HOUR}    $ 2.00
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_THREE_HOURS}    $ 6.00
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_FIVE_HOURS}    $ 10.00
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_SIX_HOURS}    $ 10.00
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_SIX_DAYS}    $ 60.00
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_ONE_WEEK}    $ 60.00
    Run Keyword And Continue On Failure    Long-Term Surface Parking    @{FOR_THREE_WEEKS}    $ 180.00

Economy Parking
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_ONE_HOUR}    $ 2.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_THREE_HOURS}    $ 6.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_FOUR_HOURS}    $ 8.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_FIVE_HOURS}    $ 9.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_SIX_HOURS}    $ 9.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_SIX_DAYS}    $ 54.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_ONE_WEEK}    $ 54.00
    Run Keyword And Continue On Failure    Economy Parking    @{FOR_THREE_WEEKS}    $ 162.00
