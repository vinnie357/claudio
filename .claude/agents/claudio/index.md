# Claudio System Agents Index

**Total Agents**: 84 (37 Claudio User + 43 Claudio System + 3 Built-in Claude + 1 External User)  
**Last Updated**: 2025-09-06  
**Component Classification**: System agents marked with `system: claudio-system`  

## Agent Categories

### Core Workflow Agents (6)
**Purpose**: Essential project analysis and planning workflows

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `claudio-coordinator-agent` | User | *(Deprecated)* Orchestrates complete Claudio workflow | Task, TodoWrite | opus | workflow/discovery, workflow/prd, workflow/planning, workflow/task |
| `claudio-structure-creator-agent` | User | Finalizes .claudio directory structure and creates summary docs | Write, Read, LS, Bash, TodoWrite | sonnet | templates/workflows, infrastructure/installation |
| `discovery-agent` | User | **CORE** Project analysis and technology discovery specialist | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | workflow/discovery, templates/workflows |
| `plan-agent` | User | **CORE** Creates detailed implementation plans with phases and time estimates | Read, Write, TodoWrite | sonnet | workflow/planning, templates/workflows |
| `prd-agent` | User | **CORE** Creates comprehensive Product Requirements Documents | Read, Write, TodoWrite | sonnet | workflow/prd, templates/workflows |
| `task-agent` | User | **CORE** Breaks down implementation plans into specific executable tasks | Read, Write, LS, Bash, TodoWrite | sonnet | workflow/task, templates/workflows |

### Analysis & Security Agents (7)
**Purpose**: Code quality, security analysis, and design evaluation

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `code-quality-analyzer` | User | Analyzes code quality by running linters, formatters, static analysis | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | development/code_quality, templates/agents |
| `design-analyzer` | User | Analyzes UX/UI design systems, evaluates design patterns | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | development/design, templates/agents |
| `security-architecture-analyst` | User | System-level security design and architecture evaluation | Read, Glob, Grep, Bash, LS, TodoWrite | sonnet | agent-analysis/architecture-patterns, templates/agents |
| `security-diagram-generator` | User | Mermaid diagram creation specialist for security visualization | Read, Write, TodoWrite | haiku | templates/agents |
| `security-review-coordinator` | User | Coordinates comprehensive security review using STRIDE methodology | Task, Write, TodoWrite | opus | agent-analysis/architecture-patterns, templates/agents |
| `security-threat-modeler` | User | STRIDE-based threat identification and analysis specialist | Read, Glob, Grep, Bash, LS, TodoWrite | sonnet | agent-analysis/architecture-patterns, templates/agents |
| `vulnerability-assessment-specialist` | User | Code and configuration security analysis specialist | Read, Glob, Grep, LS, TodoWrite | sonnet | templates/agents |

### Documentation Agents (8)
**Purpose**: Comprehensive documentation creation and maintenance

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `changelog-updater-agent` | User | Creates and maintains changelog files with version tracking | Read, Write, Edit, Glob, LS, Bash, TodoWrite | sonnet | documentation/overview, templates/agents |
| `claude-md-updater-agent` | User | Maintains and updates CLAUDE.md project integration files | Read, Write, Edit, Glob, LS, TodoWrite | sonnet | meta/claude/commands/templates, templates/agents |
| `documentation-api-creator` | User | Creates comprehensive API reference documentation | Read, Glob, Grep, Bash, TodoWrite | sonnet | documentation/overview, templates/agents |
| `documentation-coordinator` | User | Coordinates parallel documentation creation by specialized sub-agents | Task, TodoWrite | opus | documentation/overview, agent-analysis/architecture-patterns |
| `documentation-developer-guide-creator` | User | Creates comprehensive developer documentation | Read, Glob, Grep, Bash, LS, TodoWrite | sonnet | documentation/overview, templates/agents |
| `documentation-readme-creator` | User | Creates comprehensive project README documentation | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | documentation/overview, templates/agents |
| `documentation-user-guide-creator` | User | Creates comprehensive user guides with tutorials | Read, Glob, Grep, LS, TodoWrite | sonnet | documentation/overview, templates/agents |
| `readme-updater-agent` | User | Updates and maintains project README files with current features | Read, Write, Edit, Glob, LS, TodoWrite | sonnet | documentation/overview, templates/agents |

