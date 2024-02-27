*** Settings ***
Documentation           To validate data set with parametrization
Library                 SeleniumLibrary
Library                 Collections
Test Template           Validate Invalid Logins

*** Variables ***
${application_URL}      https://rahulshettyacademy.com/loginpagePractise/
${expected_ErrorMsg}    Incorrect username/password.


*** Test Cases ***      ${username}     ${password}
Invalid Username        dummyid         learning
Invalid Password        rahulshettyacademy      dumypass
Invalid Username Password   dummyid     dumypass
Special Character       dummyid@#$%     dumypass*&^%$#@



*** Keywords ***
Validate Invalid Logins
	[Tags]              SMOKE
	[Documentation]     Validateing logins with invalid data sets
	[Arguments]         ${username}     ${password}
	Open Browser        ${application_URL}      Chrome
	Maximize Browser Window
	Set Selenium Speed    1s
	Set Selenium Timeout    10s
    fill the details    ${username}     ${password}
    Verify Error Message
    Close Browser

fill the details
    [Arguments]         ${userName}         ${Password}
    Input Text          id:username         ${userName}
    Input Password      id:password         ${Password}
    Click Element       id:signInBtn
Verify Error Message
#	Wait Until Page Contains    Incorrect  username/password.
	${error_message}    Get Text            css:.alert-danger
	Log To Console      ${error_message}
	Should Be Equal As Strings      ${error_message}        ${expected_ErrorMsg}
