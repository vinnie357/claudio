# Claudio Workflow System - Extended Context and Templates

This document provides comprehensive templates, patterns, and guidance for the Claudio workflow system. It serves as extended context for claudio sub-agents and contains reference information for coordinating complete project analysis and planning workflows.

## Claudio Workflow Overview

The Claudio workflow system orchestrates comprehensive project analysis and planning through coordinated execution of specialized sub-agents. It transforms any codebase into an organized, trackable development process with parallel workflow execution for efficiency.

## Core Workflow Components

### 1. Project Discovery Analysis
**Purpose**: Comprehensive project structure and technology analysis
**Agent**: `claudio-discovery-orchestrator`
**Output**: `discovery.md` - Complete project analysis report
**Focus Areas**:
- Technology stack identification and assessment
- Architecture pattern recognition
- Development workflow analysis
- MCP recommendations for enhancement

### 2. Requirements Definition
**Purpose**: Transform technical findings into business requirements
**Agent**: `claudio-prd-orchestrator`
**Output**: `prd.md` - Product Requirements Document
**Focus Areas**:
- Business objectives and success criteria
- Functional and non-functional requirements
- Stakeholder needs and user personas
- Success metrics and KPIs

### 3. Implementation Planning
**Purpose**: Create detailed, actionable implementation roadmap
**Agent**: `claudio-plan-orchestrator`
**Output**: `plan.md` - Comprehensive implementation plan
**Focus Areas**:
- Phase breakdown with realistic timelines
- Resource allocation and team composition
- Risk assessment and mitigation strategies
- Milestone definitions and success criteria

### 4. Task Organization
**Purpose**: Break down plan into executable task structure
**Agent**: `claudio-task-orchestrator`
**Output**: Phase directories with specialized contexts
**Focus Areas**:
- Task breakdown and dependency mapping
- Specialized agent context creation
- Progress tracking system setup
- Cross-phase coordination mechanisms

### 5. Structure Creation
**Purpose**: Finalize complete project structure and documentation
**Agent**: `claudio-structure-creator`
**Output**: Complete `.claudio/` folder with summary
**Focus Areas**:
- Executive summary generation
- Master status tracking setup
- Navigation and cross-reference verification
- Final documentation completion

## Workflow Execution Patterns

### Sequential Dependency Chain
The Claudio workflow follows a sequential dependency pattern where each phase builds upon the previous:

1. **Discovery** → Generates project analysis
2. **PRD** → Uses discovery to create requirements  
3. **Plan** → Uses PRD to create implementation strategy
4. **Tasks** → Uses plan to create executable structure
5. **Structure** → Finalizes complete project organization

### Parallel Execution Opportunities
Within each phase, sub-components can execute in parallel:
- Discovery can analyze different aspects simultaneously
- PRD can develop different requirement categories in parallel
- Planning can assess risks while creating timelines
- Task creation can process multiple phases simultaneously

### Coordination Mechanisms
Each orchestrator agent coordinates with others through:
- **Input Dependencies**: Clear requirements for input documents
- **Output Standards**: Consistent format and content requirements
- **Cross-References**: Proper linking between workflow components
- **Status Tracking**: Progress monitoring and completion verification

### Phase 6: Project Structure Creation
1. Create comprehensive `.claudio/` folder structure
2. Organize all artifacts and documentation
3. Create initial status.md files for project, phases, and tasks using provided templates
4. Establish progress tracking systems
5. Set up task execution contexts

## Claudio Folder Structure:

```
target_project/
└── .claudio/
    ├── summary.md                 # Executive summary of entire analysis
    ├── discovery.md               # Complete discovery report
    ├── prd.md                     # Product Requirements Document
    ├── plan.md                    # Implementation plan
    ├── status.md                  # Overall project status and progress
    ├── research/                  # Research topics organized by category
    │   ├── category1/
    │   │   └── topic1.md         # Specialized research prompts
    │   └── category2/
    │       └── topic2.md
    ├── docs/                      # Generated documentation
    │   ├── readme.md
    │   ├── api.md
    │   └── user_guide.md
    ├── design/                    # Design specifications and analysis
    │   ├── audit.md              # Design system audit
    │   ├── system.md             # Design system specifications
    │   └── components.md         # Component library documentation
    ├── phase1/
    │   ├── tasks.md              # Task list for phase 1
    │   ├── task1/
    │   │   ├── claude.md         # Task-specific agent context
    │   │   └── status.md         # Task status and progress
    │   ├── task2/
    │   │   ├── claude.md         # Task-specific agent context
    │   │   └── status.md         # Task status and progress
    │   └── phase_status.md       # Phase-level progress tracking
    ├── phase2/
    │   ├── tasks.md              # Task list for phase 2
    │   ├── [task directories]    # Individual task contexts
    │   └── phase_status.md       # Phase-level progress tracking
    ├── phase3/
    │   └── [similar structure]
    └── shared/
        ├── standards/
        │   └── claude.md         # Project coding standards
        ├── utilities/
        │   └── claude.md         # Shared utilities context
        └── resources/
            └── claude.md         # Additional resources and references
```

## Document Templates:

### Summary.md Template
```markdown
# Project Analysis Summary

## Project Overview
- **Project Name**: [Extracted from target path]
- **Analysis Date**: [Current date]
- **Project Type**: [Identified type]
- **Technology Stack**: [Primary technologies]

## Key Findings
### Current State
- [Major capabilities and features]
- [Technology stack and dependencies]
- [Architecture and design patterns]

### Improvement Opportunities
- [Areas for enhancement]
- [Technical debt and optimization opportunities]
- [Missing features or capabilities]

## Implementation Roadmap
### Phase Summary
- **Phase 1**: [Brief description and timeline]
- **Phase 2**: [Brief description and timeline]
- **Phase 3**: [Brief description and timeline]

### Total Timeline: [X weeks/months]
### Resource Requirements: [Team size and skills]

## Next Steps
1. [Immediate action items]
2. [Phase 1 preparation tasks]
3. [Resource allocation decisions]

## Quick Links
- [Discovery Report](./discovery.md)
- [Requirements Document](./prd.md)
- [Implementation Plan](./plan.md)
- [Project Status](./status.md)

## Research Topics
[Link to relevant research files in ./research/ organized by category]

## Documentation
- [README](./docs/readme.md)
- [API Documentation](./docs/api.md)
- [User Guide](./docs/user_guide.md)
```

### Status.md Template
```markdown
# Project Status Dashboard

**Last Updated**: [Date and time]
**Overall Progress**: [X]% Complete

## Phase Progress Overview
| Phase | Tasks | Completed | In Progress | Not Started | Progress |
|-------|--------|-----------|-------------|-------------|----------|
| Phase 1 | [N] | [N] | [N] | [N] | [X]% |
| Phase 2 | [N] | [N] | [N] | [N] | [X]% |
| Phase 3 | [N] | [N] | [N] | [N] | [X]% |

## Current Focus
**Active Phase**: [Current phase]
**Active Tasks**: [List of in-progress tasks]
**Next Milestone**: [Upcoming milestone and date]

## Recent Updates
- [Date]: [Update description]
- [Date]: [Update description]
- [Date]: [Update description]

## Blockers and Issues
- [Blocker description and impact]
- [Issue description and priority]

## Upcoming Milestones
- [Date]: [Milestone description]
- [Date]: [Milestone description]

## Resource Status
- **Team Availability**: [Current capacity]
- **Dependencies**: [External dependency status]
- **Risk Factors**: [Current risks and mitigation status]
```

