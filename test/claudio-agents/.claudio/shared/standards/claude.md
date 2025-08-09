# Project Standards and Conventions Context

You are working on the Phoenix Task App User Authentication project. This context provides shared standards and conventions that should be followed across all phases and tasks.

## Phoenix Application Conventions

### Code Organization
- Follow Phoenix 1.7+ directory structure
- Use context modules for business logic organization  
- Separate web layer from business logic
- Group related functionality in appropriate contexts

### Authentication Standards
- Use bcrypt for password hashing (minimum 12 rounds)
- Implement secure session management with Phoenix defaults
- Follow Phoenix authentication best practices
- Use policy-based authorization patterns

### Database Standards
- Use Ecto migrations for all schema changes
- Include proper database constraints and indexes
- Follow naming conventions: snake_case for tables and columns
- Always include timestamps in migrations
- Make migrations reversible where possible

### Testing Standards
- Comprehensive test coverage (minimum 90%, target 95%+)
- Use ExUnit for all testing
- Follow AAA pattern: Arrange, Act, Assert
- Create factories for test data generation
- Mock external dependencies appropriately

## Security Requirements

### Authentication Security
- Password strength requirements (minimum 8 characters)
- Secure password hashing with salt
- Session timeout configuration
- CSRF protection enabled
- Secure cookie configuration (httpOnly, secure, sameSite)

### Authorization Security
- Principle of least privilege
- Resource-based access control (users own their tasks)
- Consistent authorization checks across all endpoints
- Fail-safe authorization (default deny)
- Proper error handling without information leakage

### Data Security
- Input validation and sanitization
- SQL injection prevention through Ecto
- XSS prevention through Phoenix HTML helpers
- Secure handling of sensitive data
- Audit logging for security events

## Performance Standards

### Database Performance
- Optimize queries for user-scoped operations
- Use appropriate indexes for authentication lookups
- Minimize N+1 query problems
- Monitor query performance in development

### Application Performance
- Authentication operations under 100ms response time
- Task loading under 200ms for typical user data
- Session operations optimized for concurrent users
- Memory usage within acceptable limits

## Code Quality Standards

### Code Style
- Follow Elixir community style guidelines
- Use consistent naming conventions
- Write clear, self-documenting code
- Include appropriate comments for complex logic

### Error Handling
- Use Elixir's {:ok, result} / {:error, reason} patterns
- Provide user-friendly error messages
- Log errors appropriately without exposing sensitive data
- Handle edge cases gracefully

### Documentation
- Document all public functions with @doc
- Include examples in documentation
- Maintain README with setup and usage instructions
- Document security considerations and deployment notes

## Integration Standards

### LiveView Integration
- Handle authentication state changes in real-time
- Use Phoenix PubSub for user-scoped real-time updates
- Maintain consistent authentication state across components
- Handle network connectivity issues gracefully

### API Standards (if applicable)
- RESTful endpoint design
- Consistent JSON response format
- Proper HTTP status codes
- Authentication required for all authenticated endpoints

## Deployment and Maintenance

### Environment Configuration
- Secure secret key management
- Environment-specific configuration
- Database connection security
- Session store configuration

### Monitoring and Logging
- Log authentication events appropriately
- Monitor application performance
- Track security-related events
- Set up appropriate alerting

## Development Workflow

### Version Control
- Use meaningful commit messages
- Branch naming conventions for features
- Code review requirements
- Testing requirements before merge

### Development Environment
- Consistent development setup across team
- Database migration procedures
- Test data management
- Local development authentication setup

These standards should be referenced and followed by all agents working on tasks within this project. Any deviations should be documented and justified within the specific task context.