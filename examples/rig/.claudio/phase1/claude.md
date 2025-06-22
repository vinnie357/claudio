# Phase 1: Foundation and Core Commands Agent

You are a specialized agent for Phase 1 of the Rig CLI Enhancement project. Your role is to coordinate and execute tasks within this foundational phase while establishing the technical foundation for all subsequent development.

## Phase Overview
- **Duration**: 4 weeks (Weeks 1-4)
- **Objectives**: Establish robust project foundation, implement secure authentication, create basic network/app management commands, and set up comprehensive testing infrastructure
- **Dependencies**: Max platform API access, development environment setup
- **Deliverables**: Functional CLI with authentication, network management, basic app commands, CI/CD pipeline, and comprehensive documentation

## Phase Tasks
### Critical Path Tasks (Must be completed in order):
1. **Task 1.1: Project Infrastructure Setup** (3 days) - Technical Lead + DevOps Engineer
2. **Task 1.2: Core CLI Framework** (4 days) - Senior Rust Developer 1
3. **Task 1.3: Authentication System** (5 days) - Senior Rust Developer 2  
4. **Task 1.4: WebSocket Communication Layer** (6 days) - Senior Rust Developer 1
5. **Task 1.5: Network Management Commands** (4 days) - Senior Rust Developer 2
6. **Task 1.6: Basic Application Management** (5 days) - Senior Rust Developer 1

### Parallel Tasks:
- **Task 1.7: Testing Framework and CI/CD** (4 days) - QA Engineer + DevOps Engineer (starts after 1.1)
- **Task 1.8: Documentation and User Guide** (3 days) - Technical Lead (starts after 1.5, 1.6)

## Context Management
- **Individual Task Contexts**: Each task (1.1-1.8) has its own context in `task{N}/claude.md`
- **Shared Resources**: Reference `../shared/standards/claude.md` for coding standards and `../shared/utilities/claude.md` for common utilities
- **Next Phase Preparation**: Ensure authentication and basic commands are fully functional for Phase 2 advanced features

## Phase Objectives

### Primary Goals
1. **Solid Foundation**: Create robust, extensible project structure following Rust best practices
2. **Secure Authentication**: Implement production-ready authentication with secure credential storage
3. **Core Communication**: Establish reliable WebSocket communication with Phoenix channels
4. **Essential Commands**: Provide functional network and application management capabilities
5. **Quality Infrastructure**: Set up comprehensive testing, CI/CD, and documentation systems

### Success Criteria
- Authentication system fully functional with secure cross-platform credential storage
- WebSocket communication stable and reliable with automatic reconnection
- Basic network and application commands working end-to-end with Max platform
- CI/CD pipeline operational with automated testing and quality gates
- Code coverage >80% with comprehensive unit and integration tests
- Documentation complete and validated through user testing

## Technical Architecture

### Project Structure
```
rig/
├── Cargo.toml              # Dependencies and project configuration
├── src/
│   ├── main.rs            # CLI entry point
│   ├── cli.rs             # Command-line interface with clap
│   ├── config.rs          # Configuration management
│   ├── error.rs           # Error types and handling
│   ├── auth.rs            # Authentication logic
│   ├── credentials.rs     # Secure credential storage
│   ├── websocket.rs       # WebSocket client for Phoenix channels
│   ├── connection.rs      # Connection state management
│   ├── commands/
│   │   ├── mod.rs         # Command module exports
│   │   ├── network.rs     # Network management commands
│   │   └── app.rs         # Application management commands
│   ├── models/
│   │   ├── mod.rs         # Data model exports
│   │   └── app.rs         # Application data structures
│   └── validation.rs      # Input validation utilities
├── tests/
│   ├── integration/       # Integration tests
│   └── common/           # Test utilities
└── docs/                 # Documentation
```

### Key Dependencies
- **clap**: Command-line argument parsing and help generation
- **tokio**: Async runtime for WebSocket and HTTP communication
- **serde**: JSON serialization/deserialization
- **keyring**: Cross-platform secure credential storage
- **reqwest**: HTTP client for API communication
- **tokio-tungstenite**: WebSocket client implementation

## Integration Requirements

### Max Platform Integration
- **Authentication API**: Token exchange and validation
- **Phoenix Channels**: WebSocket communication protocol
- **Network API**: Network creation, management, and status
- **Application API**: App creation, deployment, and lifecycle management

### Security Requirements
- **Credential Storage**: OS-level secure storage (Keychain, Credential Manager, etc.)
- **TLS Communication**: All API and WebSocket communications over TLS
- **Token Management**: Secure token refresh and expiration handling
- **Input Validation**: RFC1035 name validation and parameter sanitization

## Quality Assurance

### Testing Strategy
- **Unit Tests**: >80% code coverage using cargo test
- **Integration Tests**: End-to-end testing with Max platform staging
- **Security Tests**: Authentication flow and credential storage validation
- **Performance Tests**: Command response time benchmarking

### Code Quality Standards
- **Formatting**: Enforced rustfmt configuration
- **Linting**: Clean clippy output with no warnings
- **Documentation**: Comprehensive rustdoc for all public APIs
- **Error Handling**: Structured error types with user-friendly messages

## Risk Management

### Identified Risks and Mitigation
1. **WebSocket Integration Complexity**
   - **Risk**: Phoenix channels protocol implementation challenges
   - **Mitigation**: Early prototype development, close platform team collaboration
   - **Fallback**: HTTP polling if WebSocket proves problematic

2. **Cross-Platform Credential Storage**
   - **Risk**: Platform-specific secure storage implementation issues
   - **Mitigation**: Use established keyring libraries, early multi-platform testing
   - **Monitoring**: Test on all target platforms in CI/CD

3. **Authentication Flow Complexity**
   - **Risk**: Complex token exchange and refresh logic
   - **Mitigation**: Comprehensive testing of auth scenarios, clear error handling
   - **Validation**: End-to-end auth testing with staging environment

## Communication Protocols

### Daily Coordination
- **Morning Standup**: Task progress, blockers, and coordination needs
- **Code Reviews**: All code changes reviewed by Technical Lead
- **Integration Points**: Coordination between dependent tasks

### Phase Gate Reviews
- **Week 2 Review**: Infrastructure and CLI framework completion
- **Week 3 Review**: Authentication and WebSocket communication validation
- **Phase Completion**: All acceptance criteria met, integration tests passing

### Documentation Updates
- **Task Completion**: Update task status immediately upon completion
- **Issue Tracking**: Document blockers and resolutions in task status files
- **Knowledge Sharing**: Update shared context with learned patterns and solutions

## Handoff to Phase 2

### Required Deliverables
- Functional CLI with working authentication system
- Stable WebSocket communication with Phoenix channels
- Basic network and application management commands
- Comprehensive test suite with >80% coverage
- Complete documentation and user guides

### Phase 2 Prerequisites
- Authentication system fully tested and production-ready
- WebSocket communication layer stable for real-time features
- Basic command infrastructure ready for advanced feature addition
- CI/CD pipeline operational for continuous integration

## Context References
- **Project Standards**: `../shared/standards/claude.md` for coding conventions
- **Shared Utilities**: `../shared/utilities/claude.md` for common functionality
- **Task Contexts**: `task{1-8}/claude.md` for individual task implementation details
- **Discovery Report**: `../discovery.md` for technical background and requirements
- **Implementation Plan**: `../plan.md` for overall project strategy and timeline

When coordinating Phase 1 work, focus on building a solid foundation that enables rapid development of advanced features in subsequent phases. Prioritize code quality, security, and reliability over feature completeness, as this phase establishes the technical foundation for the entire project.