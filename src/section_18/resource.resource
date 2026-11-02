*** Settings ***
Documentation     A resource file containing the user keywords used by the Working With Resource Files recipe. The user keywords are stored in a resource file and imported into the test suite instead of being defined inline.

*** Keywords ***
Eat One List
   [Arguments]    ${li}
   Log Many    @{li}
   Log         ${li}

Eat Many Values
   [Arguments]   @{li}
   Log Many    @{li}
   Log         ${li}

Log ABC
   [Arguments]    ${a}    @{bc}
   Log   ${a}
   Log   ${bc}[0]
   Log   ${bc}[1]
