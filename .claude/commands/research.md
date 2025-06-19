# Research Command

## Description
Research a topic and generate a specialized agent prompt with examples and troubleshooting steps.

## Usage
```
/research <category> <topic>
```

## Parameters
- `category`: The folder path where the research will be saved (e.g., "development", "devops", "databases")
- `topic`: The specific topic to research, used as the filename (e.g., "docker-nodejs", "postgresql-optimization")

## Context
Use the research agent prompt template from `prompts/research/claude.md` to guide your research process.

## Instructions
1. **Direct Command**: Save to `research/<category>/<topic>.md`
2. **Within Claudio**: Save to `<target_project>/.claudio/research/<category>/<topic>.md`
3. Research the specified topic thoroughly using available tools
4. Generate a comprehensive agent prompt following the template structure
5. Update summary documents when running within Claudio workflow

## Example
```
/research development docker-nodejs
```
This would create `research/development/docker-nodejs.md` with a specialized Docker + Node.js expert agent prompt.

When run as part of Claudio workflow, saves to `<target_project>/.claudio/research/development/docker-nodejs.md`

## Expected Output Structure
The generated file should contain:
- Role definition for the specialized agent
- Knowledge base from research
- Specific examples and code snippets
- Comprehensive troubleshooting guide
- Tools and resources list