*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py
 
*** Keywords ***
Welcome Page should Open
    Title Should Be   Welcome to FlaskShortener 

Input URL
    [Arguments]  ${url}
    Input Text  ${urlInputBox}  ${url}

Click Submit
    Click Element  ${submitButton}

Shortered URL is displayed
    Element Should Be Visible  //span[contains(text(),'http://127.0.0.1:5000/')]

Error URL is required is shown
    Element Should Be Visible  //div[contains(text(),'The URL is required!')]


