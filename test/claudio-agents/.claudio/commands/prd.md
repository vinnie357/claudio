# PRD Command

## Command
`/claudio:prd`

## Purpose
Generates Product Requirements Document (PRD) for Phoenix LiveView features and applications based on discovery analysis.

## Usage
```
/claudio:prd [feature_name] [additional_context] [--update]
```

## Arguments
- `feature_name`: Name of the feature or requirement to document
- `additional_context`: Additional context or requirements
- `--update`: Update existing PRD with new requirements

## Agent Reference
Uses `claudio:prd-agent subagent` to generate requirements documentation

## Output
Creates detailed PRD documentation in `.claudio/docs/prd.md`

## Phoenix LiveView Specializations
- **Real-time Features**: Requirements for LiveView real-time capabilities
- **Component Architecture**: Requirements for Phoenix.Component systems
- **State Management**: LiveView state and event handling requirements
- **UI/UX Patterns**: Tailwind CSS and component design requirements
- **Testing Requirements**: ExUnit and integration testing specifications

## Integration
- **Discovery Dependency**: Requires completed discovery analysis
- **Planning Input**: Provides requirements foundation for implementation planning
- **Task Context**: Informs task breakdown with specific requirements
- **Quality Standards**: Defines acceptance criteria for Phoenix development