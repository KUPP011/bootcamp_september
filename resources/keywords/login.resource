*** Settings ***
Library    Browser
Library    DateTime
Resource    ../variables/common.resource

*** Keywords ***
Take Screenshot With Timestamp
    [Arguments]    ${name}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Take Screenshot    ${SCREENSHOT_DIR}${/}${name}_${timestamp}.png

*** Keywords ***
Open Browser To Login Page
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page    ${URL}
    Get Title    contains    Test Login

Input Username
    [Documentation]    Inputs the provided username into the username field on the login page.
    ...    
    ...    Arguments:
    ...    - ${username}: The username to be entered into the username input field.
    ...    
    ...    This keyword uses the 'Fill Text' keyword to populate the username field with the specified value
    [Arguments]    ${username}
    Wait For Elements State    ${USERNAME_FIELD}    visible    5s
    Fill Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Wait For Elements State    ${PASSWORD_FIELD}    visible    5s
    Fill Text    ${PASSWORD_FIELD}    ${password}

Submit Login Form
    Wait For Elements State    ${SUBMIT_BUTTON}    enabled    5s
    Scroll To Element    ${SUBMIT_BUTTON}
    Click    ${SUBMIT_BUTTON}
    # Wait for either success or error message
    ${success}=    Get Element States    ${SUCCESS_MESSAGE}    then    visible    timeout=5s
    ${error}=    Get Element States    ${ERROR_MESSAGE}    then    visible    timeout=5s

Verify Successful Login
    Wait For Elements State    ${SUCCESS_MESSAGE}    visible    5s
    Get Text    ${SUCCESS_MESSAGE}    contains    Logged In Successfully

Verify Error Message
    [Arguments]    ${expected_message}
    Wait For Elements State    ${ERROR_MESSAGE}    visible    5s
    Get Text    ${ERROR_MESSAGE}    ==    ${expected_message}