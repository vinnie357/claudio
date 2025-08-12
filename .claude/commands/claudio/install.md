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

Use the claudio:install-coordinator-agent subagent to orchestrate the complete installation process at the specified target path with:
- Target path resolution and validation
- Project discovery and analysis at target location
- Complete system component generation (commands + agents + prompts) at target path
- Multi-point validation (workflow validation + installation validation) at target location
- Comprehensive quality assurance and reporting

**CRITICAL**: The coordinator agent must install to the command parameter path, never to subdirectories within it. For `/install /path/to/project`, installation must create `/path/to/project/.claude/` and `/path/to/project/.claudio/`, never `/path/to/project/claudio/.claude/`.

## Post-Installation Verification

**Target Location Confirmation**:
- Target directory contents: !`ls -la {target}/ | grep -E '\.(claude|claudio)' || echo 'Installation directories not found at target'`
- Installation target structure: !`find {target}/.claude -type d -name '*' 2>/dev/null | head -10`
- Commands installed: !`find {target}/.claude/commands -name '*.md' 2>/dev/null | wc -l`
- Agents installed: !`find {target}/.claude/agents -name '*.md' 2>/dev/null | wc -l`
- Workflow documents: !`ls -la {target}/.claudio/docs/ 2>/dev/null || echo 'none'`

**All installations include automatic validation** to ensure complete functional system is properly installed.