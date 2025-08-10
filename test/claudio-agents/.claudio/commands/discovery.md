# Discovery Command

## Command
`/claudio:discovery`

## Purpose
Analyzes project structure, capabilities, and technology stack to provide comprehensive project understanding.

## Usage
```
/claudio:discovery [path] [--force]
```

## Arguments
- `path`: Project directory to analyze (defaults to current directory)
- `--force`: Force re-analysis even if discovery already exists

## Agent Reference
Uses `claudio:discovery-agent subagent` to perform analysis

## Output
Creates comprehensive discovery documentation in `.claudio/docs/discovery.md`

## Project-Specific Customizations
- **Phoenix LiveView Detection**: Automatically detects Phoenix framework and LiveView components
- **Elixir Mix Project Analysis**: Understands Mix.Project structure and dependencies
- **Testing Framework Integration**: Recognizes ExUnit, ExCoveralls, and testing patterns
- **Asset Pipeline Detection**: Identifies Tailwind CSS, esbuild configuration
- **Development Tools**: Detects Credo, Dialyxir, and quality tools

## Integration
- Required prerequisite for PRD, planning, and task generation
- Provides context for all subsequent claudio operations
- Used by test command generator for framework-specific test patterns