### Development & Integration Agents (9)
**Purpose**: Development tools, command generation, and specialized workflows

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `claude-sdk-architect` | User | Creates new Claude Code slash commands and sub-agents | Task, Read, Write, LS, TodoWrite | opus | command-analysis/integration-patterns, agent-analysis/architecture-patterns |
| `git-commit-message` | User | **LEAF** Generate conventional commit messages from git status | Bash, Grep, Read, TodoWrite | sonnet | templates/agents |
| `implement-agent` | User | Executes implementation plans by coordinating task execution | Task, Read, Write, LS, Bash, TodoWrite | sonnet | workflow/task, development/code_quality, templates/workflows |
| `new-command-generator` | User | Generate custom commands with sub-agents and extended context | Read, Write, Bash, Grep, Task, TodoWrite | sonnet | command-analysis/integration-patterns, templates/commands, meta/claude/commands/templates |
| `phoenix-dev-executor` | User | **LEAF** Analyze and optimize Elixir Phoenix development workflows | Read, Write, Bash, Grep, TodoWrite | sonnet | phoenix-dev/overview, templates/agents |
| `research-specialist` | User | **LEAF** Conduct comprehensive research and create expert agent prompts | Read, Glob, Bash, LS, Grep, WebSearch, WebFetch, TodoWrite | sonnet | research/overview, templates/agents |
| `test-command-generator` | User | **LEAF** Generates project-specific test commands with specialized agents | Read, Write, Glob, Grep, LS, TodoWrite | sonnet | templates/commands, testing/command-templates |
| `test-g-coordinator` | User | Coordinates Gemini-enhanced testing with structured Claude handoff | Bash, Read, Write, Edit, MultiEdit, Glob, Grep, TodoWrite | sonnet | templates/commands/test-g-command-template, agent-analysis/architecture-patterns |
| `test-review` | User | **LEAF** Reviews testing suite tools and provides recommendations | Bash, Grep, Read, TodoWrite | haiku | templates/agents |

### Specialized User Agents (7)
**Purpose**: Specialized functionality and upgrade operations

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `claude-settings-test-manager` | User | Manages test command permissions in settings.local.json | Read, Write, Edit, TodoWrite | haiku | templates/agents |
| `upgrade-backup-manager` | User | Specializes in backup creation and version management for upgrades | Write, Read, Bash, LS, TodoWrite | sonnet | infrastructure/upgrade, templates/agents |
| `upgrade-component-localizer` | User | Specializes in component re-localization execution for upgrades | Write, Read, Task, TodoWrite | sonnet | infrastructure/upgrade, agent-analysis/architecture-patterns |
| `upgrade-discovery-analyzer` | User | Analyzes project discovery and installation status for upgrades | Read, LS, Bash, Grep, TodoWrite | sonnet | infrastructure/upgrade, workflow/discovery |
| `upgrade-legacy-cleaner` | User | Specializes in Phase 0 legacy pattern cleanup for upgrades | Read, Write, LS, Bash, Glob, Grep, TodoWrite | sonnet | infrastructure/upgrade, templates/agents |
| `upgrade-orchestrator-agent` | User | **FAST** Lightweight coordinator for Claudio upgrade operations | Task, Read, Write, Bash, TodoWrite | sonnet | infrastructure/upgrade, agent-analysis/architecture-patterns |
| `upgrade-template-analyzer` | User | Specializes in template comparison and localization planning | Read, Grep, Bash, TodoWrite | sonnet | infrastructure/upgrade, templates/agents |

## System Agents (43) - Internal Operations
*Excluded from user installations, used for system management*

### Claude SDK & Analysis Agents (2)
**Purpose**: Claude Code system analysis and evaluation
**System Marker**: `system: claudio-system`

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `claude-commands-analyst` | System | Evaluates Claude Code slash commands across systems | Read, Glob, Grep, LS, TodoWrite | sonnet | command-analysis/evaluation-framework, command-analysis/best-practices |
| `claude-subagents-analyst` | System | Analyzes Claude Code sub-agents across systems | Read, Glob, Grep, LS, TodoWrite | sonnet | agent-analysis/evaluation-framework, agent-analysis/architecture-patterns |

### Discovery System Agents (6)
**Purpose**: Project discovery and analysis workflows
**System Marker**: `system: claudio-system`

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `discovery-architecture-analyzer` | System | Analyzes project architecture patterns and design patterns | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | workflow/discovery, agent-analysis/architecture-patterns |
| `discovery-consolidator` | System | Consolidates separate discovery analysis files into comprehensive documents | Read, Write, TodoWrite | sonnet | workflow/discovery, templates/agents |
| `discovery-integration-analyzer` | System | Analyzes integration opportunities and tool recommendations | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | workflow/discovery, templates/agents |
| `discovery-structure-analyzer` | System | Analyzes project directory structure and file organization patterns | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | workflow/discovery, templates/agents |
| `discovery-tech-analyzer` | System | Analyzes technology stack, programming languages, and frameworks | Read, Glob, Bash, LS, Grep, TodoWrite | sonnet | workflow/discovery, templates/agents |
| `discovery-validator` | System | Validates discovery document quality and analysis depth | Read, Grep, LS, TodoWrite | haiku | workflow/discovery, templates/agents |

