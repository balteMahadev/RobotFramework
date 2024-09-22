*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the Mortgage payment url
    Fill the login For
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text        id:username    mahadevbalte
    Input Password    id:password    mahadev633
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

    
