# Task 1.2: Authentication Context Module Agent

You are a specialized agent focused exclusively on completing Task 1.2: Authentication Context Module. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Implement the core authentication business logic module that handles user registration, login validation, password hashing, and authentication state management
- **Priority**: High
- **Estimated Effort**: 1.5 days
- **Dependencies**: Task 1 (User Schema) completion

## Acceptance Criteria
- [ ] Authentication context module created (Accounts context)
- [ ] User registration function with proper validation
- [ ] Login validation with email/password verification
- [ ] Password hashing utilities using bcrypt
- [ ] User lookup and authentication functions
- [ ] Password reset functionality foundation
- [ ] Comprehensive test coverage for all auth functions
- [ ] Integration with existing app context patterns

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Requires completed User schema from Task 1
- **External Resources**: Phoenix authentication patterns, bcrypt documentation
- **Integration Points**: Must work with existing TaskApp patterns

## Implementation Guidelines
### Authentication Context Structure
- Create `lib/task_app/accounts.ex` context module
- Follow Phoenix context conventions and patterns
- Implement proper error handling and return patterns
- Use consistent naming with existing app contexts

### Core Functions to Implement
```elixir
# User registration
register_user(attrs)
create_user_registration_changeset(user \\ %User{}, attrs)

# Authentication
authenticate_user(email, password)
get_user_by_email_and_password(email, password)

# Password management
hash_password(password)
valid_password?(user, password)

# User management
get_user!(id)
get_user_by_email(email)
update_user_password(user, password, attrs)
```

### Security Requirements
- Use bcrypt for password hashing (min 12 rounds)
- Implement timing attack protection
- Validate password strength requirements
- Handle authentication failures securely
- No password storage in logs or error messages

## Technical Requirements
- **Technologies**: Phoenix, Ecto, bcrypt_elixir
- **Pattern**: Phoenix context pattern
- **Security**: Bcrypt password hashing, secure comparisons
- **Performance**: Efficient database queries, minimal N+1 issues
- **Integration**: Align with existing task context patterns

## Quality Requirements
- Comprehensive test coverage (>90% for auth functions)
- Security-focused code review
- Performance benchmarking for auth operations
- Documentation for all public functions
- Error handling that doesn't leak information

## Completion Checklist
- [ ] Accounts context module created
- [ ] All authentication functions implemented
- [ ] Password hashing properly configured
- [ ] Comprehensive test suite created and passing
- [ ] Security review completed
- [ ] Performance validated
- [ ] Documentation added
- [ ] Integration tested with User schema

## Deliverables
- `lib/task_app/accounts.ex` (or accounts/ directory)
- `lib/task_app/accounts/user.ex` (if separating concerns)
- Test files: `test/task_app/accounts_test.exs`
- Documentation for authentication flows
- Security configuration updates

## Security Considerations
- Password hashing configuration in config files
- Rate limiting considerations for login attempts
- Secure session token generation
- CSRF protection coordination
- Input validation and sanitization

## Integration Points
- Must work with existing task management system
- Prepare for Task 3 UI integration
- Support Task 4 session management requirements
- Consider future authorization needs (Phase 2)

## Testing Strategy
- Unit tests for all authentication functions
- Integration tests with database
- Security tests for password handling
- Performance tests for auth operations
- Edge case testing (malformed inputs, empty values)

## Next Task Preparation
Upon completion, this context enables:
- **Task 3**: Registration and Login UI (can use auth functions)
- **Task 4**: Session Management (needs authentication functions)
- **Phase 2**: Authorization integration with existing tasks