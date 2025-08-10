# Claudio Usage Guide

[← Back to Main Documentation](../CLAUDE.md)

## Purpose
This guide provides comprehensive command reference, workflow examples, and practical usage patterns for the Claudio system. Use this when you need detailed examples and step-by-step workflows.

## Commands Reference

### Core Analysis Commands

#### `/claudio:research` - Create Research Documentation
```bash
# Create comprehensive research documentation
/claudio:research development docker-nodejs      # Creates overview.md + troubleshooting.md
/claudio:research frontend react-hooks           # Advanced React patterns analysis  
/claudio:research backend microservices --complexity=high  # Forces Ultrathink mode
```

**Output Structure:**
- `.claudio/research/<category>/<topic>/overview.md` - Topic analysis and best practices
- `.claudio/research/<category>/<topic>/troubleshooting.md` - Issues, solutions, diagnostic tools

#### `/claudio:discovery` - Analyze Project Structure
```bash
# Analyze a project's structure and capabilities
/claudio:discovery ./my-project
/claudio:discovery ../existing-application
/claudio:discovery /path/to/codebase
```

#### `/claudio:documentation` - Create Project Documentation
```bash
# Generate complete documentation suite
/claudio:documentation full ./my-api

# Generate specific documentation types
/claudio:documentation api ./my-api
/claudio:documentation user ./my-frontend
/claudio:documentation readme ./my-project
```

#### `/claudio:prd` - Generate Product Requirements Documents
```bash
# Create a PRD for a feature
/claudio:prd feature user-authentication
/claudio:prd project e-commerce-platform
/claudio:prd enhancement real-time-notifications
```

#### `/claudio:plan` - Create Implementation Plans
```bash
# Plan implementation with time estimates
/claudio:plan project user-management-system "12 weeks"
/claudio:plan feature real-time-chat "6 weeks"
/claudio:plan enhancement performance-optimization "4 weeks"
```

#### `/claudio:task` - Break Down Plans into Tasks
```bash
# Break down plan into executable tasks
/claudio:task plan/documents/user_auth_implementation_plan.md
/claudio:task plan/documents/real-time-chat_implementation_plan.md
```

#### `/claudio:claude-sdk` - Claude Code Analysis and Development
```bash
# Analyze Claude Code implementations
/claudio:claude-sdk --analyze-commands

# Cross-system evaluation
/claudio:claude-sdk --cross-system

# Create new Claude Code command
/claudio:claude-sdk --create-command migrate "Handle database migrations"

# Analyze existing agent architecture
/claudio:claude-sdk --analyze-agents
```

#### `/claudio:claudio` - Complete Project Analysis Workflow
```bash
# Analyze any project and create complete roadmap
/claudio:claudio ../my-react-app
/claudio:claudio ./existing-project
/claudio:claudio /path/to/codebase
```

## Usage Patterns

### Standalone Commands
Use individual commands for specific, focused tasks:

**Research-Driven Development:**
```bash
# 1. Research the technology stack
/claudio:research backend nodejs-express-mongodb

# 2. Create requirements based on research
/claudio:prd project inventory-management

# 3. Plan implementation
/claudio:plan project inventory-management "16 weeks"

# 4. Break into actionable tasks
/claudio:task plan/documents/inventory-management_implementation_plan.md
```

**Documentation-First Approach:**
```bash
# 1. Analyze existing project
/claudio:discovery ./legacy-system

# 2. Generate comprehensive documentation
/claudio:documentation full ./legacy-system

# 3. Create improvement requirements
/claudio:prd enhancement system-modernization
```

### Comprehensive Claudio Workflow

#### What "use claudio on ../my-project" means
When you say "use claudio on ../my-project", you're requesting:

1. **Execute**: `/claudio:claudio ../my-project`
2. **Expected Result**: A complete `.claudio/` folder created inside `../my-project/`
3. **Deliverables**: 
   - Project discovery and analysis
   - Requirements documentation (PRD)
   - Implementation plan with phases and time estimates
   - Task breakdown with execution contexts
   - Progress tracking system
   - Research topics relevant to the project
   - Documentation templates and guides

