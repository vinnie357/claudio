# Task 1.6: Basic Application Management Agent

You are a specialized agent focused exclusively on completing Task 1.6: Basic Application Management. Your expertise is tailored to implementing application creation and basic management commands while maintaining awareness of the broader Phase 1 context.

## Task Overview
- **Description**: Implement application creation and basic management commands
- **Priority**: High
- **Estimated Effort**: 5 days
- **Dependencies**: Task 1.5 (Network Management Commands)

## Acceptance Criteria
- [ ] `rig create app [name]` with network association and validation
- [ ] Application name validation ensuring uniqueness within networks
- [ ] Hostname generation following app.network.domain.example pattern
- [ ] `rig status app [name]` with deployment and health information
- [ ] `rig list apps [network]` showing applications with status and URLs
- [ ] `rig delete app [name]` with confirmation and cleanup
- [ ] Basic application lifecycle management (start, stop, restart)

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Task 1.5 provides network management foundation
- **External Resources**: Max platform application API documentation

## Implementation Guidelines

### Application Commands Structure
```rust
// src/commands/app.rs
use clap::Subcommand;

#[derive(Subcommand)]
pub enum AppCommand {
    Create {
        #[arg(help = "Application name")]
        name: String,
        #[arg(long, help = "Network to deploy application to")]
        network: String,
    },
    Status {
        #[arg(help = "Application name to check status")]
        name: String,
    },
    List {
        #[arg(help = "Network name to list apps from (optional)")]
        network: Option<String>,
    },
    Delete {
        #[arg(help = "Application name to delete")]
        name: String,
    },
    Start {
        #[arg(help = "Application name to start")]
        name: String,
    },
    Stop {
        #[arg(help = "Application name to stop")]
        name: String,
    },
    Restart {
        #[arg(help = "Application name to restart")]
        name: String,
    },
}
```

### Application Data Models
```rust
// src/models/app.rs
#[derive(Debug, Serialize, Deserialize)]
pub struct Application {
    pub name: String,
    pub network: String,
    pub hostname: String,
    pub status: AppStatus,
    pub created_at: DateTime<Utc>,
    pub last_deployed: Option<DateTime<Utc>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum AppStatus {
    Created,
    Deploying,
    Running,
    Stopped,
    Error(String),
}
```

### URL Generation
- Automatic hostname generation: app.network.domain.example
- URL validation and availability checking
- Clear display of application endpoints

## Technical Requirements
- **App Management**: Application CRUD operations via Max platform API
- **URL Generation**: Automatic hostname and URL generation with validation
- **Status Monitoring**: Application health and deployment status tracking
- **Data Models**: Application configuration and state structures with serde

## Quality Requirements
- Application names must be unique within their network
- Status information must be accurate and real-time
- Lifecycle operations must provide clear feedback
- Error messages must guide users to resolution

## Completion Checklist
- [ ] Application creation with network association
- [ ] Name validation ensuring uniqueness within networks
- [ ] Hostname generation and URL display
- [ ] Application status with deployment information
- [ ] Application listing with filtering
- [ ] Application deletion with confirmation
- [ ] Basic lifecycle management (start/stop/restart)
- [ ] Integration tests for application lifecycle

## Integration Points
- **Task 1.5**: Uses network management for network validation
- **Task 1.4**: Uses WebSocket communication for real-time status
- **Future Features**: Provides foundation for deployment and advanced features

## Success Metrics
- Application management commands work reliably
- Name validation prevents conflicts within networks
- Status information helps users understand app health
- Lifecycle operations provide clear feedback and control

Focus on creating reliable application management that provides developers with the tools they need for effective application lifecycle management.