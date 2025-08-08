# Test Extended Context Template

This template is used by test-command-generator to create project-specific extended context in `prompts/test/claude.md` for generated test commands.

## Template Structure:

```markdown
# {PROJECT_NAME} Testing Context

## Project Testing Overview
- **Project Type**: {PROJECT_TYPE}
- **Test Framework**: {TEST_FRAMEWORK} ({VERSION})
- **Test Runner**: `{TEST_COMMAND}`
- **Coverage Tool**: {COVERAGE_TOOL}
- **Test Directory**: {TEST_DIRECTORY}
- **Configuration**: {CONFIG_FILES}

## Project Structure and Patterns
{PROJECT_STRUCTURE_ANALYSIS}

### Directory Structure
```
{TEST_DIRECTORY_TREE}
```

### Testing File Patterns
{TESTING_FILE_PATTERNS}

## Framework-Specific Context

### {TEST_FRAMEWORK} Configuration
{FRAMEWORK_CONFIGURATION}

### Test Categories and Organization
{TEST_CATEGORIES_BREAKDOWN}

### Common Testing Patterns
{PROJECT_SPECIFIC_PATTERNS}

## Project-Specific Testing Requirements

### Dependencies and Setup
{DEPENDENCY_SETUP_INFO}

### Environment Configuration
{ENVIRONMENT_CONFIG}

### Database and External Service Testing
{EXTERNAL_DEPENDENCIES}

### Authentication and Authorization Testing
{AUTH_TESTING_PATTERNS}

## Common Issues and Solutions

### Frequent Test Failures
{COMMON_FAILURE_PATTERNS}

### Performance Considerations
{PERFORMANCE_TESTING_NOTES}

### Debugging and Troubleshooting
{DEBUGGING_STRATEGIES}

### Flaky Test Management
{FLAKY_TEST_HANDLING}

## Integration Points

### CI/CD Integration
{CI_CD_INTEGRATION_DETAILS}

### Code Coverage Requirements
{COVERAGE_REQUIREMENTS}

### Quality Gates and Thresholds
{QUALITY_THRESHOLDS}

### Deployment Testing
{DEPLOYMENT_TESTING}

## Test Command Usage Patterns

### Standard Usage
- `{TEST_COMMAND}` - Run all tests
- `{TEST_COMMAND} {PATTERN_FLAG}` - Run specific test patterns
- `{COVERAGE_COMMAND}` - Generate coverage reports
- `{WATCH_COMMAND}` - Run tests in watch mode

### Project-Specific Commands
{PROJECT_SPECIFIC_COMMANDS}

### Performance and Load Testing
{PERFORMANCE_TEST_COMMANDS}

## Gemini AI Integration Context

### AI Analysis Capabilities
- **Failure Pattern Recognition**: {AI_FAILURE_ANALYSIS}
- **Test Quality Assessment**: {AI_QUALITY_ANALYSIS}
- **Coverage Gap Analysis**: {AI_COVERAGE_ANALYSIS}
- **Performance Bottleneck Detection**: {AI_PERFORMANCE_ANALYSIS}

### Gemini Context Prompts
{GEMINI_CONTEXT_PROMPTS}

### AI-Generated Task Categories
{AI_TASK_CATEGORIES}

## Best Practices and Standards

### Test Writing Guidelines
{TEST_WRITING_GUIDELINES}

### Code Quality Standards
{QUALITY_STANDARDS}

### Documentation Requirements
{TEST_DOCUMENTATION}

### Review and Maintenance
{MAINTENANCE_PRACTICES}

## Advanced Testing Strategies

### Integration Testing
{INTEGRATION_TEST_STRATEGIES}

### End-to-End Testing
{E2E_TEST_STRATEGIES}

### API Testing
{API_TEST_STRATEGIES}

### Component/Unit Testing
{COMPONENT_TEST_STRATEGIES}

## Troubleshooting Guide

### Common Setup Issues
{SETUP_TROUBLESHOOTING}

### Framework-Specific Problems
{FRAMEWORK_TROUBLESHOOTING}

### Performance Issues
{PERFORMANCE_TROUBLESHOOTING}

### CI/CD Issues
{CI_CD_TROUBLESHOOTING}

## Reference Links and Resources

### Documentation
- {TEST_FRAMEWORK} Documentation: {DOCS_LINKS}
- Project-Specific Testing Docs: {PROJECT_DOCS}

### Tools and Utilities
- Testing Utilities: {TESTING_UTILITIES}
- Debugging Tools: {DEBUGGING_TOOLS}
- Performance Tools: {PERFORMANCE_TOOLS}
```

## Replacement Variables:

- `{PROJECT_NAME}`: Project name from discovery
- `{PROJECT_TYPE}`: React, Node.js, Python, etc.
- `{TEST_FRAMEWORK}`: Jest, pytest, RSpec, etc.
- `{VERSION}`: Framework version
- `{TEST_COMMAND}`: Primary test execution command
- `{COVERAGE_TOOL}`: Coverage analysis tool
- `{TEST_DIRECTORY}`: Test directory path
- `{CONFIG_FILES}`: Configuration file locations
- `{PROJECT_STRUCTURE_ANALYSIS}`: Analysis from discovery
- `{TEST_DIRECTORY_TREE}`: Visual directory structure
- `{TESTING_FILE_PATTERNS}`: File naming patterns
- `{FRAMEWORK_CONFIGURATION}`: Framework-specific config
- `{TEST_CATEGORIES_BREAKDOWN}`: Types of tests identified
- `{PROJECT_SPECIFIC_PATTERNS}`: Patterns found in codebase
- Additional variables for specific context areas...

## Framework-Specific Context Examples:

### JavaScript/React Context
```markdown
## Framework-Specific Context

### Jest Configuration
- Configuration file: `jest.config.js`
- Test environment: jsdom for React components
- Custom matchers: @testing-library/jest-dom
- Mock strategies: Manual mocks in __mocks__/

### Test Categories and Organization
- **Unit Tests**: Component logic (`*.test.jsx`)
- **Integration Tests**: Component interaction (`*.integration.test.jsx`)
- **Snapshot Tests**: UI consistency (`*.snap.test.jsx`)
- **Hook Tests**: Custom React hooks (`*.hooks.test.js`)

### Common Testing Patterns
- Render components with React Testing Library
- Use screen queries for element selection
- fireEvent for user interaction simulation
- waitFor for async operations
```

### Python Context
```markdown
## Framework-Specific Context

### Pytest Configuration
- Configuration file: `pytest.ini` or `pyproject.toml`
- Test discovery: `test_*.py` and `*_test.py`
- Fixtures: Defined in `conftest.py`
- Plugins: pytest-cov, pytest-mock, pytest-asyncio

### Test Categories and Organization
- **Unit Tests**: Function and class testing (`test_*.py`)
- **Integration Tests**: Database and API (`tests/integration/`)
- **Functional Tests**: End-to-end workflows (`tests/functional/`)
- **Performance Tests**: Load and stress testing (`tests/performance/`)
```

This template ensures the generated extended context provides comprehensive, project-specific testing guidance and integration patterns.