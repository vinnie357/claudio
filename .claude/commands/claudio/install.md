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

## Installation Target

**Path Resolution:**
- **No parameter**: Install to current directory
- **With path**: Install to specified directory (e.g., `/Users/vinnie/github/rig`)

**Installation Type:** Full workflow installation (complete .claude/ + .claudio/ system)

## Installation Process

Use the install-coordinator-agent subagent to install complete Claudio system at the target path. The coordinator will:

1. Use the discovery-agent subagent to **analyze target project** structure and technology stack
2. Use the prd-agent subagent to **generate requirements** document based on discovery
3. Use the plan-agent subagent to **create implementation plan** with phases and timelines
4. Use the task-agent subagent to **organize tasks** with specialized contexts
5. Use the install-system-installer subagent to **install system files** and directories
6. Use the install-validator subagent to **validate installation** completeness
7. Use the install-summary-agent subagent to **generate summary** and user guidance

**Installation Creates:**
- `.claude/` directory with commands, agents, and extended context
- `.claudio/` directory with workflow documents and project analysis
- Project-specific localization based on discovery

**All installations include automatic validation** to ensure complete functional system is properly installed.