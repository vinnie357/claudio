# Claudio System Commands Index

**Total Commands**: 23 (18 User + 5 System)  
**Last Updated**: 2025-08-24  
**Component Classification**: System commands marked with `system: claudio-system`  

## Command Categories

### Core Workflow Commands (5)
**Purpose**: Complete project analysis and planning workflows

| Command | Description | Arguments | Agent |
|---------|-------------|-----------|-------|
| `claudio` | Comprehensive project analysis and planning system with direct agent coordination | `<target_project_path> [--implement]` | Direct coordination (no coordinator agent) |
| `discovery` | Analyze project structure and capabilities | `<target_project_path>` | discovery-agent |
| `prd` | Generate Product Requirements Documents | `<project_context> [requirements]` | prd-agent |
| `plan` | Create implementation plans | `<requirements_context> [timeline]` | plan-agent |
| `task` | Break down plans into executable tasks | `<plan_context> [phase]` | task-agent |

### System Commands (5)
**Purpose**: Internal system operations (excluded from user installations)
**System Marker**: `system: claudio-system`

| Command | Description | Arguments | Agent |
|---------|-------------|-----------|-------|
| `install` | Install Claudio system with project integration | `[target_path] [mode]` | Direct coordination (14 agents) |
| `install-commands` | Install commands-only version | `[target_path]` | install-commands-coordinator-agent |
| `upgrade` | Parallel upgrade system using 7 specialized subagents | `[target_path] [--check\|--force]` | Direct coordination (7 agents) |
| `test` | Execute system test suites with validation | `[test_type]` | project-test-runner |
| `generate-test-commands` | Generate project-specific test commands | `[target_path]` | test-command-generator |

### Analysis & Quality (3)
**Purpose**: Code quality, security, and design analysis

| Command | Description | Arguments | Agent |
|---------|-------------|-----------|-------|
| `code-quality` | Analyze code quality and generate improvement recommendations | `[target_path] [--fix]` | code-quality-analyzer |
| `security-review` | Comprehensive security analysis using STRIDE methodology with Mermaid visualization | `<target_path_or_instruction> [security_framework]` | Direct coordination (1 agent) |
| `design` | Analyze UX/UI design systems and accessibility compliance | `[target_path] [--components]` | design-analyzer |

### Development Tools (5)
**Purpose**: Documentation, testing, and development assistance

| Command | Description | Arguments | Agent |
|---------|-------------|-----------|-------|
| `documentation` | Create comprehensive project documentation | `[target_path] [--type=all\|api\|user]` | documentation-coordinator |
| `test-review` | Review testing suite tools and provide recommendations | `[target_path]` | test-review |
| `update-docs` | Updates project documentation including README, CLAUDE.md, and changelogs | `[changes-description]` | Direct coordination (3 agents) |
| `research` | Create research documentation with overview and troubleshooting guides | `<category> <topic> [--complexity=level]` | research-specialist |
| `phoenix-dev` | Analyze and optimize Elixir Phoenix development workflows | `[target_path]` | phoenix-dev-executor |

### System & SDK (5)  
**Purpose**: Claude Code integration, command generation, and system tools

| Command | Description | Arguments | Agent |
|---------|-------------|-----------|-------|
| `claude-sdk` | Analyze and improve Claude Code implementations | `[command_name] [--cross-system]` | claudio-claude-sdk-architect |
| `new-command` | Generate custom commands with sub-agents and extended context | `<command_name> [description]` | Direct coordination (3 agents) |
| `newprompt` | Create comprehensive agent prompts following Claudio conventions | `<agent_name> [purpose]` | Direct coordination (3 agents) |
| `implement` | Execute implementation plans with systematic task coordination | `[target_path] [--phase=N]` | Direct coordination (1 agent) |
| `gcms` | Generate conventional commit messages from git status and changes | `[--scope] [--type]` | git-commit-message |

## System Metadata

### Component Classification
- **System Commands (5)**: Marked with `system: claudio-system`, excluded from user installations
- **User Commands (18)**: Installed in user projects for workflow execution
- **System Agents (45+)**: Installation, validation, and testing agents (excluded from user installations)  
- **User Agents (33+)**: Workflow execution agents (included in user installations)

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
- claude-sdk, new-command, newprompt

### Commands Requiring `phoenix-dev/`
- phoenix-dev

## Maintenance Notes

- **Index Updates**: Use `/claudio:update-docs` to update this index when commands change
- **Version Compatibility**: All commands compatible with current Claudio system version
- **Command Count**: Update total when adding/removing commands
- **Pattern Migration**: Gradually migrate coordinator-pattern commands to direct coordination