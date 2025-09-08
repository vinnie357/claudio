---
description: "Generate project-specific test commands based on discovery analysis"
argument-hint: "<target_project_path>"
system: claudio-system
---

**SYSTEM COMMAND** - Automatically called during install/upgrade workflows. Stays in Claudio system, only generated commands are installed in user projects.

Generate custom test commands (`/claudio:test` and `/claudio:test-g`) with their sub-agents and extended context based on the target project's discovery analysis. Creates project-specific testing capabilities that understand the project's test framework, structure, and requirements.

**Generated Commands (installed in target project):**
- `/claudio:test` - Runs project test suite with intelligent summary and optional --fix flag
- `/claudio:test-g` - Gemini-integrated testing with read-only analysis and task generation

**Automatic Integration:**
This command is automatically called during:
- `/claudio:install /path/to/project`
- `/claudio:install commands /path/to/project` 
- `/claudio:claudio /path/to/project`
- `/claudio:upgrade /path/to/project`

**Requirements:**
- Target project must have discovery analysis completed (discovery.md)
- For generated `/claudio:test-g`: Requires gemini-cli access and appropriate API configuration

**Process:**
1. Analyze project discovery documents to understand testing framework
2. Generate project-specific test command implementations  
3. Create specialized sub-agents for test execution and analysis
4. Generate extended context based on project's testing patterns
5. Install generated commands in target project's `.claude/` structure

**Command Distribution:**
- **This system command**: Remains in Claudio system directory only
- **Generated test commands**: Installed in `<target_project>/.claude/commands/claudio/`
- **Generated sub-agents**: Installed in `<target_project>/.claude/agents/claudio/`
- **Generated context**: Installed in `<target_project>/.claude/agents/claudio/extended_context/`

Task with subagent_type: "test-command-generator" - pass the project_path argument to orchestrate discovery analysis, command generation, and installation process.

Task with subagent_type: "claude-settings-test-manager" - pass the project_path argument to setup test command permissions.

**Validator Note**: Install validators should expect `/claudio:test` and `/claudio:test-g` commands in user project installations, but NOT expect `generate-test-commands` in user directories.