Contents of https://github.com/mgaertne/ParkCalc.git
Found from http://www.shino.de/2010/07/06/parkcalc-automation-templates-for-data-driven-tests/
Adapted by Hélio Guilherme on August 2016
-----
Original README file below:
---
This is a worked example based upon a testing session we ran in EWT19 (http://weekendtesting.com/archives/1131). This repository shows how to refactor and develop keyword based tests with RobotFramework.

Here is the initial mission we provided:

Product: ParkCalc (http://adam.goucher.ca/parkcalc/)

Mission:
The airport parking lot calculation tool raised the attention of some managers. There seem to be too many bugs in the application. Since they want to have it re-written, write a regression test suite based on the old application, which may be executed against the new application as well. Assume that the same interface will be kept. Use RobotFramework for your automated tests.

As an oracle for your automated, use the rates mentioned on the official website: http://www.grr.org/ParkingRates.php
---
-----
Revision of Tests done by Hélio Guilherme on September 2019
The tests were changed to use SeleniumLibrary at version 4.0.
The ParkCalc website changed to alternate location (code provided by Adam Goucher), and includes a fix to run under PHP 7.
New URL is: http://robotframework.transformidea.com/app/parkcalc/


