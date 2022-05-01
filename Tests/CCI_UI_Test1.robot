*** Settings ***
Documentation  Page Object example in Robot Framework
Library  SeleniumLibrary
Resource  ../PageObject/KeywordDefinations/Common.robot 
Resource  ../PageObject/KeywordDefinations/WelcomePage.robot
Test Teardown  Close All Browsers

*** Variables ***
${base_url}  http://127.0.0.1:5000/
${browser}  Chrome

***Test Cases ***
Scenario-1: Verify successful valid URL shortener (Happy Path)
    [documentation]  Test case verifies that user entered url is successfully shortened
    Opening Browser  ${base_url}  ${browser}
    Welcome Page should Open
    Input URL  ${validUrlToShorten}
    Click Submit
    Shortered URL is displayed

Scenario-2: Verify error is shown when no URL is entered
    [documentation]  Test case verifies that an error is shown when no URL is entered    
    Opening Browser  ${base_url}  ${browser}
    Welcome Page should Open
    Click Submit
    Error URL is required is shown