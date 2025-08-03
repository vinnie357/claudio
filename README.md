# Claudio

A comprehensive project analysis, planning, and implementation system for Claude Code that transforms any codebase into an organized, trackable development process.

## What is Claudio?

Claudio is a comprehensive project analysis system built on specialized AI agents that work together to **discover, plan, and implement** project solutions. The system uses an **agent-based architecture** where different specialized agents handle discovery, requirements, planning, documentation, security analysis, and implementation. The default workflow combines **discovery and planning** into a unified process, with **implementation as an optional separate phase**.

## Agent-Based Architecture

Claudio employs specialized AI agents that orchestrate different aspects of project analysis:

- **Discovery Agent**: Analyzes project structure, technology stack, and existing capabilities
- **PRD Agent**: Transforms discovery findings into clear business requirements and success criteria
- **Planning Agent**: Creates phased implementation roadmaps with time estimates and dependencies
- **Task Agent**: Breaks down plans into executable tasks with specialized execution contexts
- **Documentation Agent**: Generates comprehensive documentation (README, API docs, user guides)
- **Security Agent**: Performs STRIDE-based security analysis with visual threat modeling
- **Research Agent**: Conducts topic-specific research and creates expert knowledge bases
- **Implementation Agent**: Executes plans through coordinated task processing

Each agent is self-contained but works cooperatively, referencing other agents' outputs to create comprehensive, integrated project analysis and implementation plans.

## Requirements

