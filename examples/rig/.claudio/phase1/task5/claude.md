# Task 1.5: Network Management Commands Agent

You are a specialized agent focused exclusively on completing Task 1.5: Network Management Commands. Your expertise is tailored to implementing network creation, management, and status commands while maintaining awareness of the broader Phase 1 context.

## Task Overview
- **Description**: Implement network creation, management, and status commands
- **Priority**: High
- **Estimated Effort**: 4 days
- **Dependencies**: Task 1.4 (WebSocket Communication Layer)

## Acceptance Criteria
- [ ] `rig create network [name]` with optional automatic name generation
- [ ] RFC1035 compliant name validation for network names
- [ ] `rig status network [name]` with comprehensive network information
- [ ] `rig list networks` showing all user networks with status
- [ ] `rig delete network [name]` with confirmation prompts
- [ ] Network subdomain generation and validation (network.domain.example)
- [ ] Error handling for network operations with helpful guidance

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Task 1.4 provides WebSocket communication foundation
- **External Resources**: RFC1035 specification, Max platform network API documentation

## Implementation Guidelines

### Network Commands Structure
```rust
// src/commands/network.rs
use clap::Subcommand;

#[derive(Subcommand)]
pub enum NetworkCommand {
    Create {
        #[arg(help = "Network name (optional, auto-generated if omitted)")]
        name: Option<String>,
    },
    Status {
        #[arg(help = "Network name to check status")]
        name: String,
    },
    List,
    Delete {
        #[arg(help = "Network name to delete")]
        name: String,
    },
}
```

### Name Validation
- RFC1035 compliance for domain name compatibility
- Uniqueness validation within user's networks
- Clear error messages for invalid names
- Automatic name generation with meaningful defaults

### Status Display
- Comprehensive network information display
- Both human-readable and JSON output formats
- Real-time status updates via WebSocket

## Technical Requirements
- **Validation**: RFC1035 domain name validation implementation
- **API Integration**: Network management API endpoints via WebSocket
- **Output Formatting**: Both human-readable and JSON formats
- **State Management**: Network status tracking and caching

## Quality Requirements
- All network operations must validate input thoroughly
- Error messages must provide clear guidance for resolution
- Status information must be accurate and up-to-date
- Commands must handle network API failures gracefully

## Completion Checklist
- [ ] Network creation with name validation
- [ ] Network status display with comprehensive info
- [ ] Network listing with status overview
- [ ] Network deletion with confirmation
- [ ] RFC1035 name validation
- [ ] Subdomain generation and validation
- [ ] Integration tests for network operations
- [ ] Error handling for all network scenarios

## Integration Points
- **Task 1.4**: Uses WebSocket communication for network API calls
- **Task 1.6**: Provides network foundation for application management
- **Shared Validation**: Network name validation used by other components

## Success Metrics
- Network commands work reliably with Max platform
- Name validation prevents invalid network creation
- Status information is accurate and useful
- Error handling provides clear user guidance

Focus on creating reliable network management that provides the foundation for application deployment workflows.