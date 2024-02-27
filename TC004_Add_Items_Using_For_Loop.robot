*** Settings ***
Documentation           Used to add item to list
Library                 SeleniumLibrary
Library                 Collections
Suite Setup             Login to Application
#Suite Teardown         CLose all browsers

Resource                ../Resources/Common_Reource_Fies.robot

*** Variables ***
${item}         Nokia Edge


*** Test Cases ***
Add item to list
	[Documentation]    Test Case verifies user should add item to cart
    [Tags]              REGRESSION
    Validate card items on shop page
    Add item in cart                        ${item}


*** Keywords ***
Validate card items on shop page
	List of Items on page

List of Items on page
    # To create list in robot framework, we use @{list} symbol, to rerive list we use ${list}
    @{Expected_List}      Create List    iphone X     Samsung Note 8      Nokia Edge      Blackberry
    Log To Console        ${Expected_List}
    @{Web_List}        Get Webelements    xpath://*[@class="card-title"]
    Log To Console    ${Web_List}
    @{Actual_List}      Create List
    ## To trive data from list, need to use for loop
    FOR    ${list_item}  IN  @{Web_List}
    	Log To Console    ${list_item.text}
    	Append To List    ${Actual_List}        ${list_item.text}
    END
    Log To Console    ${Actual_List}
    Lists Should Be Equal    ${Expected_List}       ${Actual_List}

Add item in cart
	[Arguments]    ${item}
	@{Items_Page}       Get Webelements    xpath://*[@class="card-title"]
	${index}        Set Variable    1

    FOR    ${list_item}  IN  @{Items_Page}
    	Log To Console    ${list_item.text}
    	Exit For Loop If  '${list_item.text}' == '${item}'
    	${index} =  Evaluate      ${index} + 1
    END
        Click Button        xpath:(//*[@class="card-footer"]/button)[${index}]



