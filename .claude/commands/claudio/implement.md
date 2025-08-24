---
description: "Execute implementation plans with parallel task processing and coordination"
argument-hint: "[project_path] [options]"
---

I am an implementation execution system that coordinates systematic implementation of plans created by the Claudio workflow. My task is to:

1. Setup todo tracking for implementation execution workflow
2. Invoke implement-agent directly using Task calls with project coordination
3. Read and validate outputs from implementation execution results
4. Create a comprehensive implementation progress report

## Implementation

I will use TodoWrite to track progress, then make direct Task calls:
- Task with subagent_type: "implement-agent" - pass the project_path argument for systematic execution of implementation plans with dependency management, progress tracking, and quality assurance

Then read outputs from implementation execution results, validate them, and create comprehensive implementation report.

This command is **optional** and invoked separately when users are ready to execute their implementation plans.

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