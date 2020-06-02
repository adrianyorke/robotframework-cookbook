*** Settings ***
Documentation     A resource file containing the ParkCalc app specific keywords and variables for BDD-style tests that create our own domain specific language. Also SeleniumLibrary itself is imported here so that tests only need to import this resource file.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${DELAY}          0
${PARKCALC URL}    http://robotframework.transformidea.com/app/parkcalc/    # http://adam.goucher.ca/parkcalc/
${COST_ITEM}      xpath=//tr[td/div[@class='SubHead'] = 'COST']/td/span/font/b
${PAGE_TITLE}     Parking Calculator
@{FOR_ONE_HOUR}    05/04/2010    12:00    AM    05/04/2010    01:00    AM
@{FOR_ONE_AND_A_HALF_HOUR}    05/04/2010    12:00    AM    05/04/2010    01:30    AM
@{FOR_THREE_HOURS}    05/04/2010    12:00    AM    05/04/2010    03:00    AM
@{FOR_FOUR_HOURS}    05/04/2010    12:00    AM    05/04/2010    04:00    AM
@{FOR_FIVE_HOURS}    05/04/2010    12:00    AM    05/04/2010    05:00    AM
@{FOR_SIX_HOURS}    05/04/2010    12:00    AM    05/04/2010    06:00    AM
@{FOR_SEVEN_HOURS}    05/04/2010    12:00    AM    05/04/2010    07:00    AM
@{FOR_TWELVE_AND_A_HALF_HOUR}    05/04/2010    12:00    AM    05/04/2010    12:30    PM
@{FOR_ONE_DAY}    05/04/2010    12:00    AM    05/05/2010    12:00    AM
@{FOR_FOUR_DAYS}    05/04/2010    12:00    AM    05/08/2010    12:00    AM
@{FOR_FIVE_DAYS}    05/04/2010    12:00    AM    05/09/2010    12:00    AM
@{FOR_SIX_DAYS}    05/04/2010    12:00    AM    05/10/2010    12:00    AM
@{FOR_SEVEN_DAYS}    05/04/2010    12:00    AM    05/11/2010    12:00    AM
@{FOR_ONE_WEEK}    @{FOR_SEVEN_DAYS}
@{FOR_THREE_WEEKS}    05/04/2010    12:00    AM    05/25/2010    12:00    AM

*** Keywords ***
Open ParkCalc
    Open Browser    ${PARKCALC URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be    ${PAGE_TITLE}

I want to use
    [Arguments]    ${lot}
    Select From List    Lot    ${lot}

I park
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}
    Input Text    EntryTime    ${entryTime}
    Select Radio Button    EntryTimeAMPM    ${entryAmPm}
    Input Text    EntryDate    ${entryDate}
    Input Text    ExitTime    ${exitTime}
    Select Radio Button    ExitTimeAMPM    ${exitAmPm}
    Input Text    ExitDate    ${exitDate}
    Click Button    Submit

the calculated costs should be
    [Arguments]    ${cost}
    ${actual} =    Get Text    ${COST_ITEM}
    Log    Actual costs: ${actual}
    Page Should Contain    ${cost}

Select From List
    [Arguments]    ${arg1}    ${arg2}
    [Documentation]    Wrapper for SeleniumLibrary 4.0
    Select From List By Label    ${arg1}    ${arg2}
