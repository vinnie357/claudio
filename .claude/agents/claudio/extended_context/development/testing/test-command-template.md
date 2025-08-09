# Test Command Template

This template is used by test-command-generator to create project-specific `/claudio:test` commands.

## Template Structure:

```markdown
---
description: "Run {PROJECT_TYPE} test suite with intelligent analysis and optional fixes"
argument-hint: "[test_pattern] [--fix]"
---

Run the {PROJECT_NAME} test suite using {TEST_FRAMEWORK} with intelligent summary and analysis.

**Test Framework**: {TEST_FRAMEWORK} ({VERSION})
**Test Runner**: `{TEST_COMMAND}`
**Coverage Tool**: {COVERAGE_TOOL}
**Test Directory**: {TEST_DIRECTORY}

**Usage:**
- `/test` - Run all tests with summary
- `/test [pattern]` - Run specific test pattern (e.g., `/test user` for user-related tests)
- `/test --fix` - Run tests and create fix plan for failures

**Project-Specific Features:**
{CUSTOM_FEATURES}

**Test Categories Detected:**
{TEST_CATEGORIES}

**Integration:**
- **CI/CD**: {CI_INTEGRATION}
- **Coverage Reports**: {COVERAGE_INTEGRATION}  
- **Watch Mode**: {WATCH_MODE_SUPPORT}

Use the claudio:{PROJECT_SLUG}-test-runner subagent to execute tests and analyze results with project-specific understanding.

**Reference**: Uses `.claude/agents/claudio/prompts/test/claude.md` for project-specific testing context and patterns.
```

## Replacement Variables:

- `{PROJECT_TYPE}`: React, Node.js, Python, etc.
- `{PROJECT_NAME}`: Actual project name from discovery
- `{TEST_FRAMEWORK}`: Jest, pytest, RSpec, etc.
- `{VERSION}`: Framework version if detected
- `{TEST_COMMAND}`: npm test, pytest, etc.
- `{COVERAGE_TOOL}`: nyc, coverage.py, etc.  
- `{TEST_DIRECTORY}`: tests/, __tests__/, spec/, etc.
- `{CUSTOM_FEATURES}`: Project-specific testing features
- `{TEST_CATEGORIES}`: Unit, integration, e2e, etc.
- `{CI_INTEGRATION}`: GitHub Actions, Jenkins, etc.
- `{COVERAGE_INTEGRATION}`: Codecov, Coveralls, etc.
- `{WATCH_MODE_SUPPORT}`: How to run tests in watch mode
- `{PROJECT_SLUG}`: Sanitized project name for agent naming

## Framework-Specific Customizations:

### JavaScript/React
```markdown
**Project-Specific Features:**
- Component testing with React Testing Library
- Snapshot testing for UI components
- Jest configuration with custom matchers
- Async testing for hooks and effects

**Test Categories Detected:**
- Unit Tests: Component logic and utilities
- Integration Tests: Component interaction
- Snapshot Tests: UI consistency validation
```

### Python
```markdown  
**Project-Specific Features:**
- Pytest fixtures for test setup
- Parametrized testing for data validation
- Mock integration for external dependencies
- Async test support for asyncio code

**Test Categories Detected:**
- Unit Tests: Function and class testing
- Integration Tests: Database and API integration
- Performance Tests: Load and stress testing
```

### Node.js API
```markdown
**Project-Specific Features:**
- API endpoint testing with Supertest
- Database integration testing
- Authentication and middleware testing
- WebSocket and real-time feature testing

**Test Categories Detected:**
- Unit Tests: Business logic and utilities
- Integration Tests: API endpoints and database
- End-to-End Tests: Complete workflow validation
```

This template ensures generated test commands are specifically tailored to each project's testing setup and requirements.