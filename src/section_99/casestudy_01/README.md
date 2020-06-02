# Case Study: Regression Testing Gerald Ford International Airport (GFIA) Parking Lot Calculation Tool

## 1. Introduction
Special thanks to Hélio Guilherme for contributing this case study material.

This is a worked example based upon a testing session we ran in EWT19. This repository shows how to
refactor and develop keyword-based tests with Robot Framework.

> Note: It is expected that some of test suites will fail.  As an exercise, you should investigate
> the failing tests and try to determine why they are failing.

The resource files in this project all default to firefox browser.  If you prefer to use Chrome then edit the variables section and [download the relevant chromedriver](https://chromedriver.chromium.org/downloads):
```
*** Variables ***
${BROWSER}        chrome
```

## 2. Mission Background
Here is the initial mission we provided:

### Product / System Under Test (SUT)
* [Parking Lot Calculation Tool (ParkCalc)](http://robotframework.transformidea.com/app/parkcalc/)

### Mission
The airport parking lot calculation tool raised the attention of some managers.
There seem to be too many bugs in the application. Since they want to have it re-written,
write a regression test suite based on the old application, which may be executed against
the new application as well. Assume that the same interface will be kept. Use Robot Framework
for your automated tests.

### Parking Rates
As an oracle for your automated, use the rates mentioned on the [official
website](https://www.grr.org/parking-rates)

## 3. Sample solutions for different testing approaches:
* [Behavior-Driven Development (BDD)](ParkCalc/BDD) (Given-When-Then format)
* [Data Driven](ParkCalc/data-driven)
* [Keyword Driven](ParkCalc/keyword-driven)

## 4. Additional Notes:
* Revision of Tests done by Hélio Guilherme on September 2019
* The tests were changed to use SeleniumLibrary at version 4.0.
* The ParkCalc website changed to alternate location (code provided by Adam Goucher), and includes a fix to run under PHP 7.
* New URL is: http://robotframework.transformidea.com/app/parkcalc/
