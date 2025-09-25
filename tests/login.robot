*** Settings ***
Resource    ../resources/keywords/login.resource
Test Setup    Open Browser To Login Page
Test Teardown    Close Browser

*** Test Cases ***
Valid Login
    [Documentation]    Test that a user can log in with valid credentials.
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Successful Login

Invalid Username
    [Documentation]    Test login with invalid username but valid password
    Input Username    ${INVALID_USERNAME}
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Error Message    Your username is invalid!

Invalid Password
    [Documentation]    Test login with valid username but invalid password
    Input Username    ${USERNAME}
    Input Password    ${INVALID_PASSWORD}
    Submit Login Form
    Verify Error Message    Your password is invalid!

Empty Username
    [Documentation]    Test login with empty username
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Error Message    Your username is invalid!

Empty Password
    [Documentation]    Test login with empty password
    Input Username    ${USERNAME}
    Submit Login Form
    Verify Error Message    Your password is invalid!