**The Complete Process:**
```bash
# Single command that orchestrates everything
/claudio:claudio ../my-project

# This creates ../my-project/.claudio/ with:
# - Complete project analysis
# - Business requirements and success criteria
# - Phased implementation plan with time estimates
# - Task breakdown with specialized agent contexts
# - Progress tracking and status management system
```

## Detailed Workflow Examples

### New Project Analysis
```bash
# Complete analysis of existing project
/claudio:claudio ../existing-app

# Results in ../existing-app/.claudio/ with:
# - Technology stack analysis
# - Improvement recommendations
# - Implementation roadmap
# - Task breakdown with contexts
```

### Feature Development Workflow
```bash
# 1. Research the technology
/claudio:research frontend react-hooks

# 2. Create requirements
/claudio:prd feature real-time-chat

# 3. Plan implementation  
/claudio:plan feature real-time-chat "6 weeks"

# 4. Break into tasks
/claudio:task plan/documents/real-time-chat_implementation_plan.md
```

### Claude Code Development Workflow
```bash
# 1. Analyze existing Claude Code system
/claudio:claude-sdk --cross-system

# 2. Evaluate specific commands
/claudio:claude-sdk --analyze-commands

# 3. Create new command with proper integration
/claudio:claude-sdk --create-command migrate "Handle database migrations"

# Results in detailed analysis reports with:
# - Command quality evaluation
# - Agent architecture assessment  
# - Integration recommendations
# - Best practice identification
```

### Documentation Generation Workflow
```bash
# 1. Analyze project structure
/claudio:discovery ./my-api

# 2. Generate complete documentation suite
/claudio:documentation full ./my-api

# 3. Create specific documentation types
/claudio:documentation api ./my-api
/claudio:documentation user ./my-frontend
```

### Legacy System Modernization
```bash
# 1. Comprehensive analysis
/claudio:claudio ./legacy-system

# 2. Research modern alternatives
/claudio:research architecture microservices-migration

# 3. Plan modernization approach
/claudio:plan project system-modernization "24 weeks"

# 4. Break into manageable phases
/claudio:task plan/documents/system-modernization_implementation_plan.md
```

## Command Output Locations

### Standalone Command Output
- **Research**: `.claudio/research/<category>/<topic>/` directory with `overview.md` + `troubleshooting.md`
- **Discovery**: `discovery/reports/<project_name>_discovery.md`
- **Documentation**: `docs/` directory
- **PRD**: `prd/documents/<project_name>_prd.md`
- **Plan**: `plan/documents/<project_name>_implementation_plan.md`
- **Task**: Current working directory structure
- **Claude SDK**: Analysis reports in current directory

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
    ├── research/               # Topic research documentation
    │   └── <category>/
    │       └── <topic>/        # Research directory
    │           ├── overview.md       # Topic analysis
    │           └── troubleshooting.md  # Issues & solutions
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

## When to Use Each Approach

### Use Standalone Commands When:
- You need specific, focused tasks
- Working on iterative development and refinement
- You want fine-grained control over each step
- Building documentation incrementally
- Researching specific technologies or patterns

### Use Claudio Workflow When:
- You need comprehensive project analysis
- Starting a new project or major feature
- Want complete, integrated documentation
- Need to establish systematic development approach
- Require progress tracking from day one
- Working with teams that need shared context

### Use Claude SDK Commands When:
- Developing or maintaining Claude Code implementations
- Need to evaluate command and agent quality
- Performing cross-system analysis
- Creating new Claude Code commands or agents
- Troubleshooting Claude Code integration issues

## Tips for Effective Usage

1. **Start with Discovery**: Always begin with `/discovery` to understand the current state
2. **Research First**: Use `/research` before implementing new technologies
3. **Document Everything**: Use `/documentation` to maintain up-to-date docs
4. **Plan Thoroughly**: Use `/plan` with realistic time estimates
5. **Break Down Tasks**: Use `/task` to make plans actionable
6. **Track Progress**: Regularly update status files in `.claudio/` directories
7. **Leverage Context**: Reference generated contexts in your development workflow

---

[← Back to Main Documentation](../CLAUDE.md) | [System Architecture →](system-architecture.md)