### Installation System Agents (14)
**Purpose**: System installation and setup operations
**System Marker**: `system: claudio-system`

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `install-agents-localizer-agent` | System | Creates localized Claudio agents based on project discovery | Write, Read, Bash, LS, Glob, TodoWrite | sonnet | infrastructure/installation, templates/agents |
| `install-commands-coordinator-agent` | System | **FAST** Orchestrates streamlined commands-only installation | TodoWrite | opus | infrastructure/installation, agent-analysis/architecture-patterns |
| `install-commands-localizer-agent` | System | Creates localized Claudio commands based on project discovery | Write, Read, Bash, LS, Glob, TodoWrite | sonnet | infrastructure/installation, command-analysis/integration-patterns |
| `install-commands-only-agent` | System | Handles commands-only installations with .claude/ directories | Write, Read, Bash, LS, Glob, TodoWrite | sonnet | infrastructure/installation, templates/commands |
| `install-directory-creator-agent` | System | Creates .claude and .claudio directory structures | Bash, LS, TodoWrite | haiku | infrastructure/installation, templates/agents |
| `install-extended-context-generator-agent` | System | Generates project-specific extended context documentation | Write, Read, Bash, LS, TodoWrite | sonnet | infrastructure/installation, templates/workflows |
| `install-full-workflow-agent` | System | Handles complete full workflow installations | Write, Read, Bash, LS, Glob, TodoWrite | sonnet | infrastructure/installation, agent-analysis/architecture-patterns |
| `install-path-validator-agent` | System | Simple path existence check and contents display | Bash, LS, TodoWrite | haiku | infrastructure/installation, templates/agents |
| `install-summary-agent` | System | Generates comprehensive installation summaries and guidance | Write, Read, LS, Bash, TodoWrite | sonnet | infrastructure/installation, templates/agents |
| `install-system-installer` | System | Handles file copying and directory creation for system installations | Write, Read, Bash, LS, TodoWrite | sonnet | infrastructure/installation, templates/agents |
| `install-system-localizer-agent` | System | Localizes Claudio system components based on project discovery | Write, Read, Bash, LS, Glob, TodoWrite | sonnet | infrastructure/installation, templates/agents |
| `install-user-templates-agent` | System | Handles user mode installations with generic template copying | Write, Read, Bash, LS, Glob, TodoWrite | sonnet | infrastructure/installation, templates/agents |
| `install-validation-coordinator` | System | Orchestrates comprehensive installation validation | Task, TodoWrite | opus | infrastructure/installation, agent-analysis/architecture-patterns |
| `install-validator` | System | Validates Claudio installation completeness and generates reports | Read, LS, Bash, TodoWrite | sonnet | infrastructure/installation, templates/agents |

### Testing System Agents (6)
**Purpose**: System testing and validation workflows
**System Marker**: `system: claudio-system`

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `claudio-install-commands-test` | System | Tests /claudio:install commands execution and validation | Bash, Read, LS, Grep, TodoWrite | haiku | testing/command-templates, templates/agents |
| `claudio-install-test` | System | Tests /claudio:install full workflow execution and validation | Bash, Read, LS, Grep, TodoWrite | haiku | testing/command-templates, templates/agents |
| `claudio-test-suite` | System | Execute all 4 core Claudio workflow tests in parallel | Task, Bash, Read, LS, Grep, TodoWrite | opus | testing/command-templates, agent-analysis/architecture-patterns |
| `claudio-upgrade-test` | System | Tests /claudio:upgrade complete workflow execution and validation | Bash, Read, LS, Grep, TodoWrite | haiku | testing/command-templates, templates/agents |
| `generate-test-commands-test` | System | Tests /claudio:generate-test-commands command execution | Bash, Read, LS, Grep, TodoWrite | haiku | testing/command-templates, templates/agents |
| `project-test-runner` | System | Executes project test suites with intelligent framework detection | Bash, Read, Glob, Grep, LS, TodoWrite | sonnet | testing/command-templates, templates/agents |

