# Task Command

## Command
`/claudio:task`

## Purpose
Breaks down implementation plans into executable tasks for Phoenix LiveView development workflows.

## Usage
```
/claudio:task [phase_name] [--detailed] [--estimates]
```

## Arguments
- `phase_name`: Specific phase or feature to create tasks for
- `--detailed`: Generate detailed task descriptions with technical context
- `--estimates`: Include time estimates and complexity assessments

## Agent Reference
Uses `claudio:task-agent subagent` to generate task breakdown

## Output
Creates executable task breakdown in `.claudio/phase1/`, `.claudio/phase2/`, etc.

## Phoenix LiveView Specializations
- **Mix Integration**: Tasks aligned with existing Mix aliases and workflow
- **ExUnit Testing**: Task breakdown includes comprehensive testing requirements
- **Component Development**: Tasks structured around Phoenix.Component patterns
- **LiveView Implementation**: Tasks optimized for LiveView development cycles
- **Quality Assurance**: Credo and Dialyxir integration throughout task execution

## Integration
- **Plan Dependency**: Requires completed implementation plan
- **Development Workflow**: Tasks integrate with existing Mix and development patterns
- **Testing Framework**: Tasks include ExUnit and LiveView testing requirements
- **Quality Gates**: Each task includes quality assurance checkpoints