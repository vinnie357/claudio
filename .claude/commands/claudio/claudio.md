---
description: "Comprehensive project analysis and planning system with direct agent coordination"
argument-hint: "<target_project_path> [--implement]"
---

I am a comprehensive project analysis and planning system that directly coordinates discovery, requirements, planning, and task organization for any codebase. My task is to:

1. Setup todo tracking for the workflow
2. Invoke specialized agents directly using parallel Task calls with project_path arguments
3. Read and validate outputs from .claudio/docs/ files
4. Create a comprehensive summary report

## Implementation

I will use TodoWrite to track progress, then execute the smart conditional workflow:

### Phase 1: Installation Check and Conditional Setup

**Check Installation Status**:
- Use LS tool to check if .claude/agents/claudio/ directory exists
- Use LS tool to check if .claudio/docs/ directory exists

**If Installation NOT Found** (run full install):

**Sequential Foundation**:
- Task with subagent_type: "install-path-validator" - pass the project_path argument for path validation
- Task with subagent_type: "install-directory-creator" - pass the project_path argument for structure creation

**Parallel Discovery Analysis** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "discovery-structure-analyzer" - pass the project_path argument for structure analysis
- Task with subagent_type: "discovery-tech-analyzer" - pass the project_path argument for technology analysis  
- Task with subagent_type: "discovery-architecture-analyzer" - pass the project_path argument for architecture analysis
- Task with subagent_type: "discovery-integration-analyzer" - pass the project_path argument for integration analysis

**Sequential Discovery Consolidation**:
- Task with subagent_type: "discovery-consolidator" - pass the project_path argument for consolidating analyses

**Parallel Command Generation**:
- Task with subagent_type: "install-commands-localizer" - pass the project_path argument for command localization
- Task with subagent_type: "test-command-generator" - pass the project_path argument for test command generation

**Sequential Agent Generation**:
- Task with subagent_type: "install-agents-localizer" - pass the project_path argument for agent localization

**Sequential Context & Documentation**:
- Task with subagent_type: "install-extended-context-generator" - pass the project_path argument for context creation
- Task with subagent_type: "claude-md-generator" - pass the project_path argument for CLAUDE.md generation
- Task with subagent_type: "user-readme-generator" - pass the project_path argument for user documentation

**Sequential Validation**:
- Task with subagent_type: "install-validator" - pass the project_path argument for validation

**If Installation Found** (refresh discovery only):
- Task with subagent_type: "discovery-agent" - pass the project_path argument to refresh discovery analysis

### Phase 2: Workflow Generation (ALWAYS RUN)

**Parallel Workflow Generation** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "prd-agent" - pass the project_path argument for requirements (uses discovery from Phase 1)
- Task with subagent_type: "plan-agent" - pass the project_path argument for planning
- Task with subagent_type: "task-agent" - pass the project_path argument for task breakdown

**Sequential Finalization**:
- Task with subagent_type: "claudio-structure-creator-agent" - pass the project_path argument for finalization

Then read outputs from .claudio/docs/ files, validate them, and create comprehensive workflow report.

This demonstrates smart conditional installation with always-running workflow generation.

**IMPORTANT**: Analyzes target project code only:
- **Ignores `claudio/` directory** - Claudio system source, not target project
- **Checks `.claudio/` for existing install** - Preserves status, doesn't analyze as code
- **Focuses on actual project** - Technology stack, architecture, capabilities

