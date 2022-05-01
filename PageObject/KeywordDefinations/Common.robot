# Write common functionalities that are independent of any pages.
*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Opening Browser
    [Arguments]  ${base_url}  ${browser}
    Open Browser  ${base_url}  ${browser}
