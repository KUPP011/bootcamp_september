*** Variables ***
${BROWSER}    chromium
${HEADLESS}    ${False}
${URL}    https://practicetestautomation.com/practice-test-login/
${USERNAME}    student
${PASSWORD}    Password123

# Test Data for Negative Cases
${INVALID_USERNAME}    incorrectUser
${INVALID_PASSWORD}    incorrectPass
${VERY_LONG_USERNAME}    thisisaverylongusernamethatexceedsthemaximumlengthallowed123456789
${VERY_LONG_PASSWORD}    thisisaverylongpasswordthatexceedsthemaximumlengthallowed123456789!@#$%^
${SPECIAL_CHARS_USERNAME}    user@#$%^&*
${SPECIAL_CHARS_PASSWORD}    pass@#$%^&*
${SQL_INJECTION_USERNAME}    ' OR '1'='1
${XSS_USERNAME}    <script>alert('xss')</script>

# Screenshot Directory
${SCREENSHOT_DIR}    ${CURDIR}${/}..${/}..${/}screenshots

# Locators
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${SUBMIT_BUTTON}    id=submit
${SUCCESS_MESSAGE}    css=.post-title
${ERROR_MESSAGE}    id=error
${DASHBOARD_ELEMENT}    css=.post-title