- **Claude Code CLI**: This system is designed for use with [Claude Code](https://claude.ai/code)
- The Claude Code CLI provides the runtime environment and tools that Claudio agents use
- No additional installations required - Claudio works within your existing Claude Code setup

## Quick Start

### Option 1: Direct Analysis (Recommended for Individual Use)
Analyze projects directly with the Claudio source repository:

```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access
claude --add-dir /path/to/my-code
# or with relative paths:
claude --add-dir ../my-code

# 3. Analyze the external project
/claudio:claudio /path/to/my-code

# 4. Optional: Execute implementation when ready
/claudio:implement /path/to/my-code
```

**Why use --add-dir?** This flag allows Claude Code to access and analyze projects outside the Claudio directory while keeping Claudio's system files separate from your project code.

### Option 2: Install Claudio to Your Project (Recommended for Teams)
Install Claudio directly into your project for team consistency:

```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude from Claudio directory
claude

# 3. Install Claudio to your project
/install /path/to/your-project

# 4. Navigate to your project and use installed Claudio
cd /path/to/your-project
claude

# 5. Use installed commands
/claudio:claudio
/claudio:implement  # When ready to execute
```

### Option 3: Global User Installation
Install Claudio globally for system-wide access:

```bash
# 1. From Claudio directory
/install commands user

# 2. Use from any project directory
cd /any/project
claude
/claudio:claudio
```

**Benefits of Installation**:
- Keep Claudio updated across multiple projects with `/claudio:upgrade`
- Share the same analysis system with your team
- Version control your Claudio setup alongside your project
- Maintain consistency in project analysis across your organization

This will create a comprehensive `.claudio/` folder in your target project with:
- **Discovery Report**: Technology stack and capability analysis
- **Requirements Document**: Clear project objectives and success criteria  
- **Implementation Plan**: Phased roadmap with time estimates
- **Task Breakdown**: Executable tasks with specialized contexts
- **Progress Tracking**: Status monitoring at project, phase, and task levels

**Note**: The default `/claudio:claudio` command focuses on **discovery and planning**. Implementation is handled separately with the optional `/claudio:implement` command.

## How New Users Can Get Started

### Complete Workflow (Recommended)
1. **Clone and setup**: `git clone <repo> && cd claudio`
2. **Start Claude with access**: `claude --add-dir /path/to/your/project`
3. **Discovery & Planning**: `/claudio:claudio /path/to/your/project` (combines project analysis and implementation planning)
4. **Review the plans**: Check the generated `.claudio/` folder in your project
5. **Optional Implementation**: `/claudio:implement /path/to/your/project` (when ready to execute)
6. **Keep system updated**: `/claudio:upgrade --check` periodically

### Team/Organization Setup
1. **Install to project**: `/install /path/to/team/project`
2. **Team members use**: Navigate to project, start Claude, use `/claudio:claudio`
3. **Stay updated**: Use `/claudio:upgrade` to keep installation current
4. **Version control**: Commit `.claude/` folder for team consistency

### For Individual Tasks
Use specific commands for focused work:
```bash
/claudio:discovery ./my-app          # Analyze project structure
/claudio:security-review ./my-app    # STRIDE security analysis
/claudio:documentation readme ./my-app   # Generate README
/claudio:prd feature user-auth       # Create requirements doc
/claudio:plan project my-app "8 weeks"   # Create implementation plan
/claudio:test-review                 # Analyze testing patterns
/claudio:gcms                       # Generate commit messages
```

### Understanding the Output
After running Claudio on a project, you'll find:

```
your-project/
└── .claudio/
    ├── summary.md          # Executive overview
    ├── discovery.md        # Technology analysis  
    ├── prd.md             # Requirements
    ├── plan.md            # Implementation roadmap
    ├── status.md          # Progress tracking
    ├── research/          # Topic-specific research
    ├── docs/              # Generated documentation
    │   └── security/      # Security analysis with STRIDE methodology
    └── phase1/, phase2/   # Task breakdown with contexts
```

## Task Execution Model

### How Task Contexts Work
Claudio's task system has been designed for efficient, focused execution:

**Agent-Driven Task Execution**: Each task context (`.claudio/phase*/task*/claude.md`) contains specialized agent instructions that produce actionable next steps rather than work summaries.

**Coordinated Processing**: Task agents work through the Task orchestrator system, updating status files for progress tracking while maintaining focused execution.

**Comprehensive Status Tracking**: All progress information, work summaries, and coordination updates are maintained in dedicated status files that provide visibility across the entire project:

```
project/.claudio/
├── status.md                    # Project-level progress
├── phase1/
│   ├── phase_status.md         # Phase-level progress
│   ├── task1/
│   │   ├── claude.md           # Task context (produces next action)
│   │   └── status.md           # Task progress and updates
│   └── task2/
│       ├── claude.md           # Task context (produces next action)
│       └── status.md           # Task progress and updates
└── shared/status/
    └── global_status.md        # Cross-phase status tracking
```

### Finding Progress Information
- **Current Task Status**: Check `phase*/task*/status.md` for detailed progress
- **Phase Overview**: Review `phase*/phase_status.md` for phase-level progress  
- **Project Status**: View `.claudio/status.md` for overall project tracking
- **Next Actions**: Task contexts suggest the next recommended prompt to execute

## Available Commands

### Core Workflow Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:claudio` | Complete discovery & planning | `/claudio:claudio ../my-app` |
| `/claudio:discovery` | Analyze project structure | `/claudio:discovery ./backend` |
| `/claudio:documentation` | Generate docs | `/claudio:documentation api ./my-api` |
| `/claudio:prd` | Create requirements | `/claudio:prd feature chat-system` |
| `/claudio:plan` | Implementation planning | `/claudio:plan project app "12 weeks"` |
| `/claudio:task` | Break down into tasks* | `/claudio:task plan.md my-project` |
| `/claudio:research` | Topic research | `/claudio:research security oauth2` |
| `/claudio:design` | UX/UI analysis & specs | `/claudio:design audit ./my-app material` |
| `/claudio:security-review` | STRIDE security analysis with Mermaid diagrams | `/claudio:security-review ./my-app` |

### Implementation & Execution
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:implement` | Execute implementation plans** | `/claudio:implement ../my-project` |

### System Management
| Command | Purpose | Example |
|---------|---------|---------|
| `/install` | Install Claudio components | `/install` or `/install user` |
| `/claudio:upgrade` | Upgrade Claudio installation | `/claudio:upgrade` or `/claudio:upgrade /path/to/project` |

### Utilities
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:newprompt` | Create new agent prompts | `/claudio:newprompt security-review "vulnerability analysis" standard` |
| `/claudio:test-review` | Analyze testing patterns and frameworks | `/claudio:test-review` |
| `/claudio:gcms` | Generate conventional git commit messages | `/claudio:gcms` |
| `/claudio:code-quality` | Code quality assessment*** | `/claudio:code-quality full ./my-project` |

*Task command creates contexts that produce next actions and tracks progress in status.md files

**Implementation command is optional and invoked separately when ready to execute plans

***Optional command - see [Optional Commands](#optional-commands) for installation

## Installation and System Management

### Installing Claudio Components

Claudio supports multiple installation modes to fit different workflows:

#### Installation Modes

**Project Mode** (Default - Recommended):
```bash
# Install complete Claudio system in current project
/install

# Install commands only in current project  
/install commands
```
Creates `.claude/` folder in current directory with full Claudio system.

**User Mode** (Global Installation):
```bash
# Install commands globally for user
/install commands user
```
Installs to `~/.claude/` for system-wide access across all projects.

**Custom Path Mode**:
```bash
# Install to specific location
/install /path/to/project
/install commands /path/to/custom/location
```
Installs Claudio system to any specified directory.

#### What Gets Installed
- **Full Installation**: Commands, agents, prompts, and all system components
- **Commands Only**: Just the command files for basic functionality
- **Automatic Detection**: Installation system detects and adapts to existing setups

### Upgrading Claudio

Keep your Claudio installation current with the upgrade system:

#### Check for Updates
```bash
# Preview available upgrades for current directory
/claudio:upgrade --check

# Check specific project installation
/claudio:upgrade /path/to/project --check

# Show current installation status
/claudio:upgrade --status
```

#### Perform Upgrades
```bash
# Upgrade current directory installation
/claudio:upgrade

# Upgrade specific project
/claudio:upgrade /path/to/project

# Upgrade specific components
/claudio:upgrade --commands
/claudio:upgrade /path/to/project --agents

# Force complete refresh
/claudio:upgrade --force
```

#### Safety Features
- **Automatic Backups**: Complete backup created before any changes
- **Changelog Generation**: Detailed record of all modifications
- **Rollback Support**: Easy reversion to previous versions
- **No-Change Detection**: Clear notification when system is current

#### Version Management
```bash
# List upgrade history for current directory
/claudio:upgrade --list-versions

# List versions for specific project
/claudio:upgrade /path/to/project --list-versions

# View specific changelog
/claudio:upgrade --changelog 2025-08-02_14-30-15

# Rollback current directory to previous version
/claudio:upgrade --rollback 2025-08-02_14-30-15

# Rollback specific project
/claudio:upgrade /path/to/project --rollback 2025-08-02_14-30-15
```

### System Maintenance

#### Validation and Health Checks
```bash
# Validate current directory installation
/claudio:upgrade --validate

# Validate specific project installation
/claudio:upgrade /path/to/project --validate

# Show installation information
/claudio:upgrade --status
```

The upgrade system maintains complete version history in `.claude/.upgrades/` with:
- Timestamped backups for safe rollback
- Detailed changelogs for transparency
- Automated rollback scripts for easy recovery
- Git-independent version management

## Implementation Execution

Beyond planning, Claudio can execute your implementation plans through a separate, optional command:

### Three-Phase Workflow
Claudio is designed around **three core phases** for comprehensive project management:

1. **Discovery**: Project analysis, technology assessment, and capability mapping
2. **Planning**: Requirements documentation and implementation roadmap creation  
3. **Implementation**: Optional code execution and task completion

### Combined Default Workflow
The **default workflow combines discovery and planning** into a single command:

- **Combined Phase**: Discovery + Planning with `/claudio:claudio`
- **Optional Phase**: Implementation with `/claudio:implement`

**Benefits of This Approach**:
- **Discovery + Planning Together**: Complete project understanding and roadmap in one step
- **Implementation Separation**: Review plans before execution, share with team, execute when ready
- **Flexible Timing**: Run discovery/planning frequently, implement only when needed
- **Team Collaboration**: Plans can be reviewed and refined before implementation begins

After creating plans with `/claudio:claudio`, optionally execute them:

```bash
# Default workflow: discovery and planning combined
/claudio:claudio ../my-project

# Optional: execute implementation when ready
/claudio:implement ../my-project
```

### Implementation Features
- **Parallel Task Processing**: Execute independent tasks simultaneously
- **Progress Tracking**: Real-time status updates and completion monitoring
- **Error Handling**: Graceful failure handling with rollback capabilities
- **Selective Execution**: Run specific phases or tasks as needed

### Implementation Modes
```bash
# Execute complete implementation plan
/claudio:implement

# Execute specific phase
/claudio:implement --phase phase1

# Execute specific task
/claudio:implement --task phase1.task2

# Resume interrupted execution
/claudio:implement --resume

# Control parallel execution
/claudio:implement --parallel 4

# Preview execution plan (dry run)
/claudio:implement --dry-run

# Check implementation status
/claudio:implement --status
```

Implementation integrates with existing agents:
- **Code Quality**: Automatic quality checks during implementation
- **Documentation**: Live documentation updates as code is implemented
- **Testing**: Coordinated test execution and validation

## Adding New Prompts and Commands

### Quick Method: Use the NewPrompt Command
```bash
# Create a new agent and command automatically
/claudio:newprompt security-review "Comprehensive security analysis with vulnerability assessment" standard
```

The `/claudio:newprompt` command will:
- Create the agent prompt and command files
- Determine workflow integration (standard/optional/conditional)
- Generate integration instructions for existing files
- Update documentation and folder structures

### Manual Method: Step-by-Step
Want to add a security review prompt manually? Here's how:

### 1. Create the Agent Prompt
```bash
mkdir -p .claude/agents/claudio/prompts/security-review
```

Create `.claude/agents/claudio/prompts/security-review/claude.md`:
```markdown
# Security Review Agent

You are a specialized security review agent that analyzes codebases for security vulnerabilities, best practices, and compliance requirements.

## Your Core Responsibilities:
1. **Vulnerability Assessment**: Identify potential security risks
2. **Best Practices Review**: Evaluate security implementations
3. **Compliance Checking**: Verify regulatory compliance
4. **Remediation Planning**: Provide actionable security improvements

## Analysis Areas:
- Authentication and authorization
- Data protection and encryption
- Input validation and sanitization
- API security and rate limiting
- Dependency vulnerabilities
- Infrastructure security

[Include detailed methodology and templates...]
```

### 2. Create the Command
Create `.claude/commands/claudio/security-review.md`:
```markdown
# Security Review Command

## Description
Perform comprehensive security analysis of codebases with vulnerability assessment and remediation recommendations.

## Usage
/claudio:security-review <target_path> [security_standard]

## Parameters
- `target_path`: Path to code/project to review
- `security_standard`: Optional standard (OWASP, SOC2, etc.)

## Context
Use the security review agent prompt from `.claude/agents/claudio/prompts/security-review/claude.md`.

## Instructions
1. Analyze code for security vulnerabilities
2. Review authentication and authorization
3. Check for common security anti-patterns
4. Generate remediation recommendations
5. **Direct Command**: Save to `security-reviews/<project>_security_review.md`
6. **Within Claudio**: Save to `<target>/.claudio/security-review.md`
```

### 3. Integration with Claudio
To integrate with the main Claudio workflow, update `.claude/agents/claudio/prompts/claudio/claude.md` to include security review as an optional phase.

## Simple Usage Examples

### Complete Project Workflow
```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access
claude --add-dir ../my-react-app

# 3. In Claude Code session - complete workflow:
/claudio:claudio ../my-react-app
/claudio:implement ../my-react-app  # When ready to execute

# 4. Keep system updated
/claudio:upgrade --check
```

### Team Installation Workflow
```bash
# 1. Install to team project
/install /path/to/team/project

# 2. Team members navigate and use
cd /path/to/team/project
claude
/claudio:claudio
/claudio:implement  # When ready

# 3. Keep installation current
/claudio:upgrade
```

### Specific Analysis Tasks
```bash
# Individual command usage
/claudio:discovery /path/to/my-api    # Analyze project structure
/claudio:security-review /path/to/my-api  # Security analysis with STRIDE
/claudio:documentation readme ./frontend  # Generate README  
/claudio:prd feature real-time-chat   # Create requirements doc
/claudio:test-review                  # Analyze testing setup
/claudio:gcms                        # Generate commit messages
```

### System Management
```bash
# Installation management
/install                    # Install to current project
/install user              # Install globally
/install /custom/path      # Install to specific location

# Upgrade management  
/claudio:upgrade --check   # Preview available updates
/claudio:upgrade           # Apply upgrades to current directory
/claudio:upgrade /path/to/project  # Upgrade specific project
/claudio:upgrade --rollback 2025-08-02_14-30-15  # Rollback if needed
```

### Following Up and Progress Tracking
```bash
# Check progress via status files
"Show me the current status from /my-project/.claudio/status.md"
"What's the progress on phase 1 tasks?"

# Implementation execution and monitoring
/claudio:implement --status           # Check implementation progress
/claudio:implement --phase phase1     # Execute specific phase
/claudio:implement --dry-run          # Preview execution plan

# Execute next recommended actions
"What does the task context suggest as the next step?"
"Update the implementation plan to include the new requirements"
"Generate additional research on GraphQL best practices"
```

## Optional Commands

Some commands are available as optional installations that users can add to their own projects:

### Code Quality Assessment

The `/code-quality` command provides comprehensive code quality assessment including linting, formatting, testing, coverage analysis, and cyclomatic complexity evaluation.

**Installation Options:**
1. **Copy to Project**: Copy the command files to your project's `.claude/commands/claudio/` directory
2. **Symlink**: Create symlinks to stay updated with Claudio improvements
3. **Git Submodule**: Automatic availability when using Claudio as a submodule

**Usage Examples:**
```bash
# Full quality assessment
/claudio:code-quality full ./my-project

# Quick CI/CD check  
/claudio:code-quality quick . json

# Focus on test coverage
/claudio:code-quality coverage ./project detailed
```

**Supported Languages:** JavaScript/TypeScript, Python, Rust, Go, Elixir, Java, C#, PHP, Ruby

For detailed installation instructions and tool requirements, see the [code-quality documentation](./.claude/agents/claudio/prompts/code-quality/README.md).

## Project Structure

```
claudio/
├── README.md              # This file  
├── CLAUDE.md             # Detailed system documentation
├── .claude/              # Claudio system implementation
│   ├── commands/claudio/ # All executable commands with namespace
│   │   ├── claudio.md    # Master project analysis
│   │   ├── discovery.md  # Project structure analysis  
│   │   ├── prd.md        # Requirements documentation
│   │   ├── plan.md       # Implementation planning
│   │   ├── task.md       # Task breakdown
│   │   ├── implement.md  # Implementation execution
│   │   ├── research.md   # Topic research
│   │   ├── documentation.md # Documentation generation
│   │   ├── design.md     # UX/UI analysis
│   │   ├── newprompt.md  # Agent creation system
│   │   ├── install.md    # Installation management
│   │   ├── upgrade.md    # Upgrade management
│   │   ├── test-review.md # Testing analysis
│   │   ├── gcms.md       # Git commit messages
│   │   ├── security-review.md # Security analysis with STRIDE
│   │   └── code-quality.md # Code quality assessment
│   └── agents/claudio/   # Agent implementations
│       ├── claudio-coordinator.md # Master orchestration
│       ├── claudio-discovery-orchestrator.md # Discovery coordination
│       ├── claudio-prd-orchestrator.md # PRD creation
│       ├── claudio-plan-orchestrator.md # Planning coordination
│       ├── claudio-task-orchestrator.md # Task breakdown
│       ├── implement-orchestrator.md # Implementation execution
│       ├── install-coordinator.md # Installation management
│       ├── upgrade-orchestrator.md # Upgrade coordination
│       ├── documentation-coordinator.md # Documentation coordination
│       ├── newprompt-coordinator.md # Agent creation
│       ├── code-quality-analyzer.md # Quality assessment
│       ├── design-analyzer.md # UX/UI analysis
│       ├── research-specialist.md # Research coordination
│       ├── git-commit-message.md # Commit message generation
│       ├── test-review.md # Testing analysis
│       ├── security-review-coordinator.md # Security analysis coordination
│       ├── security-threat-modeler.md # STRIDE threat modeling
│       ├── security-diagram-generator.md # Security Mermaid diagrams
│       ├── vulnerability-assessment-specialist.md # Vulnerability analysis
│       ├── security-architecture-analyst.md # Security architecture review
│       └── prompts/      # Extended agent contexts
│           ├── claudio/  # Master orchestration context
│           ├── discovery/ # Project analysis context
│           ├── prd/      # Requirements context
│           ├── plan/     # Planning context
│           ├── task/     # Task breakdown context
│           ├── implement/ # Implementation context
│           ├── research/ # Research context
│           ├── documentation/ # Documentation context
│           ├── design/   # Design analysis context
│           ├── newprompt/ # Agent creation context
│           ├── install/  # Installation context
│           ├── upgrade/  # Upgrade context
│           └── security-review/ # Security analysis context
├── examples/            # Sample projects for testing
│   ├── web-app/        # Deno.js task manager SPA with full Claudio analysis
│   └── rust-game/      # Bevy chess game
└── [generated folders]  # Created when using standalone commands
```

### Generated Project Structure
When Claudio analyzes a project, it creates:

```
your-project/
└── .claudio/
    ├── summary.md          # Executive overview
    ├── discovery.md        # Technology analysis  
    ├── prd.md             # Requirements
    ├── plan.md            # Implementation roadmap
    ├── status.md          # Progress tracking
    ├── .upgrades/         # Upgrade management (when using installed Claudio)
    │   ├── backups/       # Version backups
    │   ├── changelogs/    # Upgrade changelogs
    │   └── version_history.json # Version tracking
    ├── research/          # Topic-specific research
    ├── docs/              # Generated documentation
    │   ├── readme.md      # Project documentation
    │   ├── api.md         # API documentation
    │   ├── user_guide.md  # User guide
    │   └── security/      # Security analysis
    │       ├── stride_analysis.md
    │       ├── threat_model.md
    │       ├── vulnerability_report.md
    │       ├── remediation_plan.md
    │       └── diagrams/
    │           ├── data_flow.mermaid
    │           ├── attack_trees.mermaid
    │           ├── threat_model.mermaid
    │           └── security_architecture.mermaid
    ├── design/            # Design specifications
    └── phase1/, phase2/   # Task breakdown with contexts
```

## Benefits

- **Instant Project Understanding**: Get comprehensive discovery and analysis of any codebase
- **Clear Implementation Path**: Receive actionable plans with time estimates
- **Organized Development**: Transform ad-hoc coding into systematic progress
- **Flexible Implementation**: Choose when to execute plans - implementation is optional
- **Progress Visibility**: Track work at project, phase, and task levels
- **Team Collaboration**: Shared contexts enable consistent development approach
- **Security Analysis**: Comprehensive STRIDE-based security review with visual threat modeling
- **Quality Assurance**: Built-in review and testing requirements

## Getting Help

- **System Documentation**: Read `CLAUDE.md` for detailed system documentation
- **Sample Projects**: Explore `examples/` for sample projects to analyze
- **Agent Contexts**: Check `.claude/agents/claudio/prompts/` to understand how agents work
- **Available Commands**: Review `.claude/commands/claudio/` to see all available commands
- **Installation Help**: Use `/install --help` or `/claudio:upgrade --help` for system management
- **Status Checking**: Use `/claudio:upgrade --status` to verify your installation

### Quick Start Commands
```bash
# Discovery and planning (default)
/claudio:claudio /path/to/my/project

# With optional implementation
/claudio:claudio /path/to/my/project
/claudio:implement /path/to/my/project

# System management
/install                    # Install to current project
/claudio:upgrade --check    # Check for updates
/claudio:upgrade /path/to/project  # Upgrade specific project
```

Start by simply telling Claude: **"Please use claudio:claudio on /path/to/my/project"** and see what happens!
