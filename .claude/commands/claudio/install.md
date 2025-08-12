---
description: "Install Claudio system components with flexible path support and claudio namespace integration"
argument-hint: "[commands] [user|<path>]"
allowed-tools: Bash(mkdir:*), Bash(ls:*), Bash(find:*), Bash(test:*), Bash(pwd:*), Bash(tree:*)
system: claudio-system
---

Install complete Claudio system through intelligent project localization to different target locations with flexible installation modes. All components are customized based on project discovery rather than directly copied.

## Pre-Installation Context

- Current working directory: !`pwd`
- Available installation targets: !`find . -maxdepth 1 -type d -name '.*' 2>/dev/null || echo 'none'`
- Existing .claude installation: !`test -d ./.claude && echo 'found' || echo 'none'`
- Home .claude installation: !`test -d ~/.claude && echo 'found' || echo 'none'`

**IMPORTANT**: "Commands" installs complete functional system:
- Commands files (`commands/claudio/`)
- Required sub-agents (`agents/claudio/`) 
- Extended context documents (`agents/claudio/prompts/`)

**Installation Workflows with Validation:**
- `/install` - Full workflow → validate workflow → install → validate installation
- `/install commands` - Discovery → validate discovery → install complete system → validate installation  
- `/install commands user` - Install generic templates → validate installation
- `/install /path/to/code` - Full workflow → validate workflow → install → validate installation
- `/install commands /path/to/code` - Discovery → validate discovery → install complete system → validate installation

## Target Path Resolution and Directory Change

Determine installation target from command parameters and change to target directory:

**For path-based installation** (`/install /path/to/project`):
- Target: `/path/to/project/`
- Change to target directory: !`cd "$1" || (echo "Failed to change to directory: $1" && exit 1)`

**For current directory installation** (`/install`):
- Target: Current working directory (no directory change needed)

**Mode**: Full workflow installation (complete .claude/ + .claudio/ system)

Use the claudio:install-coordinator-agent subagent to install complete Claudio system in the current working directory. The coordinator agent will create `.claude/` and `.claudio/` directories in the current directory.

**CRITICAL PATH RULE**: For `/install /path/to/project`, installation must create `/path/to/project/.claude/` and `/path/to/project/.claudio/`, never `/path/to/project/claudio/.claude/`.

## Post-Installation Verification

**Target Location Confirmation**:
- Target directory contents: !`ls -la . | grep -E '\.(claude|claudio)' || echo 'Installation directories not found at target'`
- Installation target structure: !`find ./.claude -type d -name '*' 2>/dev/null | head -10`
- Commands installed: !`find ./.claude/commands -name '*.md' 2>/dev/null | wc -l`
- Agents installed: !`find ./.claude/agents -name '*.md' 2>/dev/null | wc -l`
- Workflow documents: !`ls -la ./.claudio/docs/ 2>/dev/null || echo 'none'`

**All installations include automatic validation** to ensure complete functional system is properly installed.