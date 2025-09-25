*** Variables ***
${BROWSER}    chromium
${HEADLESS}    ${False}
${URL}    https://practicetestautomation.com/practice-test-login/
${USERNAME}    student
${PASSWORD}    Password123

# Test Data for Negative Cases
${INVALID_USERNAME}    incorrectUser
${INVALID_PASSWORD}    incorrectPass

# Locators
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${SUBMIT_BUTTON}    id=submit
${SUCCESS_MESSAGE}    css=.post-title
${ERROR_MESSAGE}    id=error
${DASHBOARD_ELEMENT}    css=.post-title