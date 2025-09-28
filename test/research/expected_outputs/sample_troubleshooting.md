# Node.js Testing Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Tests timing out on async operations
- **Symptoms**: Tests fail with timeout errors, especially on database or API operations
- **Diagnosis**: Check for missing await keywords, unresolved promises, or infinite loops
- **Solution**: Increase timeout values, add proper await/async handling, use jest.setTimeout()
- **Prevention**: Always use async/await consistently, implement proper error handling

### Issue 2: Mock functions not being called as expected
- **Symptoms**: Mock assertions fail, expected calls don't match actual calls
- **Diagnosis**: Verify mock setup timing, check if mocks are properly imported
- **Solution**: Use jest.clearAllMocks() between tests, verify mock implementation
- **Prevention**: Set up mocks in beforeEach hooks, use jest.resetModules() when needed

### Issue 3: Database test interference and state pollution
- **Symptoms**: Tests pass individually but fail when run together, inconsistent results
- **Diagnosis**: Check for shared database state, missing cleanup operations
- **Solution**: Implement proper test isolation, use transactions or separate test databases
- **Prevention**: Always clean up test data, use database snapshots or migrations

### Issue 4: Coverage reports showing incorrect percentages
- **Symptoms**: Code coverage doesn't match expected values, missing or inflated numbers
- **Diagnosis**: Check coverage configuration, verify file inclusion/exclusion patterns
- **Solution**: Update jest.config.js coverage settings, exclude irrelevant files
- **Prevention**: Regularly review coverage reports, set appropriate thresholds

### Issue 5: Environment variable conflicts in tests
- **Symptoms**: Tests behave differently in CI vs local, configuration-related failures
- **Diagnosis**: Check for missing or conflicting environment variables
- **Solution**: Use .env.test files, mock process.env in tests, set defaults
- **Prevention**: Document required environment variables, use consistent test setup

## Advanced Troubleshooting

### Performance Issues
- **Slow Test Execution**: Use parallel testing, optimize database operations, reduce test scope
- **Memory Leaks**: Implement proper cleanup, avoid global state, monitor heap usage
- **CI Pipeline Delays**: Cache dependencies, use test sharding, optimize Docker images

### Integration Problems
- **API Testing Failures**: Use proper mocking strategies, implement retry logic, verify network configurations
- **Database Connection Issues**: Configure connection pooling, handle connection timeouts, use health checks
- **Third-party Service Dependencies**: Mock external services, use contract testing, implement circuit breakers

### Edge Cases
- **Timezone-related Test Failures**: Use fixed timezones in tests, mock Date objects, test across timezones
- **File System Permission Issues**: Use temporary directories, mock file operations, check user permissions
- **Race Conditions**: Implement proper synchronization, use deterministic test data, avoid shared resources

## Diagnostic Tools

### Testing Tools
- **Jest CLI**: `--verbose`, `--detectOpenHandles`, `--forceExit` flags
- **Node.js Inspector**: `--inspect-brk` for debugging tests
- **Memory Profiling**: `--expose-gc` and heap snapshots
- **Test Coverage**: `--coverage` with detailed reporting

### Debugging Commands
```bash
# Run specific test with debugging
npm test -- --testNamePattern="specific test" --verbose

# Check for open handles
npm test -- --detectOpenHandles

# Generate coverage report
npm test -- --coverage --coverageReporters=html
```

### Monitoring Tools
- **Performance Monitoring**: Use clinic.js for performance analysis
- **Memory Analysis**: Implement heap dumps and memory profiling
- **Test Metrics**: Track test execution time and failure patterns

## When to Escalate

### Signs Expert Help is Needed
- **Persistent Memory Leaks**: When cleanup strategies don't resolve memory issues
- **Complex Integration Failures**: Multi-service testing problems require architecture review  
- **Performance Degradation**: Significant slowdown across entire test suite
- **CI/CD Pipeline Issues**: Infrastructure-level testing problems
- **Security Testing Concerns**: When testing reveals security vulnerabilities

### Escalation Resources
- Node.js testing community forums
- Framework-specific GitHub issues
- Performance monitoring service support
- DevOps team for CI/CD infrastructure issues