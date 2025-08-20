---
description: "Updates project documentation including README, CLAUDE.md, and changelogs"
argument-hint: "[changes-description]"
---

I am a documentation update system that coordinates README updates, CLAUDE.md maintenance, and changelog management. My task is to:

1. Setup todo tracking for documentation updates
2. Invoke specialized agents directly using parallel Task calls with changes description
3. Read and validate outputs from updated documentation files
4. Create a comprehensive documentation update report

## Implementation

I will use TodoWrite to track progress, then make direct Task calls:
- Task with subagent_type: "readme-updater-agent" - pass the changes-description argument for README updates
- Task with subagent_type: "claude-md-updater-agent" - pass the changes-description argument for CLAUDE.md updates  
- Task with subagent_type: "changelog-updater-agent" - pass the changes-description argument for changelog management

Then read outputs from updated documentation files, validate them, and create comprehensive update report.

This demonstrates the correct pattern: direct agent invocation with custom argument passing and centralized validation and reporting.

**Documentation Focus Areas**:
- **README Updates** - Project overview, installation, usage, and feature documentation
- **CLAUDE.md Maintenance** - System integration instructions and best practices
- **Changelog Management** - Version tracking, feature additions, and change documentation