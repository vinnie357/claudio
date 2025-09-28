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

I will use TodoWrite to track progress through managed phases:

Use TodoWrite to start Phase 1 - Foundation Setup.

**Sequential Foundation** (Basic setup only):
- Task with subagent_type: "install-path-validator-agent" - pass the project_path argument for path validation
- Task with subagent_type: "install-directory-creator-agent" - pass the project_path argument for structure creation

Use TodoWrite to complete Phase 1 - Foundation Setup.

Use TodoWrite to start Phase 2 - Discovery Analysis.

**Parallel Discovery Analysis** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "discovery-structure-analyzer" - pass the project_path argument for structure analysis
- Task with subagent_type: "discovery-tech-analyzer" - pass the project_path argument for technology analysis
- Task with subagent_type: "discovery-architecture-analyzer" - pass the project_path argument for architecture analysis
- Task with subagent_type: "discovery-integration-analyzer" - pass the project_path argument for integration analysis

**Sequential Discovery Consolidation**:
- Task with subagent_type: "discovery-consolidator" - pass the project_path argument for consolidating discovery analyses

Use TodoWrite to complete Phase 2 - Discovery Analysis.

Use TodoWrite to start Phase 3 - Generation Tracking Setup.

**Sequential Tracking Directory Setup**:
Create the shared tracking directory structure for generation tracking:
- Ensure `.claudio/shared/` directory exists at project path
- Initialize tracking directory with proper permissions
- Prepare for sequential generation tracking chain

Use TodoWrite to complete Phase 3 - Generation Tracking Setup.

Use TodoWrite to start Phase 4 - Sequential Resource Generation.

**Sequential Generation Chain** (Following discovery → commands → agents → context dependency chain):

**Step 1 - Commands Generation with Tracking**:
- Task with subagent_type: "install-commands-localizer-agent" - pass the project_path argument for discovery-driven command generation and tracking
- Task with subagent_type: "test-command-generator" - pass the project_path argument for test command generation
- Task with subagent_type: "claude-settings-test-manager" - pass the project_path argument for test permissions setup

**Step 2 - Agents Generation with Tracking** (depends on commands tracking JSON):
- Task with subagent_type: "install-agents-localizer-agent" - pass the project_path argument for agents generation based on commands tracking

**Step 3 - Context Generation with Tracking** (depends on agents tracking JSON):
- Task with subagent_type: "install-extended-context-generator-agent" - pass the project_path argument for context generation based on agents tracking

Use TodoWrite to complete Phase 4 - Sequential Resource Generation.

Use TodoWrite to start Phase 5 - Documentation Generation.

**Sequential Documentation Generation**:
- Task with subagent_type: "claude-md-generator-agent" - pass the project_path argument for AI-focused CLAUDE.md generation
- Task with subagent_type: "user-readme-generator-agent" - pass the project_path argument for user documentation creation

Use TodoWrite to complete Phase 5 - Documentation Generation.

Use TodoWrite to start Phase 6 - Generation Tracking Validation.

**Sequential Validation**:
- Task with subagent_type: "generation-tracking-validator" - pass the project_path argument for generation tracking validation
- Task with subagent_type: "install-validator" - pass the project_path argument for final installation validation

Use TodoWrite to complete Phase 6 - Generation Tracking Validation.

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

**Parallel Command Generation** (Run multiple Task invocations in SINGLE message):
8. **Command Localization**: Generate localized commands based on discovery
9. **Test Command Generation**: Generate project-specific /claudio:test and /claudio:test-g commands

**Sequential Agent Generation**:
10. **Agent Localization**: Generate discovery-based localized agents (with extended context awareness)

**Sequential Context & Documentation Generation**:
11. **Extended Context Generation**: Generate project-specific extended contexts (supports all commands and agents)
12. **AI-focused CLAUDE.md Generation**: Create AI context documentation with agent listings and project patterns
13. **User Documentation Generation**: Create user-facing README.md with command examples and workflows

**Sequential Completion**:
14. **Installation Validation**: Verify complete functional system

## Installation Creates

**Project Path Target Structure:**
- `{project_path}/.claude/` directory with commands, agents, and extended context
- `{project_path}/.claudio/` directory with workflow documents and project analysis
- `{project_path}/.claudio/docs/README.md` with user-facing command examples and workflows
- `{project_path}/CLAUDE.md` with AI-focused project context and agent listings
- Project-specific localization based on discovery analysis

**Path Resolution:**
- **No parameter**: Install to current directory (`./`)
- **With path**: Install to specified directory (supports `./`, `../path`, `/full/path`)
- **All operations**: Relative to provided project_path argument