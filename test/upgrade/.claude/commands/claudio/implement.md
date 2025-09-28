---
description: "Execute TaskFlow implementation plans with parallel task processing and coordination"
argument-hint: "[project_path] [options]"
---

I am a TaskFlow implementation execution system that coordinates systematic implementation of plans created by the Claudio workflow. My task is to:

1. Setup todo tracking for TaskFlow implementation execution workflow
2. Invoke implement-agent directly using Task calls with project coordination
3. Read and validate outputs from implementation execution results
4. Create a comprehensive TaskFlow implementation progress report

## Implementation

I will use TodoWrite to track progress, then make direct Task calls:
- Task with subagent_type: "implement-agent" - pass the project_path argument for systematic execution of TaskFlow implementation plans with dependency management, progress tracking, and quality assurance

Then read outputs from implementation execution results, validate them, and create comprehensive TaskFlow implementation report.

This command is **optional** and invoked separately when users are ready to execute their TaskFlow implementation plans.

**TaskFlow-Specific Implementation:**
- **Mobile Development**: React Native component implementation, platform-specific features, testing
- **Backend Services**: Node.js microservices deployment, API development, database setup
- **Real-time Features**: WebSocket implementation, synchronization logic, conflict resolution
- **AI Integration**: Machine learning service integration, task prediction models

**Usage Patterns:**

**Standalone Execution** (Recommended):
```bash
# Complete TaskFlow planning workflow
/claudio ../taskflow-project

# Separate TaskFlow implementation execution when ready
/claudio:implement ../taskflow-project
```

**Optional Integration with Main Workflow**:
```bash
# Include TaskFlow implementation via flag
/claudio ../taskflow-project --implement
```

**Parameters:**
- `project_path`: Path to TaskFlow project with `.claudio/` folder (optional, defaults to current directory)
- `--phase <name>`: Execute specific TaskFlow phase only
- `--task <id>`: Execute specific task (e.g., phase1.task2)
- `--resume`: Resume interrupted TaskFlow execution from checkpoint
- `--parallel <number>`: Control concurrent task limit (default: 3)
- `--dry-run`: Show TaskFlow execution plan without implementing
- `--status`: Display current TaskFlow implementation progress

**Integration Points:**
- **Prerequisites**: Requires completed `/task` breakdown with TaskFlow `.claudio/` structure
- **Coordinates with**: code-quality-analyzer, documentation-coordinator, test-review
- **Updates**: All TaskFlow status files and progress tracking throughout execution
- **Position**: Optional execution after TaskFlow planning and task breakdown phases

**Reference**: Uses task-agent for TaskFlow implementation orchestration patterns and parallel task coordination.