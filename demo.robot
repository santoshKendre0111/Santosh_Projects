*** Settings ***
Library    SeleniumLibrary
Library    ../CustomKeyword/demo.py

*** Variables ***
${url}              https://www.google.com/
${browserName}      Chrome

*** Test Cases ***
Launch Browser with python keyword
	Launch Browser      ${url}          ${browserName}
#	Maximize Browser Window
#    Sleep    10s
