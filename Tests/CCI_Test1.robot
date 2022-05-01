*** Settings ***
Documentation  Page Object example in Robot Framework
Library  SeleniumLibrary
Resource  ../PageObject/KeywordDefinations/Common.robot 
Resource  ../PageObject/KeywordDefinations/WelcomePage.robot

*** Variables ***
${base_url}  http://127.0.0.1:5000/
${browser}  Chrome

***Test Cases ***
Scenario-1: Verify successful valid URL shortener (Happy Path)
    [documentation]  Test case verifies that user entered url is successfully shortened
    Opening Browser  ${base_url}  ${browser}
    Welcome Page should Open
    Input URL
    Click Submit
    Shortered URL is displayed