### Task Status.md Template
```markdown
# Task Status: [Task Name]

**Task ID**: [Phase].[Task Number]
**Status**: Not Started | In Progress | Completed | Blocked
**Priority**: High | Medium | Low
**Assigned**: [Team member or role]

## Progress Summary
**Started**: [Date]
**Last Updated**: [Date]
**Estimated Completion**: [Date]
**Actual Completion**: [Date if completed]

## Completion Checklist
- [ ] [Acceptance criterion 1]
- [ ] [Acceptance criterion 2]
- [ ] [Acceptance criterion 3]
- [ ] [Testing completed]
- [ ] [Code reviewed]
- [ ] [Documentation updated]

## Work Log
- [Date]: [Work performed and time spent]
- [Date]: [Work performed and time spent]
- [Date]: [Work performed and time spent]

## Issues and Blockers
- [Issue description and resolution status]
- [Blocker description and estimated resolution]

## Dependencies
- **Waiting On**: [Other tasks or external factors]
- **Blocking**: [Tasks that depend on this one]

## Notes
[Additional context, decisions, or important information]
```

## Context Integration:

### Discovery Integration
- Reference `prompts/discovery/claude.md` for project analysis methodology
- Apply discovery templates and analysis frameworks
- Generate comprehensive technology and capability assessment

### PRD Integration
- Use `prompts/prd/claude.md` context for requirements generation
- Transform discovery insights into actionable requirements
- Create measurable success criteria and objectives

### Plan Integration
- Apply `prompts/plan/claude.md` context for implementation planning
- Convert requirements into phased execution plan
- Include realistic time estimates and resource allocation

### Task Integration
- Use `prompts/task/claude.md` context for task breakdown and organization
- Create appropriate agent contexts based on phase complexity
- Establish proper task dependencies and execution order

### Design Integration
- Reference `prompts/design/claude.md` for UX/UI analysis and specifications
- Apply design system audit and component library creation processes
- Generate comprehensive design standards and accessibility requirements
- Coordinate design requirements with implementation planning

## Response Guidelines:
1. **Comprehensive Analysis**: Always start with thorough project discovery
2. **Structured Output**: Create organized, navigable documentation
3. **Progress Tracking**: Establish clear status monitoring systems
4. **Context Preservation**: Maintain consistency across all generated documents
5. **Actionable Results**: Ensure all outputs lead to implementable tasks
6. **Update Management**: Support incremental updates and status tracking
7. **Cross-Reference**: Link related documents and contexts appropriately

## Execution Workflow:
1. **Input Processing**: Analyze target project path and existing `.claudio/` folder
2. **Discovery Execution**: Run comprehensive project discovery
3. **Requirements Generation**: Create PRD based on discovery findings
4. **Plan Creation**: Generate implementation plan from requirements
5. **Task Organization**: Break down plan into executable tasks with contexts
6. **Structure Creation**: Build complete `.claudio/` folder with all artifacts
7. **Status Initialization**: Create ALL initial status.md files using provided templates
8. **File Validation**: Ensure every task directory contains both claude.md and status.md files

## MANDATORY FILE CREATION REQUIREMENTS:
**CRITICAL**: When creating the .claudio/ structure, you MUST ensure:

1. **Every task directory** contains BOTH files:
   - `claude.md`: Task-specific agent context (REQUIRED)
   - `status.md`: Initial task status using the provided template (REQUIRED)

2. **Every phase directory** contains ALL files:
   - `claude.md`: Phase coordination context (REQUIRED) 
   - `phase_status.md`: Phase-level progress tracking (REQUIRED)
   - `tasks.md`: Task list for the phase (REQUIRED)

3. **NO EMPTY DIRECTORIES**: Never create empty task or phase directories

4. **Project-level status**: Create initial `status.md` in the root .claudio/ directory

When running Claudio analysis, focus on creating a complete, actionable project roadmap that teams can immediately begin executing. Every generated artifact should serve a specific purpose in the implementation process, and every directory must be fully populated with the required files.

## Command Processing Instructions:

### Parameters
- `target_project_path`: Path to the project directory to analyze (e.g., `../mycode`, `./my-project`)

### Workflow Process

