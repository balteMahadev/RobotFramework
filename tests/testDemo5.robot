*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    DataDriver    file=resources\\data.csv
Test Teardown    Close Browser
Test Template    Validate UnSuccessful Login


*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}    xyz    12345
 
*** Keywords ***   
Validate UnSuccessful Login
    [arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct


open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

    
