# Task 3.1: Authentication Test Suite Agent

You are a specialized agent focused exclusively on completing Task 3.1: Authentication Test Suite. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Create comprehensive test suite for all authentication functionality including unit tests, integration tests, edge cases, and automated test coverage reporting
- **Priority**: High
- **Estimated Effort**: 0.5 days
- **Dependencies**: Complete authentication system from Phases 1 and 2

## Acceptance Criteria
- [ ] Unit tests for all authentication functions (registration, login, logout)
- [ ] Integration tests for complete authentication workflows
- [ ] Test coverage report showing >95% coverage for auth code
- [ ] Edge case and error scenario testing
- [ ] Automated test suite integrated with CI/CD
- [ ] Mock and fixture data for consistent testing
- [ ] Performance tests for authentication operations
- [ ] Documentation for test maintenance and extension

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Phases**: Complete authentication system from Phases 1 and 2
- **Coordination**: Work with Task 3.3 (Integration Testing) to avoid duplication
- **External Resources**: Phoenix testing documentation, ExUnit patterns

## Implementation Guidelines
### Test Categories
1. **Unit Tests**: Individual function testing
2. **Context Tests**: Authentication context module testing
3. **Controller Tests**: Authentication controller endpoints
4. **LiveView Tests**: Authentication LiveView components
5. **Plug Tests**: Authentication and authorization plugs
6. **Integration Tests**: Complete authentication workflows

### Test Coverage Requirements
- **Authentication Functions**: 100% coverage
- **Authorization Functions**: 100% coverage
- **Controller Actions**: 100% coverage
- **LiveView Interactions**: 95% coverage
- **Error Handling**: 100% coverage
- **Overall Auth Module**: >95% coverage

## Testing Strategy
### Unit Testing Focus
```elixir
# Authentication context tests
test "registers user with valid data"
test "rejects registration with invalid email"
test "rejects weak passwords"
test "authenticates user with correct credentials"
test "rejects authentication with wrong password"
test "hashes passwords securely"

# Authorization tests
test "authorizes task owner"
test "rejects unauthorized user"
test "handles missing resources"
```

### Integration Testing Focus
- Complete registration workflow
- Login → task access → logout workflow
- Session persistence across requests
- Error handling and recovery
- Authentication state management

## Quality Requirements
- All tests must be deterministic and reliable
- Tests must run quickly (authentication suite <10 seconds)
- Comprehensive edge case coverage
- Clear test descriptions and assertions
- Mock external dependencies appropriately
- Test data cleanup between tests

## Completion Checklist
- [ ] Unit tests for all authentication functions
- [ ] Integration tests for auth workflows
- [ ] Test coverage >95% validated
- [ ] Edge cases and error scenarios covered
- [ ] Test suite runs consistently and quickly
- [ ] CI/CD integration configured
- [ ] Test documentation complete
- [ ] Mock data and fixtures created

## Deliverables
- `test/task_app/accounts_test.exs` (authentication context tests)
- `test/task_app_web/controllers/auth_controller_test.exs`
- `test/task_app_web/live/auth_live_test.exs`
- `test/task_app_web/plugs/auth_plugs_test.exs`
- Test fixtures and factory updates
- Test coverage configuration
- Authentication test documentation

## Test Scenarios to Cover
### Registration Testing
- Valid registration with correct data
- Invalid email format rejection
- Weak password rejection
- Duplicate email handling
- Registration form validation
- Success and error message display

### Login Testing
- Successful login with correct credentials
- Login rejection with wrong password
- Login rejection with non-existent user
- Account lockout after failed attempts (if implemented)
- Login form validation and error handling

### Session Management Testing
- Session creation and persistence
- Session timeout handling
- Logout and session cleanup
- Session security (fixation prevention)
- Concurrent session handling

### Authorization Testing
- Task ownership validation
- Unauthorized access prevention
- Resource not found handling
- Permission error messages
- Authorization consistency across controllers/LiveViews

## Performance Testing
- Authentication operation benchmarks
- Password hashing performance
- Session lookup efficiency
- Database query performance for auth operations
- Memory usage during authentication

## Mock and Test Data Strategy
- Create realistic user fixtures
- Mock external services appropriately
- Consistent test data across test suite
- Test data cleanup and isolation
- Factory pattern for user/task creation

## CI/CD Integration
- Test suite runs on every commit
- Coverage reporting in CI pipeline
- Performance regression detection
- Test result reporting and notifications
- Automated test maintenance checks

## Coordination with Other Tasks
### Task 3.3 (Integration Testing)
- Share test scenarios to avoid duplication
- Coordinate test data and fixtures
- Align on testing tool usage
- Share performance benchmarks

### Task 3.2 (Security Audit)
- Provide test coverage for security scenarios
- Validate security test completeness
- Share authentication attack scenario tests

## Next Task Support
Upon completion, this test suite enables:
- **Task 3.2**: Security audit can reference comprehensive test scenarios
- **Task 3.3**: Integration testing can build on authentication test foundation
- **Task 3.4**: Performance validation can use authentication benchmarks