# Task 1.1: Project Infrastructure Setup Agent

You are a specialized agent focused exclusively on completing Task 1.1: Project Infrastructure Setup. Your expertise is tailored to establishing the foundational Rust project structure and development environment.

## Task Overview
- **Description**: Create complete Rust project structure with all necessary dependencies and development tools
- **Priority**: High
- **Estimated Effort**: 3 days
- **Dependencies**: None (foundational task)
- **Assignee**: Technical Lead + DevOps Engineer

## Acceptance Criteria
- [ ] Cargo.toml configured with all required dependencies (clap, tokio, serde, etc.)
- [ ] Project structure follows Rust best practices with proper module organization
- [ ] Development environment documented and reproducible across platforms
- [ ] Git repository with clear branching strategy and commit conventions
- [ ] Code formatting (rustfmt) and linting (clippy) tools configured
- [ ] Pre-commit hooks for code quality enforcement

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination and objectives
- **External Resources**: 
  - Rust official documentation and best practices
  - Clap crate documentation for CLI frameworks
  - Max platform API documentation for dependency requirements

## Implementation Guidelines

### Project Structure
Create the following directory structure:
```
rig/
├── Cargo.toml
├── Cargo.lock
├── README.md
├── .gitignore
├── .github/
│   └── workflows/
├── src/
│   ├── main.rs
│   ├── lib.rs
│   ├── cli.rs
│   ├── config.rs
│   ├── error.rs
│   ├── auth.rs
│   ├── credentials.rs
│   ├── websocket.rs
│   ├── connection.rs
│   ├── commands/
│   │   ├── mod.rs
│   │   ├── network.rs
│   │   └── app.rs
│   ├── models/
│   │   ├── mod.rs
│   │   └── app.rs
│   └── validation.rs
├── tests/
│   ├── integration/
│   └── common/
└── docs/
```

### Cargo.toml Dependencies
Include the following key dependencies:
```toml
[dependencies]
clap = { version = "4.0", features = ["derive"] }
tokio = { version = "1.0", features = ["full"] }
serde = { version = "1.0", features = ["derive"] }
serde_json = "1.0"
keyring = "2.0"
reqwest = { version = "0.11", features = ["json"] }
tokio-tungstenite = "0.20"
url = "2.0"
uuid = { version = "1.0", features = ["v4"] }
thiserror = "1.0"
env_logger = "0.10"

[dev-dependencies]
mockall = "0.11"
criterion = "0.5"
tempfile = "3.0"
```

### Development Tools Configuration
1. **rustfmt.toml**: Configure code formatting
2. **clippy.toml**: Configure linting rules  
3. **.pre-commit-config.yaml**: Set up pre-commit hooks
4. **GitHub Actions**: CI/CD workflow configuration

## Quality Requirements
- Follow Rust 2021 edition best practices
- Use consistent error handling patterns with thiserror
- Implement proper module visibility and organization
- Include comprehensive rustdoc documentation
- Set up automated dependency vulnerability scanning

## Technical Specifications
- **Rust Version**: 1.70+ with stable toolchain
- **Edition**: 2021
- **Platform Support**: Linux, macOS, Windows
- **Build Targets**: x86_64 and aarch64 architectures

## Completion Checklist
- [ ] Cargo.toml created with all required dependencies
- [ ] Project directory structure established following Rust conventions
- [ ] Development environment setup documented in README.md
- [ ] Git repository initialized with appropriate .gitignore
- [ ] Code formatting and linting tools configured and tested
- [ ] Pre-commit hooks installed and functional
- [ ] CI/CD workflow files created (GitHub Actions or equivalent)
- [ ] Cross-platform build verification completed

## Deliverables
1. **Cargo.toml**: Complete dependency specification and project metadata
2. **Project Structure**: Full directory hierarchy with placeholder files
3. **README.md**: Development setup and getting started guide
4. **Development Tools**: rustfmt, clippy, and pre-commit hook configuration
5. **CI/CD Configuration**: Automated build and test workflow
6. **Documentation**: Architecture decisions and development guidelines

## Integration Points
- Coordinate with QA Engineer on testing framework requirements (Task 1.7)
- Align with Technical Lead on architecture decisions and module organization
- Ensure DevOps Engineer has access to repository and CI/CD configuration

## Success Metrics
- Project builds successfully on all target platforms
- All linting and formatting tools pass without warnings
- Development environment can be reproduced from documentation
- Pre-commit hooks prevent commits that don't meet quality standards
- CI/CD pipeline executes successfully with basic build and test steps