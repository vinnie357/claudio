# Discovery Command

## Description
Analyze a project to identify tools, requirements, and suggest relevant MCPs for enhanced development workflow.

## Usage
```
/discovery [directory_path]
```

## Parameters
- `directory_path`: Optional path to the project directory to analyze (defaults to current directory)

## Context
Use the project discovery agent prompt from `prompts/discovery/claude.md` to guide your analysis process.

## Instructions
1. Systematically analyze the project structure and files
2. Identify technology stack, dependencies, and development tools
3. Detect configuration files and environment requirements
4. Recommend relevant MCPs based on discovered tools and services
5. Generate a comprehensive discovery report
6. **Direct Command**: Save to `discovery/reports/<project_name>_discovery.md`
7. **Within Claudio**: Save to `<target_project>/.claudio/discovery.md`

## Analysis Focus Areas
- **Project Structure**: Directory layout, main files, conventions
- **Technology Stack**: Languages, frameworks, runtime versions
- **Dependencies**: Package files, version constraints, security concerns
- **Development Tools**: Build systems, testing frameworks, linting tools
- **Configuration**: Environment variables, config files, deployment setup
- **MCP Recommendations**: Suggest MCPs that enhance the discovered workflow

## Example
```
/discovery ./my-project
```
This would analyze `./my-project` and create a discovery report with tool identification and MCP recommendations.

## Expected Output
- Comprehensive project analysis report
- Technology stack identification
- Development workflow documentation
- Specific MCP recommendations with installation instructions
- Setup and troubleshooting guidance