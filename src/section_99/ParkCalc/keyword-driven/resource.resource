*** Settings ***
Documentation     A resource file containing the ParkCalc app specific keywords and variables for keyword-driven tests that create our own domain specific language. Also SeleniumLibrary itself is imported here so that tests only need to import this resource file.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${DELAY}          0
${PARKCALC URL}    http://robotframework.transformidea.com/app/parkcalc/    # http://adam.goucher.ca/parkcalc/
${COST_ITEM}      xpath=//tr[td/div[@class='SubHead'] = 'COST']/td/span/font/b
${PAGE_TITLE}     Parking Calculator

*** Keywords ***
Open ParkCalc
    Open Browser    ${PARKCALC URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be    ${PAGE_TITLE}

Input Parking Lot
    [Arguments]    ${lot}
    Select From List    Lot    ${lot}

Input Entry Date
    [Arguments]    ${date}    ${time}    ${ampm}
    Input Text    EntryDate    ${date}
    Input Text    EntryTime    ${time}
    Select Radio Button    EntryTimeAMPM    ${ampm}

Input Leaving Date
    [Arguments]    ${date}    ${time}    ${ampm}
    Input Text    ExitDate    ${date}
    Input Text    ExitTime    ${time}
    Select Radio Button    ExitTimeAMPM    ${ampm}

Calculated Cost Should Be
    [Arguments]    ${cost}
    Click Button    Submit
    ${actual} =    Get Text    ${COST_ITEM}
    Log    Actual costs: ${actual}
    Page Should Contain    ${cost}

Select From List
    [Arguments]    ${arg1}    ${arg2}
    [Documentation]    Wrapper for SeleniumLibrary 4.0
    Select From List By Label    ${arg1}    ${arg2}
