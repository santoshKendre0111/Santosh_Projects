*** Settings ***
Documentation           To verify checkbox, Radio Button & Dropdown functinality
Library                 SeleniumLibrary

*** Variables ***
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${Username}             rahulshettyacademy
${Password}             learning

*** Test Cases ***
To verify checkbox, Radio Button & Dropdown functinality
	[Documentation]             To verify checkbox, Radio Button & Dropdown functinality
	[Tags]                      SMOKE
	Open Browser                ${url}      Chrome
	Maximize Browser Window
	Set Selenium Speed          1s
	Set Selenium Timeout        10s
	Input Text                  id:username     ${Username}
	Input Password              id:password     ${Password}
	# Radio Button Functionality
	Log                         Radio Button Functionality
	Select Radio Button         radio       user
	Wait Until Element Is Visible    id:okayBtn
	Click Button                   id:okayBtn
	Wait Until Element Is Visible    xpath://*[text()='Admin']
	# Dropdon Funtionaity
	Log                         Dropdon Funtionaity
	Select From List By Value    //select[@class="form-control"]    consult
	Select From List By Label    //select[@class="form-control"]    Student
	# Checkbox Functionality
	Log                         Checkbox Functionality
	Select Checkbox             id:terms
	Click Element               id:signInBtn
	Wait Until Page Contains    ProtoCommerce Home
	Get Title
	Sleep                       3s


