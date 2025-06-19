# Claudio System Documentation

Claudio is a comprehensive project analysis and planning system that transforms any codebase into an organized, trackable development process. This system orchestrates discovery, requirements, planning, and task organization through specialized AI agents.

## System Overview

Claudio provides both individual commands for specific tasks and a comprehensive workflow that creates complete project roadmaps. The system consists of specialized agent prompts and corresponding commands that work together to analyze projects and generate actionable implementation plans.

## Core Components

### Agent Prompts (`prompts/`)
Specialized AI agent contexts that define expertise and behavior:

- **`prompts/research/claude.md`**: Research agent for topic-specific expert prompts
- **`prompts/discovery/claude.md`**: Project discovery and technology analysis
- **`prompts/documentation/claude.md`**: Documentation generation and standards
- **`prompts/prd/claude.md`**: Product Requirements Document creation
- **`prompts/plan/claude.md`**: Implementation planning with time estimates
- **`prompts/task/claude.md`**: Task breakdown and context creation
- **`prompts/claudio/claude.md`**: Master orchestration agent

### Commands (`.claude/commands/`)
Executable commands that leverage the agent prompts:

- **`/research`**: Generate specialized research on topics
- **`/discovery`**: Analyze project structure and capabilities
- **`/documentation`**: Create comprehensive project documentation
- **`/prd`**: Generate Product Requirements Documents
- **`/plan`**: Create detailed implementation plans
- **`/task`**: Break down plans into executable tasks
- **`/claudio`**: Complete project analysis workflow

## Usage Patterns

### Standalone Commands
Commands can be used individually for specific tasks:

```bash
# Research a specific topic
/research development docker-nodejs

# Analyze a project's structure
/discovery ./my-project

# Generate documentation
/documentation readme ./my-project

# Create a PRD for a feature
/prd feature user-authentication

# Plan implementation
/plan project user-management-system "12 weeks"

# Break down plan into tasks
/task plan/documents/user_auth_implementation_plan.md
```

### Comprehensive Claudio Workflow
The master command orchestrates all agents for complete analysis:

```bash
# Analyze any project and create complete roadmap
/claudio ../my-react-app
```

**What this means**: When a user says "use claudio on ../my-project", they want you to:

1. **Analyze the target project** at the specified path (../my-project)
2. **Run the complete Claudio workflow** using the `/claudio` command
3. **Generate a comprehensive `.claudio/` folder** inside the target project
4. **Create actionable project roadmap** with discovery, requirements, planning, and tasks

This creates a `.claudio/` folder inside the target project with:
- Complete project analysis and technology assessment
- Business requirements and success criteria
- Phased implementation plan with time estimates
- Task breakdown with specialized agent contexts
- Progress tracking and status management system

## Output Locations

### Standalone Command Output
- **Research**: `research/<category>/<topic>.md`
- **Discovery**: `discovery/reports/<project_name>_discovery.md`
- **Documentation**: `docs/` directory
- **PRD**: `prd/documents/<project_name>_prd.md`
- **Plan**: `plan/documents/<project_name>_implementation_plan.md`
- **Task**: Current working directory structure

### Claudio Workflow Output
All outputs are organized in the target project's `.claudio/` folder:

```
target_project/
└── .claudio/
    ├── summary.md              # Executive overview
    ├── discovery.md            # Technology analysis
    ├── prd.md                  # Requirements document
    ├── plan.md                 # Implementation plan
    ├── status.md               # Progress tracking
    ├── research/               # Topic research
    │   └── <category>/
    │       └── <topic>.md
    ├── docs/                   # Generated documentation
    │   ├── readme.md
    │   ├── api.md
    │   └── user_guide.md
    ├── phase1/                 # Implementation phases
    │   ├── tasks.md
    │   ├── task1/
    │   │   ├── claude.md      # Task-specific context
    │   │   └── status.md      # Task progress
    │   └── phase_status.md
    └── shared/                 # Common resources
        ├── standards/
        └── utilities/
```

## Agent Integration

### Context References
Agents reference each other's contexts when needed:

- **PRD Agent** can reference `prompts/documentation/claude.md` for documentation standards
- **Claudio Agent** orchestrates all other agents through their prompt contexts
- **Task Agent** creates specialized contexts that reference phase-level coordination

### Data Flow
1. **Discovery** → analyzes project structure and capabilities
2. **PRD** → transforms discovery into requirements (uses discovery output)
3. **Plan** → converts requirements into implementation plan (uses PRD output)
4. **Task** → breaks plan into executable tasks (uses plan output)
5. **Documentation** → can be generated at any stage based on project analysis