#### Phase 1: Project Discovery
1. Analyze target project structure, code, and documentation
2. Apply discovery agent context to identify:
   - Technology stack and dependencies
   - Current capabilities and architecture
   - Development tools and workflows
   - Recommended MCPs and improvements
3. Generate comprehensive `discovery.md` report

#### Phase 2: Requirements Definition
1. Use discovery report as input to PRD generation
2. Apply PRD agent context to create:
   - Business objectives and user needs
   - Functional and non-functional requirements
   - Success criteria and KPIs
   - Technical specifications
3. Generate comprehensive `prd.md` document

#### Phase 3: Implementation Planning
1. Transform PRD into detailed implementation plan
2. Apply plan agent context to create:
   - Phase breakdown with time estimates
   - Resource allocation and dependencies
   - Risk assessment and mitigation
   - Milestone definitions
3. Generate comprehensive `plan.md` document

#### Phase 4: Task Organization
1. Process implementation plan through task agent
2. Apply task agent context to create:
   - Phase-specific directories and task lists
   - Individual task contexts for complex phases
   - Progress tracking and status management
   - Cross-phase coordination mechanisms

#### Phase 5: Structure Creation
1. Create or update `.claudio/` folder in target project
2. Generate all documentation and tracking files
3. Initialize status tracking systems
4. Set up task execution contexts

### Generated Structure
```
target_project/
└── .claudio/
    ├── summary.md              # Executive summary
    ├── discovery.md            # Project discovery report
    ├── prd.md                  # Product Requirements Document
    ├── plan.md                 # Implementation plan
    ├── status.md               # Overall progress tracking
    ├── phase1/
    │   ├── tasks.md           # Phase task list
    │   ├── task1/
    │   │   ├── claude.md      # Task-specific agent context
    │   │   └── status.md      # Task progress tracking
    │   ├── task2/
    │   │   ├── claude.md      # Task-specific agent context
    │   │   └── status.md      # Task progress tracking
    │   └── phase_status.md    # Phase progress tracking
    ├── phase2/
    │   └── [similar structure]
    ├── phase3/
    │   └── [similar structure]
    └── shared/
        ├── standards/
        │   └── claude.md      # Project coding standards
        ├── utilities/
        │   └── claude.md      # Shared utilities context
        └── resources/
            └── claude.md      # Additional resources
```

### Key Documents Generated

#### Core Analysis Documents
- **summary.md**: Executive overview of entire analysis
- **discovery.md**: Technology stack, capabilities, and recommendations
- **prd.md**: Complete requirements with success criteria
- **plan.md**: Phased implementation plan with timelines

#### Progress Tracking
- **status.md**: Overall project progress dashboard
- **phase_status.md**: Phase-level progress tracking
- **task/status.md**: Individual task progress tracking

#### Agent Contexts
- **task/claude.md**: Specialized contexts for task execution
- **shared/*/claude.md**: Common utilities and standards

### Update Behavior
- **First Run**: Creates complete `.claudio/` structure
- **Subsequent Runs**: Updates existing analysis and preserves progress
- **Status Preservation**: Maintains task completion status across updates
- **Incremental Updates**: Only regenerates changed components

### Example Usage
```
/claudio ../my-react-app
```
This would:
1. Analyze the React application in `../my-react-app`
2. Generate complete discovery, requirements, and implementation plan
3. Create organized task structure with specialized contexts
4. Set up progress tracking in `../my-react-app/.claudio/`

### Expected Outputs
- Complete project analysis and roadmap
- Actionable implementation plan with time estimates
- Organized task structure with specialized agent contexts
- Comprehensive progress tracking system
- Ready-to-execute project roadmap

### Integration Benefits
- **Discovery-Driven**: Analysis starts with comprehensive project understanding
- **Requirements-Based**: All work flows from clear, documented requirements
- **Plan-Structured**: Implementation follows logical, time-estimated phases
- **Task-Organized**: Work is broken into manageable, trackable units
- **Progress-Visible**: Status tracking at project, phase, and task levels