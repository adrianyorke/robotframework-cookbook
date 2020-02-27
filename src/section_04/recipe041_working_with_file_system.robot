*** Settings ***
Documentation    PROBLEM: You want to query the file system and list items, files and directories.
...              We choose ${TEMPDIR} here as it works on all platforms.
...              This recipe also demonstrates list variables, FOR loop and how to import a library.
Library          OperatingSystem

*** Variables ***
${recipe}         Recipe 041 Working With File System
${level}          Beginner
${category}       Internal Library: BuiltIn

*** Test Cases ***
Listing Directory Contents
    Log Variables
    @{itemlist} =    List Directory    ${TEMPDIR}
    @{filelist} =    List Files In Directory    ${TEMPDIR}    absolute=True
    @{directorylist} =    List Directories In Directory    ${TEMPDIR}
    ${countitems} =    Count Items In Directory    ${TEMPDIR}
    ${countfiles} =    Count Files In Directory    ${TEMPDIR}
    ${countdirectories} =    Count Directories In Directory    ${TEMPDIR}
    FOR    ${directory}    IN    @{directorylist}
        Log    ${directory}    console=true
    END
