*** Settings ***
Documentation     A resource file containing the ParkCalc app specific keywords and variables for data-driven tests that create our own domain specific language. Also SeleniumLibrary itself is imported here so that tests only need to import this resource file.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${DELAY}          0.2
${PARKCALCPAGE}    http://robotframework.transformidea.com/app/parkcalc/    #http://adam.goucher.ca/parkcalc/
${COST_ITEM}      xpath=//tr[td/div[@class='SubHead'] = 'COST']/td/span/font/b
${PAGE_TITLE}     Parking Calculator

*** Keywords ***
Open Park Calc Page
    Open Browser    ${PARKCALCPAGE}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be    ${PAGE_TITLE}

Park Calc
    [Arguments]    ${parkingLot}    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Title Should Be    Parking Calculator
    Select From List    Lot    ${parkingLot}
    Input Text    EntryTime    ${entryTime}
    Select Radio Button    EntryTimeAMPM    ${entryAmPm}
    Input Text    EntryDate    ${entryDate}
    Input Text    ExitTime    ${exitTime}
    Select Radio Button    ExitTimeAMPM    ${exitAmPm}
    Input Text    ExitDate    ${exitDate}
    Click Button    Submit
    Calculated Cost Should Be    ${expectedPrice}

Calculated Cost Should Be
    [Arguments]    ${expectedCost}
    ${actualCost} =    Get Text    ${COST_ITEM}
    Log    Actual costs: ${actualCost}
    Page Should Contain    ${expectedCost}

Dummy Keyword
    [Arguments]    ${expectedCost}
    Log    Not used

Valet Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Valet Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Short-Term Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Short-Term Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Long-Term Garage Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Long-Term Garage Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Long-Term Surface Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Long-Term Surface Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Economy Parking
    [Arguments]    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}
    Park Calc    Economy Parking    ${entryDate}    ${entryTime}    ${entryAmPm}    ${exitDate}    ${exitTime}    ${exitAmPm}    ${expectedPrice}

Select From List
    [Arguments]    ${arg1}    ${arg2}
    [Documentation]    Wrapper for SeleniumLibrary 4.0
    Select From List By Label    ${arg1}    ${arg2}
