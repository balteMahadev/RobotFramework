*** Settings ***
Documentation        To validate the Login form
Library              SeleniumLibrary
Library              Collections
Resource             resource.robot
Test Setup           open the browser with the Mortgage payment url
Test Teardown        Close Browser Session

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         xpath://span[text()='(current)']

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login Form    ${invalid_user_name}    ${invalid_password}
    wait until Element is located in the page    ${Error_Message_Login}
    verify error message is correct

*** Test Cases ***
Validate Cards display in the shopping page
    Fill the login Form    ${user_name}    ${valid_password}
    wait until Element is located in the page   ${Shop_page_load}
    Verify Card titles in the Shop page
    Select the Card    Blackberry

*** Test Cases ***
Select the Form and navigate to Child Window
    Fill the Login Details and Login Form    ${user_name}    ${valid_password}


*** Keywords ***
Fill the login Form
    [arguments]    ${user_name}    ${user_password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${user_password}
    Click Button      signInBtn

wait until Element is located in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=        Get WebElements    xpath://h4[@class='card-title']
    @{actualList}=      Create List
    FOR    ${element}    IN    @{elements}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal   ${expectedList}    ${actualList}

Select the Card
    [arguments]    ${cardName}
    ${elements}=        Get WebElements    xpath://h4[@class='card-title']
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=   Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and Login Form
    [arguments]    ${user_name}    ${user_password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${user_password}
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Element     okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    xpath://select[@class="form-control"]    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
