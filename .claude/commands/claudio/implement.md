---
description: "Execute implementation plans with parallel task processing and coordination"
argument-hint: "[project_path] [options]"
---

Execute implementation plans created by the Claudio workflow through parallel task processing and comprehensive progress coordination. This command is **optional** and invoked separately when users are ready to execute their implementation plans.

Use Task tool with subagent_type: "implement-agent" to coordinate systematic execution of implementation plans with dependency management, progress tracking, and quality assurance.

**Usage Patterns:**

**Standalone Execution** (Recommended):
```bash
# Complete planning workflow
/claudio ../my-project

# Separate implementation execution when ready
/claudio:implement ../my-project
```

**Optional Integration with Main Workflow**:
```bash
# Include implementation via flag
/claudio ../my-project --implement
```

**Parameters:**
- `project_path`: Path to project with `.claudio/` folder (optional, defaults to current directory)
- `--phase <name>`: Execute specific phase only
- `--task <id>`: Execute specific task (e.g., phase1.task2)
- `--resume`: Resume interrupted execution from checkpoint
- `--parallel <number>`: Control concurrent task limit (default: 3)
- `--dry-run`: Show execution plan without implementing
- `--status`: Display current implementation progress

**Integration Points:**
- **Prerequisites**: Requires completed `/task` breakdown with `.claudio/` structure
- **Coordinates with**: code-quality-analyzer, documentation-coordinator, test-review
- **Updates**: All status files and progress tracking throughout execution
- **Position**: Optional execution after planning and task breakdown phases

**Reference**: Uses implement-agent for implementation orchestration patterns and parallel task coordination.