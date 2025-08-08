---
description: "Install Claudio system components with flexible path support and claudio namespace integration"
argument-hint: "[commands] [user|<path>]"
---

Install complete Claudio system through intelligent project localization to different target locations with flexible installation modes. All components are customized based on project discovery rather than directly copied.

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

Use the claudio:install-coordinator subagent to orchestrate the complete installation process with:
- Project discovery and analysis
- Complete system component generation (commands + agents + prompts)
- Multi-point validation (workflow validation + installation validation)
- Comprehensive quality assurance and reporting

**All installations include automatic validation** to ensure complete functional system is properly installed.