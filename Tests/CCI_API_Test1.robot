*** Settings ***
Documentation  API testing in Robot Framework
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Test Cases ***
Do a post request and validate the response code, response body, and response headers
    [documentation]  Test verify the POST request for ShoutCloud API endpoints
    Create Session  CCI_Test  http://api.shoutcloud.io
    &{header}=  Create Dictionary  Content-Type=application/json
    &{data}=  Create Dictionary  input=hello world
    ${response}=  POST On Session  testsession  /V1/SHOUT  json=${data}  headers=${header}
    
    # Check the status as successful (200)
    Status Should Be  200  ${response} 
    
    # Check the Response Body Input
    ${getRespInput}=  Get Value From Json  ${response.json()}  INPUT
    ${getRespInput}=  Get From List  ${getRespInput}  0
    Should Be Equal  ${getRespInput}  hello world

    # Check the Response Body Output
    ${getRespOutput}=  Get Value From Json  ${response.json()}  OUTPUT
    ${getRespOutput}=  Get From List  ${getRespOutput}  0
    Should Be Equal  ${getRespOutput}  HELLO WORLD

    # Check the value of header Content-Type
    ${getHeader}=  Get From Dictionary  ${response.headers}  Content-Type
    Should Be Equal  ${getHeader}  APPLICATION/JSON

