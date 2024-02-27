*** Settings ***
Documentation               Test Ifram, child window functionality
Library                     SeleniumLibrary
Library                     String
Library                     Collections

*** Variables ***
${application_URL}          https://rahulshettyacademy.com/loginpagePractise/
${data}                     This is test data for frame

*** Test Cases ***
Validate child window iframe functionality
	[Documentation]         Test Iframe, child window functionality
	[Tags]                  REGRESSION
	Open Browser            ${application_URL}      Chrome
	Maximize Browser Window
	Set Selenium Timeout    10s
	Set Selenium Speed      1s
	Wait Until Page Contains    Free Access to InterviewQues/ResumeAssistance/Material
    Title Should Be         LoginPage Practise | Rahul Shetty Academy
    Click Link              xpath://a[text()='Free Access to InterviewQues/ResumeAssistance/Material']
    # Switch To New Window
    Log                     Switch To New Window
    Switch Window           NEW
    Element Text Should Be    css:h1        DOCUMENTS REQUEST
    ${text}                 Get Text                css:.red
    Log To Console          ${text}
    @{split_list}           Split String            ${text}
    Log To Console          ${split_list}
    ${email}                Get From List           ${split_list}       4
    Log To Console          ${email}
    #switch to parent window
    Switch Window           MAIN
    Title Should Be         LoginPage Practise | Rahul Shetty Academy
    Input Text              id:username             ${email}

Verify that a string can be written and read from a Simple Iframe
    [documentation]     This test case verifies that a string can be written and read from an Iframe.
    [tags]              REGRESSION
    Open Browser        https://the-internet.herokuapp.com/iframe  Chrome
    Maximize Browser Window
    Set Selenium Timeout    10s
	Set Selenium Speed      1s
	Wait Until Page Contains    An iFrame containing the TinyMCE WYSIWYG Editor
	Log To Console          Valiating Select Frame Functionality
	# select i frame
    Select Frame            id:mce_0_ifr
    Click Element           id:tinymce
    Clear Element Text      id:tinymce
    Input Text              id:tinymce      ${data}
    ${data_from}            Get Text                id:tinymce
    Log To Console          ${data_from}
    Unselect Frame          id:mce_0_ifr
    Close Browser
Verify that the values can be read from inside a Nested Iframe
    [documentation]         This test case verifies that the string can be read from a Nested Iframe.
    [tags]                  REGRESSION
    Open Browser            https://the-internet.herokuapp.com/nested_frames  Chrome
    Select Frame            name:frame-top
    Select Frame            name:frame-right
    Current Frame Should Contain    RIGHT
    Unselect Frame
    Select Frame            name:frame-top
    Select Frame            name:frame-middle
    Current Frame Should Contain    MIDDLE
    Unselect Frame



