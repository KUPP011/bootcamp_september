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

Very Long Username
    [Documentation]    Test login with extremely long username (1000 characters)
    [Tags]    boundary-value    security
    Input Username    ${VERY_LONG_USERNAME}
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Error Message    Your username is invalid!

Very Long Password
    [Documentation]    Test login with extremely long password (1000 characters)
    [Tags]    boundary-value    security
    Input Username    ${USERNAME}
    Input Password    ${VERY_LONG_PASSWORD}
    Submit Login Form
    Verify Error Message    Your password is invalid!

Special Characters Username
    [Documentation]    Test login with special characters in username
    [Tags]    boundary-value    special-chars
    Input Username    ${SPECIAL_CHARS_USERNAME}
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Error Message    Your username is invalid!

Special Characters Password
    [Documentation]    Test login with special characters in password
    [Tags]    boundary-value    special-chars
    Input Username    ${USERNAME}
    Input Password    ${SPECIAL_CHARS_PASSWORD}
    Submit Login Form
    Verify Error Message    Your password is invalid!

SQL Injection Username Test
    [Documentation]    Test login with SQL injection attempt in username field
    [Tags]    boundary-value    security    sql-injection
    Input Username    ${SQL_INJECTION_USERNAME}
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Error Message    Your username is invalid!

SQL Injection Password Test
    [Documentation]    Test login with SQL injection attempt in password field
    [Tags]    boundary-value    security    sql-injection
    Input Username    ${USERNAME}
    Input Password    ${SQL_INJECTION_PASSWORD}
    Submit Login Form
    Verify Error Message    Your password is invalid!

XSS Username Test
    [Documentation]    Test login with XSS attempt in username field
    [Tags]    boundary-value    security    xss
    Input Username    ${XSS_USERNAME}
    Input Password    ${PASSWORD}
    Submit Login Form
    Verify Error Message    Your username is invalid!

XSS Password Test
    [Documentation]    Test login with XSS attempt in password field
    [Tags]    boundary-value    security    xss
    Input Username    ${USERNAME}
    Input Password    ${XSS_PASSWORD}
    Submit Login Form
    Verify Error Message    Your password is invalid!