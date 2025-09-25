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

## Test Cases

### Positive Tests
- Valid Login: Verifies successful login with valid credentials

### Negative Tests
- Invalid Username: Tests login with incorrect username
- Invalid Password: Tests login with incorrect password
- Empty Username: Tests login with empty username field
- Empty Password: Tests login with empty password field

## Page Object Model Implementation

### Keywords (resources/keywords/login.resource)
- Input Username
- Input Password
- Submit Login Form
- Verify Successful Login
- Verify Error Message

### Variables (resources/variables/common.resource)
- Browser configuration
- Test data
- Page locators

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