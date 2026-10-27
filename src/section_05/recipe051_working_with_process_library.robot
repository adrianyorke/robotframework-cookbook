*** Settings ***
Documentation     CONTEXT:
...               You want to run an external script or application as a process and verify its behaviour.
...               DISCUSSION:
...               This recipe demonstrates how to use the keywords from the Process standard library to run
...               processes, wait for their completion and terminate them when needed.
...               SEE ALSO:
...               Process library documentation: https://robotframework.org/robotframework/latest/libraries/Process.html
...               https://github.com/adrianyorke/robotframework-cookbook/issues/15
Library           Process
Suite Teardown    Terminate All Processes
Test Tags         py3.11    py3.12

*** Variables ***
${recipe}         Recipe 5.1 Working With Process Library
${level}          Intermediate
${category}       Internal Library: Process

*** Test Cases ***
Run Process
    ${result} =    Run Process    python    -c    print("Hello, world!")
    Should Be Equal    ${result.rc}    0    type=int
    Should Be Equal    ${result.stdout}    Hello, world!
    Should Be Empty    ${result.stderr}

Start Process And Wait For Process
    ${process} =    Start Process    python    -c    print("Hello, world!")    alias=Hello
    ${result} =    Wait For Process    Hello
    Should Be Equal    ${result.rc}    0    type=int
    Should Be Equal    ${result.stdout}    Hello, world!
    Should Be Empty    ${result.stderr}

Terminate Process
    ${process} =    Start Process    python    -c    import time; time.sleep(60)    alias=Sleeper
    ${is_running} =    Is Process Running    Sleeper
    Should Be True    ${is_running}
    ${result} =    Terminate Process    Sleeper
    ${is_running} =    Is Process Running    Sleeper
    Should Be Equal    ${is_running}    ${False}
