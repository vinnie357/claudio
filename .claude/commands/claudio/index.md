# Claudio System Commands Index

**Total Commands**: 23 (16 User + 7 System)  
**Last Updated**: 2025-09-06  
**Component Classification**: System commands marked with `system: claudio-system`  

## Command Categories

### Core Workflow Commands (5)
**Purpose**: Complete project analysis and planning workflows

| Command | Type | Description | Arguments | Agent |
|---------|------|-------------|-----------|-------|
| `claudio` | User | Comprehensive project analysis and planning system with direct agent coordination | `<target_project_path> [--implement]` | Direct coordination (no coordinator agent) |
| `discovery` | User | Analyze project structure and capabilities | `<target_project_path>` | discovery-agent |
| `prd` | User | Generate Product Requirements Documents | `<project_context> [requirements]` | prd-agent |
| `plan` | User | Create implementation plans | `<requirements_context> [timeline]` | plan-agent |
| `task` | User | Break down plans into executable tasks | `<plan_context> [phase]` | task-agent |

### System Commands (7)
**Purpose**: Internal system operations (excluded from user installations)
**System Marker**: `system: claudio-system`

| Command | Type | Description | Arguments | Agent |
|---------|------|-------------|-----------|-------|
| `install` | System | Install Claudio system with project integration | `[target_path] [mode]` | install-path-validator-agent, install-directory-creator-agent, discovery analyzers (4), install-commands-localizer-agent, install-agents-localizer-agent, install-extended-context-generator-agent, claude-md-generator-agent, install-validator |
| `install-commands` | System | Install commands-only version | `[target_path]` | install-commands-coordinator-agent |
| `upgrade` | System | Parallel upgrade system using 7 specialized subagents | `[target_path] [--check\|--force]` | upgrade-discovery-analyzer, upgrade-legacy-cleaner, upgrade-template-analyzer, upgrade-backup-manager, security-review-coordinator, generation-tracking-validator, upgrade-installation-validator |
| `test` | System | Execute project test suite with intelligent analysis and optional fixes | `[test_pattern] [--fix]` | project-test-runner |
| `generate-test-commands` | System | Generate project-specific test commands | `[target_path]` | test-command-generator |
| `new-command` | System | Generate custom commands with sub-agents and extended context | `<command_name> [description]` | research-specialist, new-command-generator, new-command-validator |
| `newprompt` | System | Create comprehensive agent prompts following Claudio conventions | `<agent_name> [purpose]` | newprompt-agent-creator, newprompt-command-creator, newprompt-integration-planner |

### Analysis & Quality (3)
**Purpose**: Code quality, security, and design analysis

| Command | Type | Description | Arguments | Agent |
|---------|------|-------------|-----------|-------|
| `code-quality` | User | Analyze code quality and generate improvement recommendations | `[target_path] [--fix]` | code-quality-analyzer |
| `security-review` | User | Comprehensive security analysis using STRIDE methodology with Mermaid visualization | `<target_path_or_instruction> [security_framework]` | security-review-coordinator |
| `design` | User | Analyze UX/UI design systems and accessibility compliance | `[target_path] [--components]` | design-analyzer |

### Development Tools (5)
**Purpose**: Documentation, testing, and development assistance

| Command | Type | Description | Arguments | Agent |
|---------|------|-------------|-----------|-------|
| `documentation` | User | Create comprehensive project documentation | `[target_path] [--type=all\|api\|user]` | documentation-coordinator |
| `test-review` | User | Review testing suite tools and provide recommendations | `[target_path]` | test-review |
| `update-docs` | User | Updates project documentation including README, CLAUDE.md, and changelogs | `[changes-description]` | readme-updater-agent, claude-md-updater-agent, changelog-updater-agent |
| `research` | User | Create research documentation with overview and troubleshooting guides | `<category> <topic> [--complexity=level]` | research-specialist |
| `phoenix-dev` | User | Analyze and optimize Elixir Phoenix development workflows | `[target_path]` | phoenix-dev-executor |

