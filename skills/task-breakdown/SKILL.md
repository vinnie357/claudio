---
name: task-breakdown
description: Activate when breaking down implementation plans into detailed task lists with agent contexts, acceptance criteria, and status tracking
license: MIT
---

# Task Breakdown

Guide for creating detailed task lists and specialized agent contexts from implementation plans, enabling efficient parallel execution with clear acceptance criteria.

## When to Use This Skill

Activate when:
- Breaking down implementation plans into actionable tasks
- Creating specialized agent contexts for task execution
- Defining acceptance criteria and completion requirements
- Establishing task dependencies and priorities
- Setting up status tracking for project progress
- Managing context window efficiency with sub-tasks

## Task Breakdown Process

### Phase 1: Plan Analysis
1. Parse the implementation plan structure
2. Extract phase information and objectives
3. Identify all tasks within each phase
4. Analyze task complexity and relationships

### Phase 2: Task List Generation
1. Create detailed task descriptions
2. Define acceptance criteria for each task
3. Establish priority levels and dependencies
4. Group related tasks for efficient execution

### Phase 3: Context Strategy
- **Simple Phases (≤2 tasks)**: Single phase context
- **Complex Phases (>2 tasks)**: Phase context + individual task contexts
- **Cross-Phase Tasks**: Shared context with references
- **Specialized Tasks**: Domain-specific contexts

## Task Structure

```markdown
## Task: [Task Name]
**ID**: [Phase].[Task Number]
**Priority**: High/Medium/Low
**Complexity**: Simple/Medium/Complex

### Description
[Detailed description of what needs to be implemented]

### Acceptance Criteria
- [ ] [Specific, testable requirement 1]
- [ ] [Specific, testable requirement 2]
- [ ] [Specific, testable requirement 3]

### Dependencies
- **Prerequisite Tasks**: [Tasks that must be completed first]
- **External Dependencies**: [Third-party services, approvals]

### Deliverables
- [Specific code files, configurations]
- [Test cases and validation results]
```

## Task Complexity Levels

- **Simple**: Configuration changes, minor fixes (1-4 hours)
- **Medium**: New components, API endpoints (1-3 days)
- **Complex**: Major features, integrations (1-2 weeks)
- **Epic**: Complete subsystems (2+ weeks) - should be broken into sub-tasks

## Context File Organization

```
project/
├── phase1/
│   ├── claude.md (phase coordination)
│   ├── phase_status.md (phase progress)
│   ├── tasks.md (task list)
│   ├── task1/
│   │   ├── claude.md (task context)
│   │   └── status.md (task progress)
│   └── task2/
│       ├── claude.md (task context)
│       └── status.md (task progress)
├── phase2/
│   └── [similar structure]
└── shared/
    └── utilities/
        └── claude.md (shared context)
```

## Sub-Task Creation Triggers

Create sub-tasks when:
- Context window approaching 80% capacity
- Processing large documentation (>50KB)
- Complex phases with >5 interdependent tasks
- Tasks requiring multiple specialized skills
- Analysis of extensive codebases

## Mandatory File Requirements

Every task directory MUST contain:
1. **claude.md**: Task-specific agent context
2. **status.md**: Task progress tracking

Every phase directory MUST contain:
1. **claude.md**: Phase coordination context
2. **phase_status.md**: Phase progress tracking
3. **tasks.md**: Task list for the phase

## Key Principles

- **Actionability**: Each task must have clear, executable steps
- **Measurability**: Every task has testable acceptance criteria
- **Dependency Clarity**: All prerequisites clearly identified
- **Context Efficiency**: Match context size to task complexity
- **Status Integration**: Progress tracked in status files
- **No Empty Directories**: Always populate with required files
