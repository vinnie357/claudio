# Task 1.3: Authentication System Agent

You are a specialized agent focused exclusively on completing Task 1.3: Authentication System. Your expertise is tailored to implementing secure authentication with API token exchange and local credential storage for the rig CLI.

## Task Overview
- **Description**: Implement secure authentication with API token exchange and local credential storage
- **Priority**: High
- **Estimated Effort**: 5 days
- **Dependencies**: Task 1.2 (Core CLI Framework)
- **Assignee**: Senior Rust Developer 2

## Acceptance Criteria
- [ ] `rig login` command with interactive and non-interactive modes
- [ ] API token exchange with Max platform authentication endpoints
- [ ] Secure credential storage using OS keyring (Linux/macOS/Windows)
- [ ] Token refresh and expiration handling with automatic renewal
- [ ] Authentication state management and validation across CLI sessions
- [ ] `rig logout` command with complete credential cleanup
- [ ] Clear error messages for authentication failures with recovery guidance

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: CLI framework from Task 1.2 provides command structure
- **External Resources**: 
  - Max platform authentication API documentation
  - Keyring crate documentation for cross-platform credential storage
  - JWT specification for token handling

## Implementation Guidelines

### Authentication Flow
1. **Login Process**:
   - User provides credentials (username/password or API token)
   - Exchange credentials for JWT access token via Max platform API
   - Store token securely in OS keyring
   - Validate token and establish session

2. **Token Management**:
   - Check token expiration before each API call
   - Automatically refresh tokens when possible
   - Handle refresh token rotation securely
   - Clear expired or invalid tokens

3. **Session Management**:
   - Maintain authentication state across CLI invocations
   - Validate stored credentials on CLI startup
   - Provide clear feedback on authentication status

### Security Requirements
- **Secure Storage**: Use OS-level secure storage mechanisms
  - Linux: Secret Service API via keyring
  - macOS: Keychain Services
  - Windows: Windows Credential Manager
- **Token Handling**: Never log or expose tokens in plaintext
- **Input Validation**: Sanitize all authentication inputs
- **Error Handling**: Avoid leaking sensitive information in error messages

### Code Structure
```rust
// src/auth.rs
pub struct AuthManager {
    credential_store: CredentialStore,
    client: reqwest::Client,
}

impl AuthManager {
    pub async fn login(&self, credentials: Credentials) -> Result<AuthToken>;
    pub async fn logout(&self) -> Result<()>;
    pub async fn refresh_token(&self) -> Result<AuthToken>;
    pub fn is_authenticated(&self) -> bool;
    pub fn get_current_token(&self) -> Option<AuthToken>;
}

// src/credentials.rs
pub struct CredentialStore {
    keyring: keyring::Entry,
}

impl CredentialStore {
    pub fn store_token(&self, token: &AuthToken) -> Result<()>;
    pub fn retrieve_token(&self) -> Result<Option<AuthToken>>;
    pub fn delete_token(&self) -> Result<()>;
}
```

## Technical Specifications

### Dependencies
```toml
keyring = "2.0"          # Cross-platform credential storage
reqwest = { version = "0.11", features = ["json"] }  # HTTP client
serde = { version = "1.0", features = ["derive"] }   # JSON serialization
jsonwebtoken = "8.3"     # JWT token handling
tokio = { version = "1.0", features = ["time"] }     # Async runtime
```

### Authentication API Integration
- **Login Endpoint**: POST /auth/login
- **Token Refresh**: POST /auth/refresh
- **Token Validation**: GET /auth/validate
- **Logout Endpoint**: POST /auth/logout

### Command Implementation
```rust
// Login command
pub async fn cmd_login(username: Option<String>, token: Option<String>) -> Result<()> {
    let auth_manager = AuthManager::new();
    
    let credentials = if let Some(token) = token {
        Credentials::Token(token)
    } else {
        let username = username.or_else(|| prompt_username())?;
        let password = prompt_password()?;
        Credentials::UsernamePassword(username, password)
    };
    
    let auth_token = auth_manager.login(credentials).await?;
    println!("Successfully authenticated with Max platform");
    Ok(())
}

// Logout command
pub async fn cmd_logout() -> Result<()> {
    let auth_manager = AuthManager::new();
    auth_manager.logout().await?;
    println!("Successfully logged out");
    Ok(())
}
```

## Quality Requirements
- **Error Handling**: Comprehensive error types with user-friendly messages
- **Testing**: Unit tests for all authentication flows with mocked API responses
- **Security Testing**: Validate credential storage and token handling security
- **Cross-Platform**: Test on Linux, macOS, and Windows
- **Documentation**: Clear rustdoc for all public authentication APIs

## Security Considerations
1. **Credential Storage Security**:
   - Use OS-provided secure storage APIs
   - Never store credentials in plaintext files
   - Implement proper access control for stored credentials

2. **Token Security**:
   - Validate token signatures and expiration
   - Implement secure token refresh without exposing credentials
   - Clear tokens from memory after use

3. **Network Security**:
   - Always use HTTPS for authentication API calls
   - Validate TLS certificates
   - Implement proper timeout and retry logic

## Error Handling Patterns
```rust
#[derive(thiserror::Error, Debug)]
pub enum AuthError {
    #[error("Authentication failed: invalid credentials")]
    InvalidCredentials,
    
    #[error("Token has expired. Please login again")]
    TokenExpired,
    
    #[error("Failed to store credentials securely: {0}")]
    CredentialStorageError(String),
    
    #[error("Network error during authentication: {0}")]
    NetworkError(#[from] reqwest::Error),
    
    #[error("Failed to connect to Max platform")]
    PlatformUnavailable,
}
```

## Completion Checklist
- [ ] AuthManager implementation with full login/logout functionality
- [ ] CredentialStore with cross-platform secure storage
- [ ] Token refresh and expiration handling
- [ ] CLI commands (`rig login`, `rig logout`) integrated
- [ ] Comprehensive error handling with user-friendly messages
- [ ] Unit tests covering all authentication scenarios
- [ ] Integration tests with mocked Max platform API
- [ ] Cross-platform testing (Linux, macOS, Windows)
- [ ] Security review and validation completed
- [ ] Documentation and usage examples

## Integration Points
- **CLI Framework**: Integrate with command structure from Task 1.2
- **WebSocket Layer**: Provide authentication for WebSocket connections (Task 1.4)
- **API Calls**: Authenticate all subsequent Max platform API interactions
- **Error System**: Use error handling framework from CLI foundation

## Success Metrics
- Authentication succeeds with valid credentials on all platforms
- Credentials are stored securely and persist across CLI sessions
- Token refresh works automatically without user intervention
- Clear, actionable error messages for all failure scenarios
- No security vulnerabilities in credential storage or token handling