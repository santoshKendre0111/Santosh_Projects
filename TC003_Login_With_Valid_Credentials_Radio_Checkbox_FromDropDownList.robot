*** Settings ***
Documentation           This verifies user should log in with valid credentials
Library                 SeleniumLibrary

*** Variables ***
${Application_URL}                  https://rahulshettyacademy.com/loginpagePractise/
${Browser}              Chrome
${valid_Username}       rahulshettyacademy
${valid_Password}       learning

*** Test Cases ***
Login With Valid Credentials Radio Checkbox From Drop Down List
	[Tags]          SMOKE
#	Set Selenium Speed    3s
	Launch Browser and navigate to Application      ${Application_URL}
	Fill Valid Credentails                          ${valid_Username}       ${valid_Password}
	Verify Login Successfully


*** Keywords ***
Launch Browser and navigate to Application
	[Arguments]         ${App_URL}
	Open Browser        ${none}     ${Browser}
	Maximize Browser Window
	Go To               ${App_URL}
Fill Valid Credentails
	[Arguments]         ${userName}      ${password}
	Input Text          id:username       ${userName}
	Input Password      id:password       ${password}
	#Select Radio Button
	Log     Select Radio Button
	Select Radio Button     radio   user
	Wait Until Page Contains    You will be limited to only fewer functionalities of the app. Proceed?
	Wait Until Element Is Visible    css:.modal-content
	Click Button        id:okayBtn
	Wait Until Element Is Visible    xpath://div[@id='login-box']
	#select value from drop down list
	Log    select value from drop down list
	Select From List By Label       xpath://select[@class="form-control"]       Teacher
	Select From List By Value       xpath://select[@class="form-control"]       stud
	#select checkbox
    Log    select checkbox
    Select Checkbox         xpath://input[@id='terms']
    Click Element           id:signInBtn
Verify Login Successfully
	Wait Until Page Contains        ProtoCommerce
	Element Should Be Visible       xpath://*[text()='ProtoCommerce Home']