### System & SDK (3)  
**Purpose**: Claude Code integration, command generation, and system tools

| Command | Type | Description | Arguments | Agent |
|---------|------|-------------|-----------|-------|
| `claude-sdk` | User | Comprehensive Claude Code SDK architect for command creation, agent setup, and cross-system analysis | `[--analyze-commands] [--analyze-agents] [--cross-system] [--create-command <name>] [--setup-agent <name>]` | claudio-claude-sdk-architect |
| `implement` | User | Execute implementation plans with systematic task coordination | `[target_path] [--phase=N]` | implement-agent |
| `gcms` | User | Generate brief conventional commit message suggestions | `` | git-commit-message |

## System Metadata

### Component Classification

#### Type Definitions
- **System**: Internal operations, marked with `system: claudio-system`, excluded from user installations
- **User**: Workflow execution, installed in user projects for development workflows

#### Component Counts
- **System Commands (7)**: Installation, upgrade, testing, command generation, and system management operations
- **User Commands (16)**: Project analysis, development tools, documentation, and workflow execution
- **System Agents (43)**: Installation, validation, upgrade, and testing agents (excluded from user installations)  
- **User Agents (36)**: Workflow execution agents (included in user installations)

### For Upgrade Agents
- **System Components**: Commands and agents marked with `system: claudio-system`
- **User Components**: Commands and agents without system marker
- **Preserve**: User-created commands (marked as `user: custom`)
- **Update Strategy**: Replace system components, preserve user components

### For Install Agents  
- **Filtering**: Automatically skip components marked with `system: claudio-system`
- **Commands-Only Mode**: Install user commands + required user agents only
- **Full Workflow Mode**: User commands + agents + workflow document generation
- **User Mode**: Install to `~/.claude/` with generic templates

### Direct Coordination Pattern Commands
**Proven pattern for performance and reliability** (no coordinator agents):
- `claudio` - 20+ conditional agents with smart workflow
- `install` - 14 agents with mixed parallel/sequential execution
- `upgrade` - 7 agents in parallel batches
- `update-docs` - 3 parallel agents (system)
- `security-review` - 1 agent with internal coordination
- `newprompt` - 3 parallel agents
- `new-command` - 3 parallel agents
- `implement` - 1 agent

### Remaining Coordinator Pattern Commands  
**Specialized requirements** (maintain coordinator pattern):
- `documentation` → documentation-coordinator (4 parallel sub-agents)
- `claude-sdk` → claudio-claude-sdk-architect (sequential analysis)
- `install-commands` → install-commands-coordinator-agent (streamlined)

## Usage Examples

### Common Workflows
```bash
# Complete project analysis
/claudio:claudio ./my-project

# Update documentation after changes  
/claudio:update-docs "added authentication feature"

# Generate test commands for project
/claudio:generate-test-commands ./my-project

# Security review before deployment
/claudio:security-review ./my-project --depth=comprehensive
```

### Installation Examples
```bash
# Full system with project integration
/claudio:install ./my-project

# Commands-only installation
/claudio:install commands

# System upgrade with backup
/claudio:upgrade ./my-project
```

## Extended Context Requirements

### Commands Requiring `workflow/`
- claudio, discovery, prd, plan, task

### Commands Requiring `development/`  
- code-quality, design, test-review, generate-test-commands

### Commands Requiring `documentation/`
- documentation, update-docs, research

### Commands Requiring `infrastructure/`
- install, install-commands, upgrade

### Commands Requiring `command-analysis/` & `agent-analysis/`
- claude-sdk (User), new-command (System), newprompt (System)

### Commands Requiring `phoenix-dev/`
- phoenix-dev

## Maintenance Notes

- **Index Updates**: Use `/claudio:update-docs` to update this index when commands change
- **Version Compatibility**: All commands compatible with current Claudio system version
- **Command Count**: Update total when adding/removing commands
- **Pattern Migration**: Gradually migrate coordinator-pattern commands to direct coordination