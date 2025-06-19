# Claudio Command

## Description
Comprehensive project analysis and planning system that orchestrates discovery, requirements, planning, and task organization for any codebase. Creates a complete `.claudio/` folder with full project roadmap.

## Usage
```
/claudio <target_project_path>
```

## Parameters
- `target_project_path`: Path to the project directory to analyze (e.g., `../mycode`, `./my-project`)

## Context
Use the Claudio agent prompt from `prompts/claudio/claude.md` to orchestrate the complete analysis workflow, integrating contexts from:
- `prompts/discovery/claude.md` for project analysis
- `prompts/prd/claude.md` for requirements generation  
- `prompts/plan/claude.md` for implementation planning
- `prompts/task/claude.md` for task organization

## Workflow Process

### Phase 1: Project Discovery
1. Analyze target project structure, code, and documentation
2. Apply discovery agent context to identify:
   - Technology stack and dependencies
   - Current capabilities and architecture
   - Development tools and workflows
   - Recommended MCPs and improvements
3. Generate comprehensive `discovery.md` report

### Phase 2: Requirements Definition
1. Use discovery report as input to PRD generation
2. Apply PRD agent context to create:
   - Business objectives and user needs
   - Functional and non-functional requirements
   - Success criteria and KPIs
   - Technical specifications
3. Generate comprehensive `prd.md` document

### Phase 3: Implementation Planning
1. Transform PRD into detailed implementation plan
2. Apply plan agent context to create:
   - Phase breakdown with time estimates
   - Resource allocation and dependencies
   - Risk assessment and mitigation
   - Milestone definitions
3. Generate comprehensive `plan.md` document

### Phase 4: Task Organization
1. Process implementation plan through task agent
2. Apply task agent context to create:
   - Phase-specific directories and task lists
   - Individual task contexts for complex phases
   - Progress tracking and status management
   - Cross-phase coordination mechanisms

### Phase 5: Structure Creation
1. Create or update `.claudio/` folder in target project
2. Generate all documentation and tracking files
3. Initialize status tracking systems
4. Set up task execution contexts

## Generated Structure
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

## Key Documents Generated

### Core Analysis Documents
- **summary.md**: Executive overview of entire analysis
- **discovery.md**: Technology stack, capabilities, and recommendations
- **prd.md**: Complete requirements with success criteria
- **plan.md**: Phased implementation plan with timelines

### Progress Tracking
- **status.md**: Overall project progress dashboard
- **phase_status.md**: Phase-level progress tracking
- **task/status.md**: Individual task progress tracking

### Agent Contexts
- **task/claude.md**: Specialized contexts for task execution
- **shared/*/claude.md**: Common utilities and standards

## Update Behavior
- **First Run**: Creates complete `.claudio/` structure
- **Subsequent Runs**: Updates existing analysis and preserves progress
- **Status Preservation**: Maintains task completion status across updates
- **Incremental Updates**: Only regenerates changed components

## Example
```
/claudio ../my-react-app
```
This would:
1. Analyze the React application in `../my-react-app`
2. Generate complete discovery, requirements, and implementation plan
3. Create organized task structure with specialized contexts
4. Set up progress tracking in `../my-react-app/.claudio/`

## Expected Outputs
- Complete project analysis and roadmap
- Actionable implementation plan with time estimates
- Organized task structure with specialized agent contexts
- Comprehensive progress tracking system
- Ready-to-execute project roadmap

## Integration Benefits
- **Discovery-Driven**: Analysis starts with comprehensive project understanding
- **Requirements-Based**: All work flows from clear, documented requirements
- **Plan-Structured**: Implementation follows logical, time-estimated phases
- **Task-Organized**: Work is broken into manageable, trackable units
- **Progress-Visible**: Status tracking at project, phase, and task levels

Use Claudio when you need a complete project analysis and implementation roadmap that transforms any codebase into an organized, trackable development process.