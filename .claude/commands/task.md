# Task Command

## Description
Create detailed task lists and specialized agent contexts for project implementation phases. Takes an implementation plan as input and generates phase-specific and task-specific agent contexts.

## Usage
```
/task <plan_file_path> [project_name]
```

## Parameters
- `plan_file_path`: Path to the implementation plan file to process
- `project_name`: Optional project name (defaults to extracting from plan file)

## Context
Use the task agent prompt from `prompts/task/claude.md` to guide your task breakdown and context creation process.

## Instructions
1. Analyze the provided implementation plan
2. Extract phases and their associated tasks
3. Create detailed task lists for each phase
4. Generate appropriate agent contexts based on complexity:
   - **Simple phases (≤2 tasks)**: Single `phase*/claude.md`
   - **Complex phases (>2 tasks)**: Phase context + individual task contexts
5. Establish proper context referencing and dependencies
6. **Direct Command**: Create directory structure in current working directory
7. **Within Claudio**: Create structure in `<target_project>/.claudio/phases/`

## Context Creation Strategy

### Phase Context Files (`phase*/claude.md`)
- Coordinate all tasks within the phase
- Maintain phase-level objectives and deliverables
- Reference individual task contexts when needed
- Handle cross-task dependencies and communication

### Individual Task Contexts (`phase*/task*/claude.md`)
- Focus on single task completion
- Include specific acceptance criteria and requirements
- Reference phase context for broader coordination
- Minimize context to essential information only

### Shared Contexts (`shared/*/claude.md`)
- Common utilities and standards
- Cross-phase resources and guidelines
- Reusable components and patterns

## Task Breakdown Rules

### Task Complexity Assessment
- **Simple Tasks**: Configuration, minor fixes, documentation updates
- **Medium Tasks**: Feature components, API endpoints, database changes
- **Complex Tasks**: Major features, system integrations, architectural changes

### Context Creation Rules
- **≤2 tasks per phase**: Single phase context file
- **>2 tasks per phase**: Phase context + individual task contexts
- **Cross-cutting concerns**: Shared context files
- **Specialized domains**: Domain-specific agent contexts

## Expected Directory Structure
```
project_name/
├── phase1/
│   ├── claude.md (phase coordination)
│   ├── task1/
│   │   └── claude.md (if >2 tasks in phase)
│   └── task2/
│       └── claude.md (if >2 tasks in phase)
├── phase2/
│   ├── claude.md (phase coordination)
│   └── [additional task contexts as needed]
├── phase3/
│   └── claude.md (simple phase with ≤2 tasks)
└── shared/
    ├── utilities/
    │   └── claude.md (shared utilities)
    └── standards/
        └── claude.md (coding standards)
```

## Task List Components
Each task includes:
- **Description**: Clear, actionable task description
- **Acceptance Criteria**: Specific, testable requirements
- **Dependencies**: Prerequisites and blocking factors
- **Effort Estimate**: Time and complexity assessment
- **Priority Level**: High/Medium/Low classification
- **Required Skills**: Technical expertise needed
- **Deliverables**: Expected outputs and artifacts

## Example
```
/task plan/documents/user_auth_implementation_plan.md user-authentication
```
This would analyze the user authentication implementation plan and create:
- Phase-specific directories and contexts
- Individual task contexts for complex phases
- Proper context referencing and dependencies
- Complete task breakdown with acceptance criteria

## Expected Output
- Structured directory hierarchy for phases and tasks
- Specialized agent contexts for each phase and complex tasks
- Clear task lists with priorities and dependencies
- Context referencing system for coordination
- Quality gates and completion criteria for all tasks