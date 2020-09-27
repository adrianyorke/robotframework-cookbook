*** Settings ***
Documentation    PROBLEM:
...              You want to execute commands on a remote machine via SSH and get the output and return code.
...              DISCUSSION:
...              This recipe demonstrates using keywords from SSH external library.  This recipe could be used
...              to implement "configuration management as code" and configure multiple remote servers.
...              This recipe also demonstrates another method of extending Robot Framework by defining
...              a user keyword which can be used in this test suite.
...              A common mistake that beginners make is that they string together commands using Execute Command
...              and don't realise that each command is executed separately.  This is demonstrated in the first
...              test case as you will notice in the log that pwd does not return the temp directory.
...              This recipe has the following external dependency:
...              $ pip install --upgrade robotframework-sshlibrary
...              SEE ALSO:
...              SSHLibrary documentation: http://robotframework.org/SSHLibrary/SSHLibrary.html
Library          SSHLibrary
Suite Setup      Open Connection And Log In
Suite Teardown   Close All Connections
Force Tags       no-ci-testing

*** Variables ***
${recipe}         Recipe 11.1 Working With SSH Library
${level}          Advanced
${category}       External Library: SSH
${HOST}           YOUR_HOST
${USERNAME}       YOUR_USERNAME
${PASSWORD}       YOUR_PASSWORD

*** Test Cases ***
Execute Command And Verify Output
    [Documentation]    Execute Command can be used to run commands on the remote machine.
    ...                The keyword returns the standard output by default.
    ${output} =        Execute Command    cd ${TEMPDIR}
    ${output} =        Execute Command    pwd
    ${output} =        Execute Command    echo Hello SSHLibrary!
    Should Be Equal    ${output}    Hello SSHLibrary!

Execute Command And Verify Return Code
    [Documentation]    Often getting the return code of the command is enough.
    ...                This behaviour can be adjusted as Execute Command arguments.
    ${rc} =            Execute Command    echo Success guaranteed.    return_stdout=False    return_rc=True
    Should Be Equal    ${rc}    ${0}

Executing Commands In An Interactive Session
    [Documentation]    Execute Command always executes the command in a new shell.
    ...                This means that changes to the environment are not persisted
    ...                between subsequent Execute Command keyword calls.
    ...                Write and Read Until variants can be used to operate in the same shell.
    Write              cd ${TEMPDIR}
    Write              echo Hello from temp directory!
    ${output} =        Read Until    directory!
    Should End With    ${output}    Hello from temp directory!

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}
