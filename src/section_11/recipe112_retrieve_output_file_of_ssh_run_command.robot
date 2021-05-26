*** Settings ***
Documentation                PROBLEM:
...                          You need to execute a command on a remote machine via SSH then get its vary large text output, or some
...                          bianary artifact that the remote command creates using file transfer.
...                          DISCUSSION:
...                          This recipe demonstrates using keywords from SSH external library
...                          combined with standard library OperatingSystem. In this recipie we are
...                          logging in with ssh public key to demonstrate that option for logins.
...                          We are also expanding on 1.11's demonstation of user keywords by creating
...                          a user keyword with a variable in its name and chainging keywords together.
...                          Also notice in this recipe that we need to specify namespace for our keywords
...                          because SSHLibrary and OperatingSystem have some overlapping keyword names.
...                          We used WITH NAME when importing the libraries to make the test case and user
...                          keyword code less obnoxious.
...                          This recipe has the following external dependency:
...                          $ pip install --upgrade robot framework-sshlibrary
...                          SEE ALSO:
...                          SSHLibrary documentation: http://robotframework.org/SSHLibrary/SSHLibrary.html

Library                      SSHLibrary         WITH NAME    SSH
Library                      OperatingSystem    WITH NAME    OS

Suite Setup                  Open Connection And Log In
Suite Teardown               SSH.Close All Connections
Force Tags                   no-ci-testing

*** Variables ***
${recipe}                    Recipe 11.2 Retrieve Output File Of SSH Run Command
${level}                     Advanced
${category}                  External Library: SSH

*** Test Cases ***
Count To 5000 On Remote and Print To Local Console
    [Documentation]          Run bash script to print line seperated numbers 0-5000 on remote server
    ...                      to a file, then get that file and log to local console
    ${count_file}            Set Variable      /tmp/count_file.txt
    ${count_command}         Set Variable      i=0; while [ $i -le 5000 ]; do echo line $i; i=$(($i+1)); done >/tmp/count_file.txt
    ${result}                Run Remote ${count_command} And Get ${count_file} Output
    ${result_read}           OS.Get File    ${result}
    Log To Console           ${result_read}

*** Keywords ***
Open Connection And Log In
    [Documentation]          Connect and Log In With SSH Key. You'll want to change the variable values here of course,
    ...                      but if you have ssh enabled on your local machiene and your public key added to ~/.ssh/authorized_keys,
    ...                      you _can_ run this to with no changes and it will work, asuming your environment is a pretty typical setup.

    ${HOST}                  OS.Run                         hostname
    ${USER}                  OS.Get Environment Variable    USER
    ${HOME}                  OS.Get Environment Variable    HOME
    SSH.Open Connection          ${HOST}
    SSH.Login With Public Key    ${USER}                        ${HOME}/.ssh/id_rsa


Run Remote ${Command} And Get ${File} Output
    [Documentation]          This keyword uses a variable keyword name, meaning that it can be called by any name which matches
    ...                      the name defined, but with any string in place of the variables. It is one of the more extravigant
    ...                      feautures of robot and may feel too quirky to some python developers. But depending on style choices
    ...                      for your project, you may choose to use this feature.
    ...
    ...                      To the point, this keyword runs the command and outputs to a file on the server, then downloads that file
    ...                      and returns the local file location so you can print to console or do whatever you need to do with
    ...                      the content, for example passing it to another keyword.

    SSH.Execute Command      ${Command}
    SSH.File Should Exist    ${File}

    ${downloaded_file}       _Get Remote ${File}
    [Return]                 ${downloaded_file}

_Get Remote ${File}
    [Documentation]         Supporting Keyword, gets file from remote server and stores it to a temporary directory.
    ...                     Returns the downloaded file's path

    SSH.Get File            ${File}               ${TEMPDIR}/${File}
    OS.File Should Exist    ${TEMPDIR}/${File}    msg="Error, file was not downloaded correctly"
    [Return]                ${TEMPDIR}/${File}
