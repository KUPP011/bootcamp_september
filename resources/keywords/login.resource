*** Settings ***
Library    Browser
Library    DateTime
Resource    ../variables/common.resource

*** Keywords ***
Take Screenshot With Timestamp
    [Documentation]    Takes a screenshot with a timestamp in the filename
    ...                Screenshots are saved in the screenshots/ directory with format: screenshot_YYYYMMDD_HHMMSS.png
    [Arguments]    ${description}=screenshot
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${filename}=    Set Variable    screenshots/${description}_${timestamp}.png
    TRY
        Take Screenshot    ${filename}
        Log    Screenshot saved: ${filename}
    EXCEPT    AS    ${error}
        Log    Failed to take screenshot: ${error}    WARN
    END

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
    Take Screenshot With Timestamp    before_input_username
    Wait For Elements State    ${USERNAME_FIELD}    visible    5s
    Fill Text    ${USERNAME_FIELD}    ${username}
    Take Screenshot With Timestamp    after_input_username

Input Password
    [Arguments]    ${password}
    Take Screenshot With Timestamp    before_input_password
    Wait For Elements State    ${PASSWORD_FIELD}    visible    5s
    Fill Text    ${PASSWORD_FIELD}    ${password}
    Take Screenshot With Timestamp    after_input_password

Submit Login Form
    Take Screenshot With Timestamp    before_submit_login
    Wait For Elements State    ${SUBMIT_BUTTON}    enabled    5s
    Scroll To Element    ${SUBMIT_BUTTON}
    Click    ${SUBMIT_BUTTON}
    # Wait for either success or error message
    ${success}=    Get Element States    ${SUCCESS_MESSAGE}    then    visible    timeout=5s
    ${error}=    Get Element States    ${ERROR_MESSAGE}    then    visible    timeout=5s
    Take Screenshot With Timestamp    after_submit_login

Verify Successful Login
    Wait For Elements State    ${SUCCESS_MESSAGE}    visible    5s
    Get Text    ${SUCCESS_MESSAGE}    contains    Logged In Successfully

Verify Error Message
    [Arguments]    ${expected_message}
    Wait For Elements State    ${ERROR_MESSAGE}    visible    5s
    Get Text    ${ERROR_MESSAGE}    ==    ${expected_message}