---
description: "Install Claudio system components with flexible path support and claudio namespace integration"
argument-hint: "[commands] [user|<path>]"
---

Install Claudio system components (commands, agents, prompts) to different target locations with flexible installation modes.

**Syntax:**
- `/install` - defaults to project mode, full workflow
- `/install commands` - defaults to project mode, commands only
- `/install commands user` - user mode, commands only
- `/install /path/to/code` - path mode, full workflow
- `/install commands /path/to/code` - path mode, commands only

Use the claudio:install-coordinator subagent to orchestrate the installation process with parallel validation.