# Documentation Command

## Command
`/claudio:documentation`

## Purpose
Generates comprehensive documentation for Phoenix LiveView applications including API docs, user guides, and developer documentation.

## Usage
```
/claudio:documentation [type] [--comprehensive] [--api-only]
```

## Arguments
- `type`: Documentation type ("api", "user", "developer", "all")
- `--comprehensive`: Generate complete documentation suite
- `--api-only`: Generate only API and technical documentation

## Agent Reference
Uses `claudio:documentation-coordinator subagent` to orchestrate documentation generation

## Output
Creates comprehensive documentation in `.claudio/docs/` directory

## Phoenix LiveView Specializations
- **API Documentation**: Phoenix module and function documentation
- **Component Documentation**: LiveView component API and usage examples
- **Development Guide**: Phoenix development workflow and best practices
- **User Guide**: Application usage and feature documentation
- **Deployment Guide**: Phoenix production deployment and configuration

## Integration
- **Discovery Context**: Uses project analysis for accurate documentation
- **Component Analysis**: Documents existing TaskApp components and patterns
- **Testing Documentation**: Includes ExUnit testing patterns and examples
- **Quality Documentation**: Documents Credo and Dialyxir configuration and standards