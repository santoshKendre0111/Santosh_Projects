
*** Settings ***
Documentation           This testcase verifies user should not login with invalid credentials
Library                 SeleniumLibrary

# run command to execute test case:- robot --outputdir C:\Users\santo\SantoshProjects\New-RobotFramwork-Projects\withUdemyLearning\Results TC001_Login_With_Invalid_Credentials.robot

*** Variables ***
${url} =                    https://rahulshettyacademy.com/loginpagePractise/
${InvalidUsername} =        Abc@123
${InvalidPassword} =        12345
#${Error_element} =          css:.alert-danger
${expectedErrorMessage} =   Incorrect username/password.

*** Test Cases ***
Login_With_Invalid_Credentials
	[Documentation]    User should not login with invalid credentials
	...                Passed Invalid Username & Password
    [Tags]              SMOKE
    Launch Browser
#    Set Selenium Speed              2s
    Set Selenium Timeout            10s
    Fill Credentials
    Verify Error Message Occured
    Validate Error message


*** Keywords ***
Launch Browser
#	Create Webdriver        Chrome      "C:\Users\santo\SantoshProjects\chromedriver-mac-x64\chromedriver"
#	Go To                   ${url}
	Open Browser    ${none}     Chrome
	Maximize Browser Window
	Go To           ${url}
	Maximize Browser Window
Fill Credentials
	Input Text              id:username     ${InvalidUsername}
	Input Password          name:password   ${InvalidPassword}
	Click Element           id:signInBtn
Verify Error Message Occured
	Wait Until Element Is Visible   css:.alert-danger             #Incorrect username/password.
#	Element Should Be Visible       css:.alert-danger
#	Log To Console                  css:#login-form > div.alert.alert-danger.col-md-12
Validate Error message
	${Error_element} =               Get Text    css:.alert-danger
	Should Be Equal As Strings       ${Error_element}     ${expectedErrorMessage}
