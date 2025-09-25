*** Settings ***
Resource    ../resources/keywords/login.resource
Test Setup    Open Browser To Login Page
Test Teardown    Close Browser

*** Test Cases ***
Valid Login
    [Documentation]    Test that a user can log in with valid credentials.
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    before_login
    Submit Login Form
    Verify Successful Login
    Take Screenshot With Timestamp    after_login

Invalid Username
    [Documentation]    Test login with invalid username but valid password
    Input Username    ${INVALID_USERNAME}
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    invalid_username
    Submit Login Form
    Verify Error Message    Your username is invalid!

Invalid Password
    [Documentation]    Test login with valid username but invalid password
    Input Username    ${USERNAME}
    Input Password    ${INVALID_PASSWORD}
    Take Screenshot With Timestamp    invalid_password
    Submit Login Form
    Verify Error Message    Your password is invalid!

Empty Username
    [Documentation]    Test login with empty username
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    empty_username
    Submit Login Form
    Verify Error Message    Your username is invalid!

Empty Password
    [Documentation]    Test login with empty password
    Input Username    ${USERNAME}
    Take Screenshot With Timestamp    empty_password
    Submit Login Form
    Verify Error Message    Your password is invalid!

Very Long Username
    [Documentation]    Test login with username exceeding maximum length
    Input Username    ${VERY_LONG_USERNAME}
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    long_username
    Submit Login Form
    Verify Error Message    Your username is invalid!

Very Long Password
    [Documentation]    Test login with password exceeding maximum length
    Input Username    ${USERNAME}
    Input Password    ${VERY_LONG_PASSWORD}
    Take Screenshot With Timestamp    long_password
    Submit Login Form
    Verify Error Message    Your password is invalid!

Special Characters Username
    [Documentation]    Test login with special characters in username
    Input Username    ${SPECIAL_CHARS_USERNAME}
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    special_chars_username
    Submit Login Form
    Verify Error Message    Your username is invalid!

Special Characters Password
    [Documentation]    Test login with special characters in password
    Input Username    ${USERNAME}
    Input Password    ${SPECIAL_CHARS_PASSWORD}
    Take Screenshot With Timestamp    special_chars_password
    Submit Login Form
    Verify Error Message    Your password is invalid!

SQL Injection Attempt
    [Documentation]    Test login with SQL injection attempt in username
    Input Username    ${SQL_INJECTION_USERNAME}
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    sql_injection
    Submit Login Form
    Verify Error Message    Your username is invalid!

XSS Attempt
    [Documentation]    Test login with XSS attempt in username
    Input Username    ${XSS_USERNAME}
    Input Password    ${PASSWORD}
    Take Screenshot With Timestamp    xss_attempt
    Submit Login Form
    Verify Error Message    Your username is invalid!