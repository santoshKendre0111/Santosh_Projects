*** Settings ***
Documentation           Devlope custom python keyword for adding items in cart.
Library                 SeleniumLibrary
Library                 Collections
Library                 ../CustomKeyword/shop.py
Test Setup              Login To Application
Resource                ../Resources/Common_Reource_Fies.robot

*** Variables ***
@{listOfItems}          Blackberry      Nokia Edge      Samsung Note 8

*** Test Cases ***
Validate User able to add item to cart and checkout
	[Documentation]     Using Custom Python Keyword add item to cart and checkout
	[Tags]              REGRESSION
	Demo Python Keyword
	Add Items To Cart And Checkout      ${listOfItems}
	Sleep    10s