### Validation System Agents (9)
**Purpose**: System integrity and workflow validation
**System Marker**: `system: claudio-system`

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `command-agent-integration-validator` | System | Validates command-agent relationships match index specifications | Read, LS, Grep, Bash, TodoWrite | haiku | command-analysis/integration-patterns, templates/agents |
| `extended-context-content-validator` | System | Validates extended_context content quality and customization | Read, LS, Grep, Bash, TodoWrite | haiku | agent-analysis/context-integration, templates/agents |
| `extended-context-dependency-validator` | System | Validates agents have required extended_context categories | Read, LS, Bash, TodoWrite | haiku | agent-analysis/context-integration, templates/agents |
| `generation-tracking-validator` | System | Validates generation tracking and component integrity | Read, LS, Bash, Grep, TodoWrite | haiku | generation/prompt-templates, templates/agents |
| `installation-mode-validator` | System | Applies mode-specific validation criteria based on installation type | Read, LS, Bash, TodoWrite | haiku | infrastructure/installation, templates/agents |
| `new-command-validator` | System | Validates generated custom commands for structure and quality | Read, Grep, LS, TodoWrite | haiku | command-analysis/best-practices, templates/commands |
| `orchestrator-integration-validator` | System | Validates complex agent hierarchies and parallel execution patterns | Read, LS, Grep, Bash, TodoWrite | haiku | agent-analysis/architecture-patterns, templates/agents |
| `upgrade-installation-validator` | System | Specializes in post-upgrade validation and reporting | Read, LS, Bash, TodoWrite | sonnet | infrastructure/upgrade, templates/agents |
| `workflow-validator` | System | Validates Claudio workflow document quality and completeness | Read, LS, Grep, TodoWrite | haiku | workflow/discovery, templates/workflows |

### System Generation Agents (6)
**Purpose**: Component generation and template creation
**System Marker**: `system: claudio-system`

| Agent | Type | Description | Tools | Model | Extended Context |
|-------|------|-------------|-------|-------|----------------|
| `claude-md-generator-agent` | System | Generates AI-focused CLAUDE.md files with project context | Write, Read, TodoWrite | sonnet | meta/claude/commands/templates, templates/agents |
| `newprompt-agent-creator` | System | Creates comprehensive agent prompts following Claudio conventions | Write, Read, Glob, TodoWrite | sonnet | templates/agents, generation/prompt-templates |
| `newprompt-command-creator` | System | Creates command files following Claudio patterns | Write, Read, Glob, TodoWrite | sonnet | templates/commands, meta/claude/commands/templates |
| `newprompt-coordinator` | System | Coordinates creation of new agent prompts and commands | Task, TodoWrite | opus | agent-analysis/architecture-patterns, templates/agents |
| `newprompt-integration-planner` | System | Plans workflow integration requirements and documentation updates | Read, Glob, Write, TodoWrite | sonnet | command-analysis/integration-patterns, templates/workflows |
| `user-readme-generator-agent` | System | Generates user-facing documentation with command examples | Write, Read, LS, TodoWrite | sonnet | documentation/overview, templates/agents |

## System Metadata

### Component Classification Summary
- **User Agents (37)**: Installed in user projects for workflow execution  
- **System Agents (43)**: Internal operations, excluded from user installations
- **System Marker**: `system: claudio-system` in frontmatter excludes from user installs

### Model Distribution
- **Haiku (11 agents)**: Simple validation, file operations, fast processing
- **Sonnet (59 agents)**: Complex reasoning, analysis, generation tasks
- **Opus (8 agents)**: Multi-agent coordination, orchestration workflows

### Installation Impact
- **Commands-Only Mode**: Installs user agents required by commands
- **Full Workflow Mode**: Installs all user agents + workflow documentation
- **System Operations**: System agents remain in main Claudio directory

## External Agents (Not Part of Claudio)

### Built-in Claude Agents (3) - Always Available
**Purpose**: Core Claude Code functionality provided by Anthropic
**Location**: Built into Claude Code system (not file-based)

| Agent | Model | Description |
|-------|-------|-------------|
| `general-purpose` | sonnet | General-purpose agent for researching complex questions and executing multi-step tasks |
| `statusline-setup` | sonnet | Configures Claude Code status line settings |
| `output-style-setup` | sonnet | Creates Claude Code output styles |

### User-Level Agents (1) - External Installation
**Purpose**: User-installed agents outside Claudio project
**Location**: `/Users/vinnie/.claude/agents`

| Agent | Model | Description |
|-------|-------|-------------|
| `code-review-orchestrator` | sonnet | Comprehensive code review with multi-perspective analysis |

*Note: External user agents may override Claudio agents when names conflict*

## Maintenance Notes

- **Index Updates**: Use `/claudio:update-docs` to update this index when agents change
- **Agent Count**: Update totals when adding/removing agents  
- **Model Assignments**: Verify model field matches agent complexity level
- **System Classification**: Ensure proper `system: claudio-system` marking for internal agents