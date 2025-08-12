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

Use the install-commands-coordinator-agent subagent to execute streamlined installation workflow. The coordinator will:

1. Use the discovery-agent subagent to **analyze target project** (skip for user mode)
2. Use the install-system-installer subagent to **install system files** and .claude/ directory  
3. Use the install-validator subagent to **validate installation** integrity
4. Use the install-summary-agent subagent to **generate user guidance** and next steps

**STREAMLINED WORKFLOW**: No PRD, planning, or task generation steps - focuses on getting the command system operational quickly.

**Installation Creates:**
- `.claude/` directory with commands, agents, and extended context
- Basic `.claudio/docs/discovery.md` (except user mode)
- Project-specific command localization

The streamlined installation provides immediate access to all Claudio commands while maintaining project-specific customization through basic discovery analysis.