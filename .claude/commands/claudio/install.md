---
description: "Install complete Claudio system with full workflow generation (discovery, PRD, planning, tasks)"
argument-hint: "[<path>]"
allowed-tools: Bash(mkdir:*), Bash(ls:*), Bash(find:*), Bash(test:*), Bash(pwd:*)
system: claudio-system
---

Install complete Claudio system with full workflow generation including project discovery, requirements documentation, implementation planning, and task organization.

## Installation Modes

**Full System Installation:**
- `/claudio:install` - Install to current directory with complete workflow
- `/claudio:install /path/to/project` - Install to specific project with complete workflow

## Target Path Resolution

Determine installation target from command parameters:

**Path Variable Setup:**
!`if [ -z "$1" ]; then TARGET_PATH=$(pwd); else TARGET_PATH="$1"; fi`

**Installation Modes:**
- **Current Directory**: `TARGET_PATH=$(pwd)` - Full workflow installation
- **Specified Path**: `TARGET_PATH="$1"` - Full workflow installation

**Mode**: Full workflow installation (complete .claude/ + .claudio/ system)

## Pre-Installation Context

- Target installation path: !`echo "${TARGET_PATH}"`
- Target installation check: !`test -d "${TARGET_PATH}/.claude" && echo 'exists' || echo 'available'`

## Installation Process

Use the install-coordinator-agent subagent to install complete Claudio system at the target path. The coordinator agent will create `.claude/` and `.claudio/` directories at `${TARGET_PATH}`.

**CRITICAL PATH RULE**: Installation creates `${TARGET_PATH}/.claude/` and `${TARGET_PATH}/.claudio/`, never nested subdirectories.

## Post-Installation Verification

**Target Location Confirmation**:
- Installation target structure: !`find "${TARGET_PATH}/.claude" -type d -name '*' 2>/dev/null | head -10`
- Commands installed: !`find "${TARGET_PATH}/.claude/commands" -name '*.md' 2>/dev/null | wc -l`
- Agents installed: !`find "${TARGET_PATH}/.claude/agents" -name '*.md' 2>/dev/null | wc -l`
- Workflow documents: !`ls -la "${TARGET_PATH}/.claudio/docs/" 2>/dev/null || echo 'none'`

**All installations include automatic validation** to ensure complete functional system is properly installed.