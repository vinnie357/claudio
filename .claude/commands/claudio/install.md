---
description: "Install complete Claudio system with full workflow generation and project path coordination"
argument-hint: "[<path>]"
allowed-tools: Bash(mkdir:*), Bash(ls:*), Bash(find:*), Bash(test:*), Bash(pwd:*)
system: claudio-system
---

I am an installation system that coordinates complete Claudio system setup with project discovery, workflow generation, and localized component creation. My task is to:

1. Setup todo tracking for installation workflow
2. Invoke specialized agents directly using parallel Task calls with project_path arguments
3. Read and validate installation outputs from target directory
4. Create comprehensive installation report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

**Sequential Foundation** (Basic setup only):
- Task with subagent_type: "install-path-validator" - pass the project_path argument for path validation
- Task with subagent_type: "install-directory-creator" - pass the project_path argument for structure creation

**Parallel Discovery Analysis** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "discovery-structure-analyzer" - pass the project_path argument for structure analysis
- Task with subagent_type: "discovery-tech-analyzer" - pass the project_path argument for technology analysis
- Task with subagent_type: "discovery-architecture-analyzer" - pass the project_path argument for architecture analysis
- Task with subagent_type: "discovery-integration-analyzer" - pass the project_path argument for integration analysis

**Sequential Discovery Consolidation**:
- Task with subagent_type: "discovery-consolidator" - pass the project_path argument for consolidating discovery analyses

**Parallel Localization** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "install-agents-localizer" - pass the project_path argument for agent localization
- Task with subagent_type: "install-commands-localizer" - pass the project_path argument for command localization
- Task with subagent_type: "install-extended-context-generator" - pass the project_path argument for context creation
- Task with subagent_type: "claude-md-generator" - pass the project_path argument for CLAUDE.md generation

**Sequential Completion**:
- Task with subagent_type: "install-validator" - pass the project_path argument for final validation

Then read outputs from installation results, validate system completeness, and create comprehensive installation report.

This demonstrates the correct pattern: direct agent invocation with parallel execution and centralized validation and reporting.

## Installation Modes

**Full System Installation with Project Path Support:**
- `/claudio:install` - Install to current directory (`./`) with complete workflow
- `/claudio:install /path/to/project` - Install to specific project path with complete workflow
- `/claudio:install ../relative/path` - Install to relative path with complete workflow

## Installation Process

**Sequential Foundation** (Basic setup only):
1. **Path Validation**: Validate target path and permissions
2. **Directory Creation**: Create `.claude/` and `.claudio/` structure

**Parallel Discovery Analysis** (Run multiple Task invocations in SINGLE message):
3. **Structure Analysis**: Analyze project directory structure and organization
4. **Technology Analysis**: Detect programming languages, frameworks, and dependencies
5. **Architecture Analysis**: Assess architectural patterns and code organization
6. **Integration Analysis**: Identify tool recommendations and workflow enhancements

**Sequential Discovery Consolidation**:
7. **Discovery Consolidation**: Combine all analysis outputs into comprehensive discovery.md

**Parallel Localization** (Run multiple Task invocations in SINGLE message):
8. **Agent Localization**: Generate discovery-based localized agents
9. **Command Localization**: Generate localized commands that reference agents
10. **Extended Context**: Generate project-specific extended contexts
11. **CLAUDE.md Generation**: Create project integration documentation

**Sequential Completion**:
12. **Installation Validation**: Verify complete functional system

## Installation Creates

**Project Path Target Structure:**
- `{project_path}/.claude/` directory with commands, agents, and extended context
- `{project_path}/.claudio/` directory with workflow documents and project analysis  
- `{project_path}/CLAUDE.md` with project-specific integration guidance
- Project-specific localization based on discovery analysis

**Path Resolution:**
- **No parameter**: Install to current directory (`./`)
- **With path**: Install to specified directory (supports `./`, `../path`, `/full/path`)
- **All operations**: Relative to provided project_path argument