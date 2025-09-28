---
description: "Install Claudio commands and agents only (streamlined setup without full workflow generation)"
argument-hint: "[user|<path>]"
allowed-tools: Bash(mkdir:*), Bash(ls:*), Bash(find:*), Bash(test:*), Bash(pwd:*), Bash(cd:*)
system: claudio-system
---

Install Claudio commands and agents with basic project discovery for fast setup. This streamlined installation creates the `.claude/` system without generating full workflow documents.

## Installation Modes

**Commands-Only Installation Paths:**
- `/claudio:install-commands` - Install to current directory with basic discovery
- `/claudio:install-commands /path/to/project` - Install to specific project path with discovery
- `/claudio:install-commands user` - Install generic templates to ~/.claude/ (no discovery)

## Installation Target

**Path Resolution:**
- **No parameter**: Install to current directory with project discovery
- **With path**: Install to specified directory with project discovery  
- **"user" parameter**: Install generic templates to ~/.claude/ (no discovery)

## Installation Process

Use TodoWrite to start Phase 1 - Discovery and System Setup.

- Task with subagent_type: "discovery-agent" - pass the project_path argument to analyze target project (skip for user mode)
- Task with subagent_type: "install-system-installer" - pass the project_path argument to install system files and .claude/ directory

Use TodoWrite to complete Phase 1 - Discovery and System Setup.

Use TodoWrite to start Phase 2 - Validation and Summary.

- Task with subagent_type: "install-validator" - pass the project_path argument to validate installation integrity
- Task with subagent_type: "install-summary-agent" - pass the project_path argument to generate user guidance and next steps

Use TodoWrite to complete Phase 2 - Validation and Summary.

**STREAMLINED WORKFLOW**: No PRD, planning, or task generation steps - focuses on getting the command system operational quickly.

**Installation Creates:**
- `.claude/` directory with commands, agents, and extended context
- Basic `.claudio/docs/discovery.md` (except user mode)
- Project-specific command localization

The streamlined installation provides immediate access to all Claudio commands while maintaining project-specific customization through basic discovery analysis.