*** Settings ***
Documentation     PROBLEM:
...               You want to setup local environment where to test websites against multiple locally running browsers.
...               DISCUSSION:
...               This recipe demonstrates using keywords from SeleniumLibrary and SeleniumTestability plugin, how to setup
...               your webdrivers and use advanced features of SeleniumTestability.
...
...               This recipe has the following external dependencies:
...               $ pip install --upgrade robotframework-seleniumlibrary robotframework-seleniumtestability webdrivermanager
...
...               Running SeleniumLibrary requires working integration with webdriver executable. After running previous
...               `pip` command, you can install webdrivers with:
...
...               $ webdrivermanager firefox chrome
...
...               SEE ALSO:
...               SeleniumLibrary documentation: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
...               SeleniumTestability keyword documentation: https://rasjani.github.io/robotframework-seleniumtestability/index.html?tag=plugin#Keywords
...               WebDriverManager documentation: https://github.com/rasjani/webdrivermanager
...
Library           SeleniumLibrary    plugins=SeleniumTestability;True;1 Minute;True
Library           Collections
Test Template     Click And Wait
Suite Setup       Configure SeleniumTestability
Test Teardown     Close All Browsers
Force Tags        no-ci-testing

*** Variables ***
${recipe}         Recipe 13.1 Selenium Setup
${level}          Intermediate
${category}       External Library: SeleniumLibrary

${URL}            https://the-internet.herokuapp.com/dynamic_loading/1
${HIDDEN_DIV}     xpath://div[@id="finish"]
${HIDDEN_TEXT}    Hello World!
${START_BUTTON}   xpath://div[@id="start"]/button

*** Test Cases ***
Open Page With Firefox and wait for element to appear       Firefox   ${URL}
Open Page With Chrome and wait for element to appear        Chrome    ${URL}

*** Keywords ***
Click And Wait
    [Documentation]               1. Calls Setup Browser-keyword with parameters.
    ...                           2. Verifies that element with id finish isn't visible or doesnt contain Hello World!
    ...                           3. Click on button with id start. This trigger that will show another div in 5 seconds with text Hello World!
    ...                           4. Verifies that element with id finish is t visible and contains Hello World!
    ...
    ...                           Note: Because SeleniumTestability was enabled with automatic waiting and injection on line 21, user does not
    ...                           need to explicitly wait for any events.

    [Arguments]                   ${browser}      ${url}

    Setup Browser                 ${browser}      ${url}
    Element Text Should Not Be    ${HIDDEN_DIV}   ${HIDDEN_TEXT}
    Click Button                  ${START_BUTTON}
    Element Text Should Be        ${HIDDEN_DIV}   ${HIDDEN_TEXT}

Setup Browser
    [Arguments]                   ${browser}      ${ur}
    [Documentation]               1. calls Open Browser with given url and browser name.
    ...                           2. Verifies that SeleniumTestability was correctly injected/instrumented in the given URL

    Open Browser                  ${url}          ${browser}
    ${testability_status}=        Is Testability Installed
    Should Be True                ${testability_status}


Configure SeleniumTestability
    [Documentation]               1. Create a dictionary with following values:
    ...                             1.1 maxTimeout in milliseconds that SeleniumTetability still considers as valid event to wait.
    ...                             1.2 verbose to 1 indicates that testability.js should log its events to browser console.
    ...                           2. Sets the created dictionary as configuration for SeleniumTestability

    ${tc}=   Create Dictionary    maxTimeout=10000      verbose=1
    Set Testability Config        ${tc}
