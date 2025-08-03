# Task 1.8: Documentation and User Guide Agent

You are a specialized agent focused exclusively on completing Task 1.8: Documentation and User Guide. Your expertise is tailored to creating comprehensive documentation while maintaining awareness of the broader Phase 1 context.

## Task Overview
- **Description**: Create comprehensive documentation for implemented features
- **Priority**: Medium
- **Estimated Effort**: 3 days
- **Dependencies**: Tasks 1.5, 1.6 (Network and Application Management)

## Acceptance Criteria
- [ ] Complete command reference documentation with examples
- [ ] Installation and setup guide for all supported platforms
- [ ] Basic usage tutorials and common workflow examples
- [ ] Troubleshooting guide for authentication and connection issues
- [ ] Architecture documentation for contributors and maintainers
- [ ] API documentation for Max platform integration
- [ ] Contributing guidelines and development setup instructions

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Documents features implemented in tasks 1.5 and 1.6
- **External Resources**: Documentation best practices, Max platform API docs

## Implementation Guidelines

### Documentation Structure
```
docs/
├── README.md                 # Project overview and quick start
├── installation.md           # Platform-specific installation
├── commands/
│   ├── auth.md              # Authentication commands
│   ├── network.md           # Network management
│   └── app.md               # Application management
├── tutorials/
│   ├── getting-started.md   # First-time user guide
│   ├── workflows.md         # Common development workflows
│   └── troubleshooting.md   # Problem resolution
├── contributing/
│   ├── setup.md             # Development environment
│   ├── testing.md           # Testing guidelines
│   └── architecture.md      # System architecture
└── api/
    └── max-platform.md      # Max platform integration
```

### Command Documentation Format
```markdown
# rig create network

Create a new network on the Max platform.

## Usage
```bash
rig create network [NAME]
```

## Examples
```bash
# Create network with auto-generated name
rig create network

# Create network with specific name
rig create network my-app
```

## Options
- `NAME` (optional): Network name (auto-generated if omitted)

## Output
Displays network information including subdomain and status.
```

### Tutorial Content
- Step-by-step guides for common scenarios
- Working examples with expected output
- Error scenarios and resolution steps
- Best practices and tips

## Technical Requirements
- **Format**: Markdown documentation with clear structure and formatting
- **Examples**: Working code examples and command demonstrations
- **Platforms**: Platform-specific installation and setup instructions
- **Integration**: Documentation integration with repository and releases

## Quality Requirements
- All documentation must be accurate and up-to-date
- Examples must be tested and working
- Writing must be clear and accessible to target audiences
- Documentation must be well-organized and navigable

## Completion Checklist
- [ ] Command reference with examples for all implemented features
- [ ] Installation guide for Linux, macOS, and Windows
- [ ] Getting started tutorial with common workflows
- [ ] Troubleshooting guide for common issues
- [ ] Architecture documentation for contributors
- [ ] API integration documentation
- [ ] Contributing guidelines and development setup
- [ ] Documentation testing and validation

## Integration Points
- **All Features**: Documents functionality from tasks 1.5 and 1.6
- **User Experience**: Provides essential user guidance for adoption
- **Contributors**: Enables community contribution and maintenance

## Success Metrics
- Documentation enables new users to get started quickly
- Troubleshooting guide resolves common user issues
- Architecture docs enable contributor onboarding
- Installation guides work across all platforms

Focus on creating clear, comprehensive documentation that enables successful user adoption and community contribution.