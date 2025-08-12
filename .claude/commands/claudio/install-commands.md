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

## Target Path Resolution

Determine target installation path from command parameters:

**Path Variable Setup:**
!`if [ -z "$1" ]; then TARGET_PATH=$(pwd); elif [ "$1" = "user" ]; then TARGET_PATH="$HOME/.claude"; else TARGET_PATH="$1"; fi`

**Installation Modes:**
- **Current Directory**: `TARGET_PATH=$(pwd)` - Project-specific with discovery
- **Specified Path**: `TARGET_PATH="$1"` - Project-specific with discovery  
- **User Mode**: `TARGET_PATH="$HOME/.claude"` - Generic templates (no discovery)

## Pre-Installation Context

- Target installation path: !`echo "${TARGET_PATH}"`
- Target installation check: !`test -d "${TARGET_PATH}/.claude" && echo 'exists' || echo 'available'`

## Installation Process

Use the install-commands-coordinator-agent subagent to execute streamlined installation workflow. The coordinator will:

1. **Project Discovery** (skip for user mode) - Analyze target project
2. **System Installation** - Install .claude/ directory with commands and agents
3. **Installation Validation** - Verify installation integrity  
4. **Installation Summary** - Generate user guidance

**STREAMLINED WORKFLOW**: No PRD, planning, or task generation steps - focuses on getting the command system operational quickly.

## Post-Installation Verification

**Installation Results:**
- Commands installed: !`find "${TARGET_PATH}/.claude/commands" -name '*.md' 2>/dev/null | wc -l`
- Agents installed: !`find "${TARGET_PATH}/.claude/agents" -name '*.md' 2>/dev/null | wc -l`
- Basic discovery: !`ls -la "${TARGET_PATH}/.claudio/docs/discovery.md" 2>/dev/null || echo 'user mode - no discovery'`

The streamlined installation provides immediate access to all Claudio commands while maintaining project-specific customization through basic discovery analysis.