## Specialized Features

### Research System
- Generates topic-specific expert agent prompts
- Organizes research by category and topic
- Integrates with Claudio workflow for project-specific research
- Creates specialized troubleshooting and example content

### Progress Tracking
- Project-level status dashboard
- Phase-level progress monitoring
- Individual task status tracking
- Milestone and dependency management

### Context Management
- **Simple phases (≤2 tasks)**: Single phase context
- **Complex phases (>2 tasks)**: Phase context + individual task contexts
- **Shared resources**: Common utilities and standards
- **Cross-references**: Proper linking between contexts

## Example Workflows

### New Project Analysis
```bash
# Complete analysis of existing project
/claudio ../existing-app

# Results in ../existing-app/.claudio/ with:
# - Technology stack analysis
# - Improvement recommendations
# - Implementation roadmap
# - Task breakdown with contexts
```

### Understanding User Intent
When a user says **"use claudio on ../my-project"**, they are requesting:

1. **Execute**: `/claudio ../my-project`
2. **Expected Result**: A complete `.claudio/` folder created inside `../my-project/`
3. **Deliverables**: 
   - Project discovery and analysis
   - Requirements documentation (PRD)
   - Implementation plan with phases and time estimates
   - Task breakdown with execution contexts
   - Progress tracking system
   - Research topics relevant to the project
   - Documentation templates and guides

The user wants a **comprehensive project transformation** from an existing codebase into an organized, trackable development process with clear next steps.

### Feature Development
```bash
# Research the technology
/research frontend react-hooks

# Create requirements
/prd feature real-time-chat

# Plan implementation  
/plan feature real-time-chat "6 weeks"

# Break into tasks
/task plan/documents/real-time-chat_implementation_plan.md
```

### Documentation Generation
```bash
# Generate complete documentation suite
/documentation full ./my-api

# Or specific documentation types
/documentation api ./my-api
/documentation user ./my-frontend
```

## Best Practices

### Using Individual Commands
- Use for specific, focused tasks
- Good for iterative development and refinement
- Allows fine-grained control over each step

### Using Claudio Workflow
- Use for comprehensive project analysis
- Creates complete, integrated documentation
- Establishes systematic development approach
- Provides progress tracking from day one

### Context Management
- Each agent context is self-contained but aware of others
- Reference related contexts when integration is needed
- Maintain consistency across all generated documents

### Progress Tracking
- Update status files regularly during implementation
- Use the established milestone and dependency structure
- Maintain task completion records for project visibility

## Integration with Development Workflow

The Claudio system is designed to integrate with existing development practices:

- **Version Control**: All `.claudio/` content can be committed to git
- **Team Collaboration**: Shared context enables consistent development approach
- **Project Management**: Status tracking provides visibility into progress
- **Documentation**: Generated docs stay synchronized with implementation
- **Quality Assurance**: Task contexts include testing and review requirements

This system transforms ad-hoc development into systematic, trackable, and collaborative project execution.

## Changelog Management

**IMPORTANT**: Always maintain the changelog when working on the Claudio system.

### Changelog Protocol
1. **Check Today's Date**: Look for `changelog/YYYY-MM-DD.md` file for today
2. **If File Exists**: Update the existing changelog with new changes, additions, or modifications
3. **If File Doesn't Exist**: Create a new changelog file for today with the date format `changelog/YYYY-MM-DD.md`
4. **Update Frequency**: Update the changelog for ANY changes to:
   - Agent prompts (`prompts/` directory)
   - Commands (`.claude/commands/` directory)
   - System documentation (`README.md`, `CLAUDE.md`)
   - Project structure or organization
   - New features or bug fixes
   - User experience improvements

### Changelog Structure
Each changelog entry should include:
```markdown
# Changelog - [Month] [Day], [Year]

## Overview
Brief description of the day's work

## [Section Name] (e.g., Agent Prompts, Commands, Documentation)
### [Specific Change/Addition]
- Detailed description of what was changed
- Why the change was made
- Impact on users or system functionality

## Updates During Session
### [Real-time updates as work progresses]
- Live updates as changes are made
- Keep this section current throughout the working session

## Next Steps Identified
- Future improvements or features to implement
```

### Example Update Process
When making any change:
1. Make the change to the relevant files
2. Immediately update today's changelog file
3. Add specific details about what was changed and why
4. Include any user-facing impact or new capabilities

This ensures complete traceability of the Claudio system's evolution and helps users understand what features are available and how they've developed over time.