---
description: "Install Claudio system components with flexible path support and claudio namespace integration"
argument-hint: "[commands] [user|<path>]"
---

Install Claudio system components through intelligent project localization to different target locations with flexible installation modes. Components are customized based on project discovery rather than directly copied.

**Syntax:**
- `/install` - defaults to project mode, full workflow
- `/install commands` - defaults to project mode, commands only
- `/install commands user` - user mode, commands only
- `/install /path/to/code` - path mode, full workflow
- `/install commands /path/to/code` - path mode, commands only

Use the claudio:install-coordinator subagent to orchestrate the installation process with project discovery, component localization, and parallel validation.