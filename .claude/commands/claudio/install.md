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

Use the install-full-workflow-agent subagent to install complete Claudio system at the target path. The agent will:

1. **Create directory structure** immediately using direct bash commands
2. **Run project discovery** to analyze target project structure and technology stack
3. **Generate localized components** based on discovery analysis and project requirements
4. **Create initial workflow structure** with discovery documentation and next steps

**Installation Creates:**
- `.claude/` directory with commands, agents, and extended context
- `.claudio/` directory with workflow documents and project analysis
- Project-specific localization based on discovery

**All installations include automatic validation** to ensure complete functional system is properly installed.