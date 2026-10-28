*** Settings ***
Documentation     CONTEXT:
...               You want to execute keywords from a test library that is hosted on a remote server or implemented in another language.
...               DISCUSSION:
...               This recipe demonstrates how to use the keywords from the Remote standard library to proxy
...               keyword calls to a remote server hosting an actual test library.
...               This recipe has the following external dependency:
...               $ pip install --upgrade robotremoteserver
...               SEE ALSO:
...               Robot Framework User Guide:
...               https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#remote-library-interface
...               Remote Interface repo:
...               https://github.com/robotframework/RemoteInterface
...               Related issue:
...               https://github.com/adrianyorke/robotframework-cookbook/issues/42
Library           Remote    http://127.0.0.1:8270        AS    RemoteLibrary
Test Tags         no-ci-testing

*** Variables ***
${recipe}         Recipe 6.1 Working With Remote Library
${level}          Beginner
${category}       Internal Library: Remote

*** Test Cases ***
Execute Keyword From Remote Library
    [Documentation]    The Remote library can be used to execute keywords that are hosted on a remote server.
    ...                The remote server must be running before the library is imported and the default
    ...                address and port are used in this recipe (127.0.0.1 and 8270).
    ${greeting} =      RemoteLibrary.Get Greeting    John
    Should Be Equal    ${greeting}    Hello John!
