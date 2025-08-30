# Claudio

A comprehensive project analysis, planning, and implementation system for Claude Code that transforms any codebase into an organized, trackable development process through intelligent project localization and discovery-based workflows.

## What is Claudio?

<img src="docs/images/claudio.png" alt="Claudio System" width="600" height="auto">

Claudio is a comprehensive project analysis system built on specialized AI agents that work together to **discover, plan, and implement** project solutions through intelligent localization and enhanced workflow execution. The system uses an **agent-based architecture** where specialized agents are **automatically customized for each project** based on comprehensive discovery analysis of technology stack, architecture patterns, and project requirements.

The default workflow combines **discovery and planning** into a unified process with optional **implementation execution**.

## Requirements

- **Claude Code CLI**: This system is designed for use with [Claude Code](https://claude.ai/code)
- The Claude Code CLI provides the runtime environment and tools that Claudio agents use
- No additional installations required - Claudio works within your existing Claude Code setup

**Table of Contents:** [What is Claudio?](#what-is-claudio) | [Requirements](#requirements) | [Quick Start](#quick-start) | [Key Features](#key-features) | [Commands](#commands) | [Installation](#installation) | [Project Structure](#project-structure) | [Advanced Features](#advanced-features) | [Development](#development) | [Troubleshooting](#troubleshooting)

## Quick Start

*Note: Where you start your Claude session determines automatic project memory loading from CLAUDE.md files. We take advantage of this behavior until Claude supports alternative methods for project context loading.*

### Setup Phase
```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access to your project  
claude --add-dir /path/to/my-code

# 3. Run Claudio system command
/claudio:claudio /path/to/my-code
# Optional: Use install-only command instead
/claudio:install /path/to/my-code

# 4. Exit Claude session
exit
```

### Usage Phase
```bash
# 1. Navigate to your project
cd /path/to/my-code

# 2. Start Claude session (loads project CLAUDE.md automatically)
claude

# 3. Use project commands
# Optional: Create additional plans
/claudio:plan feature "my new feature, add to project phases"
/claudio:implement  # Follows plans created by claudio workflow or install
/claudio:test
# Natural language: "use the claudio workflow to add my new feature to the phased planning documents"
```

## Key Features

### Enhanced Discovery System
- **Parallel Specialist Agents**: Enhanced performance through simultaneous analysis (structure, technology, architecture, integration, consolidation)
- **Technology Stack Detection**: Automatic framework identification and dependency analysis
- **Architecture Analysis**: Design patterns, structural relationships, and architectural style evaluation
- **Integration Assessment**: Tool compatibility, API analysis, and workflow recommendations

### Intelligent Localization
- **Project-Specific Customization**: Components automatically adapt to specific project context through discovery analysis
- **Technology Stack-Aware Workflows**: Framework-specific commands and procedures tailored to your stack
- **Auto-Generated Test Commands**: Project-specific test execution based on detected testing frameworks
- **System Component Classification**: Automatic filtering between system and user components for optimized installations

### Documentation System
- **Project-Specific README Generation**: Automated documentation with technology stack-aware content
- **CLAUDE.md Integration Guidance**: Technology stack-aware Claudio workflow integration
- **Parallel Documentation Updates**: Coordinated maintenance for README, CLAUDE.md, and changelogs
- **Research System**: Complexity-aware topic research with adaptive thinking modes

### Quality Assurance
- **Validation System**: Comprehensive quality assurance framework with specialized validators
- **Security Analysis**: STRIDE-based security review with technology-specific threat modeling
- **Code Quality Assessment**: Language and framework-specific quality analysis
- **Testing Integration**: Intelligent test execution with auto-remediation capabilities

### Development Tools
- **Custom Command Generation**: Research-driven command creation from documentation sources
- **Claude SDK Development**: Analysis and improvement of Claude Code implementations
- **Git Integration**: Intelligent commit message generation following project conventions
- **System Management**: Parallel upgrade system with backup management and version tracking

## Commands

### Core Workflow Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:claudio` | Complete discovery & planning | `/claudio:claudio ../my-app` |
| `/claudio:discovery` | Enhanced project analysis | `/claudio:discovery ./backend` |
| `/claudio:documentation` | Generate docs | `/claudio:documentation api ./my-api` |
| `/claudio:prd` | Create requirements | `/claudio:prd feature chat-system` |
| `/claudio:plan` | Implementation planning | `/claudio:plan project app "12 weeks"` |
| `/claudio:task` | Break down into tasks | `/claudio:task plan.md my-project` |
| `/claudio:research` | Topic research with complexity assessment | `/claudio:research security oauth2` |
| `/claudio:update-docs` | Update project documentation | `/claudio:update-docs "enhanced features"` |
| `/claudio:design` | UX/UI analysis & specs | `/claudio:design audit ./my-app material` |
| `/claudio:security-review` | STRIDE security analysis | `/claudio:security-review ./my-app` |

### Implementation & Execution
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:implement` | Execute implementation plans | `/claudio:implement ../my-project` |
| `/claudio:test` | Run project tests with analysis | `/claudio:test` or `/claudio:test --fix` |
| `/claudio:test-g` | Gemini-integrated testing | `/claudio:test-g` |

### System Management
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:install` | Install Claudio components | `/claudio:install` or `/claudio:install commands user` |
| `/claudio:upgrade` | Parallel upgrade system | `/claudio:upgrade` or `/claudio:upgrade /path/to/project` |

### Utilities
| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio:new-command` | Generate custom commands | `/claudio:new-command my-tool "analyzes dependencies" https://docs.npmjs.com` |
| `/claudio:newprompt` | Create new agent prompts | `/claudio:newprompt security-review "vulnerability analysis" standard` |
| `/claudio:test-review` | Analyze testing patterns | `/claudio:test-review` |
| `/claudio:gcms` | Generate git commit messages | `/claudio:gcms` |
| `/claudio:code-quality` | Code quality assessment | `/claudio:code-quality full ./my-project` |
| `/claudio:claude-sdk` | Claude Code implementation analysis | `/claudio:claude-sdk command_name` |

## Installation

### Installing Claudio Components

Claudio supports multiple installation modes to fit different workflows:

#### Installation Modes

**Project Mode** (Default - Recommended):
```bash
# Install complete localized Claudio system in current project
/claudio:install

# Install localized commands only in current project  
/claudio:install commands
```
Creates `.claude/` folder in current directory with project-localized Claudio system based on discovery analysis.

**User Mode** (Global Installation):
```bash
# Install generic commands globally for user
/claudio:install commands user
```
Installs generic Claudio templates to `~/.claude/` for system-wide access.

**Custom Path Mode**:
```bash
# Install localized system to specific location
/claudio:install /path/to/project
/claudio:install commands /path/to/custom/location
```
Installs project-localized Claudio system to any specified directory after discovery analysis.

### Upgrading Claudio

Keep your Claudio installation current with the upgrade system:

#### Check for Updates
```bash
# Preview available upgrades for current directory
/claudio:upgrade --check

# Check specific project installation
/claudio:upgrade /path/to/project --check
```

#### Perform Upgrades
```bash
# Upgrade current directory with re-localization
/claudio:upgrade

# Upgrade specific project with localization refresh
/claudio:upgrade /path/to/project

# Force complete re-discovery and re-localization
/claudio:upgrade --force
```

#### Safety Features
- **Automatic Backups**: Complete backup created before any changes
- **Changelog Generation**: Detailed record of all modifications
- **Rollback Support**: Easy reversion to previous versions
- **Context Preservation**: Existing project contexts maintained during upgrades

## Project Structure

```
claudio/
├── .claude/
│   ├── commands/claudio/     # All executable commands
│   └── agents/claudio/       # Agent implementations  
│       └── extended_context/ # Knowledge contexts by category
└── .claudio/                 # Generated project analysis
    ├── discovery.md          # Project analysis
    ├── prd.md               # Requirements  
    ├── plan.md              # Implementation roadmap
    └── phase*/              # Task breakdown
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
    ├── research/          # Topic-specific research
    ├── docs/              # Generated documentation
    │   └── security/      # Security analysis
    └── phase1/, phase2/   # Task breakdown with contexts
```

## Advanced Features

### Custom Command Generation

Generate complete command systems (command + sub-agent + context) from research sources:

```bash
# Create from URL research
/claudio:new-command dependency-analyzer "analyzes project dependencies" https://docs.npmjs.com/cli/v8/commands/npm-audit

# Create from local documentation
/claudio:new-command api-validator "validates API endpoints" ./api-spec.md

# Integrate with Claudio workflow
/claudio:new-command security-scan "performs security analysis" https://owasp.org/www-project-top-ten/ --claudio "after discovery workflow"
```

### Project-Specific Testing

Claudio automatically generates customized test commands for each project:

- **Framework Detection**: Automatic detection of testing frameworks (Jest, pytest, ExUnit, Go test, etc.)
- **Intelligent Reporting**: Comprehensive test result analysis and failure diagnosis
- **Fix Capabilities**: Automatic failure analysis and repair suggestions with `--fix` flag
- **Project-Specific Commands**: Generated test commands during installation based on discovery analysis

### Research System

Create structured documentation with complexity-aware analysis:

```bash
/claudio:research development react-testing  # Create research documentation
```

**Features**:
- **Complexity Assessment**: Automatic evaluation with Think/Ultrathink modes for advanced topics
- **Quality Standards**: Includes authoritative sources, practical examples, and appropriate analysis depth
- **Context Detection**: Automatically determines proper file placement for direct vs subagent usage

### Implementation Execution

Beyond planning, Claudio can execute your implementation plans:

```bash
# Default workflow: discovery and planning combined
/claudio:claudio ../my-project

# Optional: execute implementation when ready
/claudio:implement ../my-project
```

**Implementation Modes**:
- Execute complete implementation plan
- Execute specific phases or tasks
- Resume interrupted execution
- Preview execution plan (dry run)
- Control parallel execution

## Development

### Agent-Based Architecture

Claudio employs specialized AI agents that orchestrate different aspects of project analysis:

#### Enhanced Discovery System (Parallel Architecture)
- **discovery-agent**: Orchestrates parallel project analysis with specialized analyzers
- **discovery-structure-analyzer**: Project organization, file patterns, hierarchy mapping
- **discovery-tech-analyzer**: Technology stack detection, framework identification
- **discovery-architecture-analyzer**: Design patterns, architectural style, component relationships
- **discovery-integration-analyzer**: Tool integration opportunities, API analysis
- **discovery-consolidator**: Analysis integration, comprehensive report generation

#### Quality Assurance & Security
- **security-review-coordinator**: STRIDE-based security analysis with visual threat modeling
- **code-quality-analyzer**: Comprehensive code quality assessment with reporting
- **discovery-validator**: Ensures discovery document quality and analysis depth
- **workflow-validator**: Validates complete workflow output and document completeness

#### Documentation & Research
- **documentation-coordinator**: Generates comprehensive documentation (README, API docs, user guides)
- **user-readme-generator-agent**: Creates project-specific README documentation with technology stack-aware content
- **claude-md-generator-agent**: Generates technology stack-aware project-specific CLAUDE.md
- **research-specialist**: Conducts complexity-aware topic research with adaptive thinking modes

#### System Management
- **install-full-workflow-agent**: Manages complete Claudio installation with project-specific customization
- **Parallel Upgrade System**: Specialized subagents for discovery analysis, legacy cleanup, template analysis, backup management, localization, and validation

### Validation System

Claudio includes a comprehensive quality assurance framework:

- **Discovery Validator**: Validates discovery document quality and analysis depth
- **Workflow Validator**: Validates complete Claudio workflow output quality
- **Install Validator**: Validates installation completeness and functionality
- **New Command Validator**: Validates custom command generation quality

Each validator generates detailed reports with pass/fail status, detailed findings, recommendations, and quality metrics.

## Troubleshooting

### Common Issues

#### Node.js Memory Issues
If Claude Code crashes with "JavaScript heap out of memory" errors:

```bash
# Quick fix
export NODE_OPTIONS="--max-old-space-size=8192" && claude-code

# Permanent solution (add to ~/.zshrc or ~/.bashrc)
export NODE_OPTIONS="--max-old-space-size=8192"
```

### Getting Help

- **System Documentation**: Read `CLAUDE.md` for detailed system documentation
- **Sample Projects**: Explore `examples/` for sample projects to analyze
- **Installation Help**: Use `/claudio:install --help` or `/claudio:upgrade --help`
- **Status Checking**: Use `/claudio:upgrade --status` to verify your installation

Start by simply telling Claude: **"Please use claudio:claudio on /path/to/my/project"** and experience the enhanced parallel specialist agent discovery system with comprehensive project understanding!
