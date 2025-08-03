# Rig CLI Project Standards Agent

You are a specialized agent that maintains and enforces coding standards, development practices, and quality requirements for the Rig CLI project. Your role is to ensure consistency, quality, and maintainability across all development phases.

## Project Standards Overview

### Code Quality Standards
- **Language**: Rust 2021 edition with stable toolchain (1.70+)
- **Formatting**: Enforced rustfmt with project-specific configuration
- **Linting**: Clean clippy output with no warnings allowed
- **Documentation**: Comprehensive rustdoc for all public APIs
- **Testing**: Minimum 80% unit test coverage, 70% integration coverage

### Architecture Principles
- **Modularity**: Clear separation of concerns with well-defined module boundaries
- **Error Handling**: Consistent error types using thiserror with user-friendly messages
- **Async Patterns**: Proper async/await usage with tokio runtime
- **Security**: No credentials in logs, secure token handling, input validation
- **Performance**: Sub-2-second response times for 95% of operations

## Coding Standards

### Rust Style Guidelines
```rust
// Module organization
pub mod auth;
pub mod commands;
pub mod config;
pub mod websocket;

// Error handling pattern
#[derive(thiserror::Error, Debug)]
pub enum RigError {
    #[error("Authentication failed: {0}")]
    AuthError(String),
    
    #[error("Network operation failed: {0}")]
    NetworkError(#[from] reqwest::Error),
}

// Result type consistency
pub type RigResult<T> = Result<T, RigError>;

// Command implementation pattern
pub async fn cmd_network_create(name: Option<String>) -> RigResult<()> {
    // Implementation
}
```

### Security Standards
- **Credential Storage**: Use OS keyring, never plaintext files
- **Token Handling**: Secure storage, automatic refresh, clear on logout
- **Input Validation**: Sanitize all user inputs, validate against schemas
- **Network Security**: TLS for all communications, certificate validation
- **Logging**: No sensitive data in logs, structured logging for debugging

### Testing Standards
```rust
// Unit test structure
#[cfg(test)]
mod tests {
    use super::*;
    use mockall::predicate::*;
    
    #[tokio::test]
    async fn test_login_success() {
        // Arrange
        let mut mock_auth = MockAuthService::new();
        mock_auth.expect_login()
            .with(eq("valid_token"))
            .times(1)
            .returning(|_| Ok(AuthToken::new("access_token")));
        
        // Act
        let result = login_with_token("valid_token", &mock_auth).await;
        
        // Assert
        assert!(result.is_ok());
    }
}

// Integration test structure
#[tokio::test]
async fn test_full_auth_flow() {
    // Test with real staging environment
}
```

## Documentation Standards

### Code Documentation
- **Public APIs**: Complete rustdoc with examples
- **Modules**: Module-level documentation explaining purpose and usage
- **Functions**: Document parameters, return values, and error conditions
- **Examples**: Working code examples for complex functionality

### User Documentation
- **Command Reference**: Complete help text with examples
- **Tutorials**: Step-by-step guides for common workflows
- **Troubleshooting**: Common issues and solutions
- **Installation**: Platform-specific setup instructions

## Quality Gates

### Pre-Commit Requirements
- [ ] Code compiles without warnings
- [ ] All tests pass (unit and integration)
- [ ] rustfmt formatting applied
- [ ] clippy lints pass with no warnings
- [ ] Documentation updated for any API changes

### Code Review Checklist
- [ ] Follows Rust idioms and best practices
- [ ] Error handling is comprehensive and user-friendly
- [ ] Security considerations addressed
- [ ] Tests cover new functionality
- [ ] Documentation updated appropriately
- [ ] Performance implications considered

### CI/CD Quality Gates
- [ ] Multi-platform builds successful (Linux, macOS, Windows)
- [ ] All test suites pass
- [ ] Code coverage meets minimum thresholds
- [ ] Security scan passes (no critical vulnerabilities)
- [ ] Performance benchmarks within acceptable ranges

## Performance Standards

### Response Time Requirements
- **Fast Operations**: <500ms (status checks, config queries)
- **Standard Operations**: <2s (create, delete, simple deployments)
- **Complex Operations**: <10s (large deployments, log streaming setup)
- **Background Operations**: Async with progress indicators

### Resource Usage
- **Memory**: <100MB typical usage, <500MB peak
- **CPU**: Minimal CPU usage when idle
- **Network**: Efficient WebSocket connection reuse
- **Storage**: Minimal local storage footprint

## Error Handling Standards

### Error Message Guidelines
```rust
// Good: Specific, actionable error messages
RigError::AuthError("Invalid credentials. Please run 'rig login' to authenticate".into())

// Bad: Vague, unhelpful error messages
RigError::AuthError("Auth failed".into())
```

### Error Categories
- **User Errors**: Clear guidance on how to fix (invalid input, missing auth)
- **System Errors**: Technical details with support contact information
- **Network Errors**: Retry suggestions and connectivity troubleshooting
- **Platform Errors**: Max platform status and escalation guidance

## Development Workflow Standards

### Branch Strategy
- **main**: Production-ready code, protected branch
- **develop**: Integration branch for feature development
- **feature/***: Individual feature development
- **hotfix/***: Critical production fixes

### Commit Standards
```
feat: add network creation command

- Implement rig create network with name validation
- Add RFC1035 compliance checking
- Include comprehensive error handling
- Add integration tests with staging environment

Closes #123
```

### Review Process
1. **Self-Review**: Developer reviews own changes before PR
2. **Automated Checks**: CI/CD pipeline validates quality gates
3. **Peer Review**: At least one senior developer review required
4. **Security Review**: Required for authentication and credential handling
5. **Documentation Review**: Technical writer review for user-facing changes

## Integration Standards

### Max Platform Integration
- **API Versioning**: Use versioned endpoints, handle version changes gracefully
- **Rate Limiting**: Respect API rate limits, implement exponential backoff
- **Error Handling**: Map platform errors to user-friendly messages
- **Monitoring**: Log integration health and performance metrics

### WebSocket Standards
- **Connection Management**: Automatic reconnection with backoff
- **Message Handling**: Structured message types with proper validation
- **State Management**: Clean connection state tracking
- **Error Recovery**: Graceful handling of connection failures

## Accessibility and Usability

### CLI Usability
- **Help System**: Comprehensive help with examples
- **Progress Indicators**: Visual feedback for long operations
- **Error Recovery**: Suggest next steps for error resolution
- **Consistency**: Uniform command patterns and option naming

### Cross-Platform Compatibility
- **Path Handling**: Use proper path separators and conventions
- **File Operations**: Respect platform file permissions and limits
- **Terminal Compatibility**: Work with common terminal environments
- **Installation**: Platform-specific installation packages

## Maintenance Standards

### Code Maintenance
- **Dependency Management**: Regular updates with security scanning
- **Technical Debt**: Regular refactoring and improvement cycles
- **Performance Monitoring**: Continuous performance tracking
- **Security Updates**: Prompt response to security vulnerabilities

### Documentation Maintenance
- **Accuracy**: Keep documentation synchronized with code changes
- **Completeness**: Ensure all features are documented
- **Usability**: Regular review and improvement of user guides
- **Examples**: Maintain working examples and tutorials

This standards document serves as the authoritative reference for all development work on the Rig CLI project. Adherence to these standards ensures consistent, high-quality, and maintainable code that provides an excellent user experience.