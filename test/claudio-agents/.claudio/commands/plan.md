# Plan Command

## Command
`/claudio:plan`

## Purpose
Creates detailed implementation plans for Phoenix LiveView features based on PRD requirements and discovery analysis.

## Usage
```
/claudio:plan [feature_name] [timeline] [--detailed]
```

## Arguments
- `feature_name`: Feature to create implementation plan for
- `timeline`: Expected timeline (e.g., "2w", "1m", "3m")
- `--detailed`: Generate detailed technical implementation steps

## Agent Reference
Uses `claudio:plan-agent subagent` to generate implementation planning

## Output
Creates comprehensive implementation plan in `.claudio/docs/plan.md`

## Phoenix LiveView Specializations
- **OTP Architecture**: Plans respecting Elixir OTP application patterns
- **LiveView Implementation**: Detailed LiveView component and state planning
- **Phoenix Patterns**: Implementation aligned with Phoenix conventions
- **Mix Workflow**: Plans integrated with existing Mix aliases and tasks
- **Testing Strategy**: ExUnit and LiveView testing implementation plans

## Integration
- **PRD Dependency**: Requires completed Product Requirements Document
- **Discovery Context**: Uses project analysis for implementation specifics
- **Task Foundation**: Provides detailed plan for task breakdown
- **Quality Planning**: Includes Credo and Dialyxir integration planning