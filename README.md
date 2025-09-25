# Robot Framework Test Automation Project

This repository contains automated tests for the login functionality using Robot Framework with Browser Library. The project follows the Page Object Model (POM) pattern for better maintainability and reusability.

## Project Structure

```
project-root/
├── tests/          # Test suites
│   └── login.robot # Login test cases
├── resources/      # Reusable components
│   ├── keywords/   # Page actions and workflows
│   │   └── login.resource
│   └── variables/ # Shared configuration and locators
│       └── common.resource
└── README.md
```

## Prerequisites

- Python 3.8 or higher
- pip (Python package installer)
- Node.js (required for Browser library)

## Setup Instructions

1. Create and activate a virtual environment:
```powershell
python -m venv venv
.\venv\Scripts\activate  # Windows
```

2. Install required packages:
```powershell
pip install robotframework robotframework-browser
rfbrowser init
```

## Running Tests

### Run all tests in the login suite:
```powershell
robot tests/login.robot
```

### Run a specific test case:
```powershell
robot -t "Valid Login" tests/login.robot
```

### Run with custom variables:
```powershell
robot --variable BROWSER:firefox --variable HEADLESS:True tests/login.robot
```

### Run boundary value tests only:
```powershell
robot --include boundary-value tests/login.robot
```

### Run security tests only:
```powershell
robot --include security tests/login.robot
```

### Run specific test types:
```powershell
robot --include sql-injection tests/login.robot
robot --include xss tests/login.robot
robot --include special-chars tests/login.robot
```

## Test Cases

### Positive Tests
- Valid Login: Verifies successful login with valid credentials

### Negative Tests
- Invalid Username: Tests login with incorrect username
- Invalid Password: Tests login with incorrect password
- Empty Username: Tests login with empty username field
- Empty Password: Tests login with empty password field

### Boundary Value Tests
- Very Long Username: Tests with extremely long username (1000+ characters)
- Very Long Password: Tests with extremely long password (1000+ characters)
- Special Characters Username: Tests with special characters in username
- Special Characters Password: Tests with unicode and special characters in password
- SQL Injection Username Test: Tests SQL injection attempts in username field
- SQL Injection Password Test: Tests SQL injection attempts in password field
- XSS Username Test: Tests XSS (Cross-Site Scripting) attempts in username field
- XSS Password Test: Tests XSS attempts in password field

## Page Object Model Implementation

### Keywords (resources/keywords/login.resource)
- Input Username
- Input Password
- Submit Login Form
- Verify Successful Login
- Verify Error Message
- Take Screenshot With Timestamp (NEW)

### Variables (resources/variables/common.resource)
- Browser configuration
- Test data
- Page locators

## Screenshot Functionality

The framework now includes automatic screenshot capture capabilities:

### Features
- **Automatic Screenshots**: Screenshots are taken before and after important actions (input username, input password, submit form)
- **Timestamp Naming**: All screenshots include timestamps in format `YYYYMMDD_HHMMSS`
- **Organized Storage**: Screenshots are saved in the `screenshots/` directory
- **Manual Screenshots**: Use the `Take Screenshot With Timestamp` keyword for custom screenshots

### Screenshot Naming Convention
- `before_input_username_YYYYMMDD_HHMMSS.png`
- `after_input_username_YYYYMMDD_HHMMSS.png`
- `before_input_password_YYYYMMDD_HHMMSS.png`
- `after_input_password_YYYYMMDD_HHMMSS.png`
- `before_submit_login_YYYYMMDD_HHMMSS.png`
- `after_submit_login_YYYYMMDD_HHMMSS.png`

### Manual Screenshot Usage
```robotframework
Take Screenshot With Timestamp    custom_description
```

**Note:** Screenshots are automatically excluded from version control via `.gitignore`

## Test Organization and Tags

Tests are organized using tags for easy filtering and execution:

### Available Tags
- `boundary-value`: All boundary value tests
- `security`: Security-related tests (SQL injection, XSS, very long inputs)
- `special-chars`: Tests with special characters
- `sql-injection`: SQL injection specific tests
- `xss`: Cross-Site Scripting specific tests

### Running Tests by Tag Examples
```powershell
# Run all boundary value tests
robot --include boundary-value tests/login.robot

# Run all security tests
robot --include security tests/login.robot

# Run specific security test types
robot --include sql-injection tests/login.robot
robot --include xss tests/login.robot
```

## Best Practices

1. Use meaningful test case names and documentation
2. Follow Robot Framework's keyword-driven approach
3. Maintain separation of concerns (test cases, keywords, variables)
4. Use appropriate waits and assertions
5. Keep test data separate from test logic

## For AI Agents

### Key Files and Their Purposes
- `tests/login.robot`: Contains test cases and their implementation
- `resources/keywords/login.resource`: Page-specific keywords and actions
- `resources/variables/common.resource`: Configuration and locator variables

### Important Variables
- `${BROWSER}`: Browser type (chromium, firefox, webkit)
- `${HEADLESS}`: Browser visibility flag
- `${URL}`: Application URL
- `${USERNAME}`, `${PASSWORD}`: Test credentials

### Test Data
- Valid credentials: 
  - Username: student
  - Password: Password123

### Locators
- Username field: `id=username`
- Password field: `id=password`
- Submit button: `id=submit`
- Success message: `css=.post-title`
- Error message: `id=error`

### Coding Conventions
1. Use clear, descriptive variable names
2. Follow Robot Framework's space-separated format
3. Include proper documentation for keywords
4. Maintain consistent indentation
5. Use appropriate tags for test organization

## Test Reports

After test execution, the following reports are generated:
- `log.html`: Detailed test execution log
- `report.html`: Test results summary
- `output.xml`: Raw execution data

## Debugging Tips

1. Set `${HEADLESS}` to `${False}` for visible browser execution
2. Use appropriate waits for element visibility
3. Check test logs for detailed execution steps
4. Use tags to organize and run specific test groups

## Contact

For questions or suggestions, please open an issue in the repository.