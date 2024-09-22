*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported selenium library
Library    SeleniumLibrary

*** Variables ***
${invalid_user_name}    Mahadev
${invalid_password}     12341234
${user_name}            rahulshettyacademy
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/




*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To               ${url}
    
Close Browser Session
    Close Browser