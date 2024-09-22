*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Resource             resource.robot
Test Setup           open the browser with the Mortgage payment url
Test Teardown        Close Browser Session


*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Validate Child Window Functionality
    Select the link of Child window
    Verify the user is Switches to Child window
    Grab the Email id in the Child window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element        css:.blinkingText
    Sleep                10

Verify the user is Switches to Child window
    Switch Window        NEW
    Element Text Should Be    xpath://div/h1    DOCUMENTS REQUEST

Grab the Email id in the Child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    @{words_02}=    Split String    ${text}
    ${email}=    Get From List    ${words}    0
    Set Global Variable        ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}


    
