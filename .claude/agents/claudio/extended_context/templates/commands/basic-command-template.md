# Basic Command Template

This template provides a simple single-agent command pattern for straightforward operations.

## Template Structure

```markdown
---
description: "{COMMAND_DESCRIPTION}"
argument-hint: "{ARGUMENT_HINT}"
---

{COMMAND_PURPOSE_STATEMENT}

**Operation**: {OPERATION_DESCRIPTION}
**Agent Used**: {AGENT_NAME}
**Expected Output**: {OUTPUT_DESCRIPTION}

**Usage:**
- `/{COMMAND_NAME}` - {DEFAULT_USAGE}
- `/{COMMAND_NAME} {EXAMPLE_ARG}` - {EXAMPLE_USAGE}

Use Task tool with subagent_type: "{AGENT_NAME}" to {AGENT_ACTION} with the provided arguments.

**Context Integration**: Uses `.claude/agents/claudio/extended_context/{CONTEXT_CATEGORY}/{CONTEXT_TOPIC}/` for {CONTEXT_PURPOSE}.
```

## Variable Reference

- `{COMMAND_NAME}` - The slash command name (without /claudio: prefix)
- `{COMMAND_DESCRIPTION}` - Brief description for frontmatter
- `{ARGUMENT_HINT}` - Parameter format hint for users
- `{COMMAND_PURPOSE_STATEMENT}` - Opening sentence explaining what the command does
- `{OPERATION_DESCRIPTION}` - What operation this command performs
- `{AGENT_NAME}` - The agent that handles this command (lowercase-hyphen format)
- `{OUTPUT_DESCRIPTION}` - What the user can expect as output
- `{DEFAULT_USAGE}` - How to use the command with no arguments
- `{EXAMPLE_ARG}` - Example argument value
- `{EXAMPLE_USAGE}` - How to use the command with arguments
- `{AGENT_ACTION}` - What action the agent performs
- `{CONTEXT_CATEGORY}` - Extended context category (workflow, development, etc.)
- `{CONTEXT_TOPIC}` - Extended context topic within category
- `{CONTEXT_PURPOSE}` - Why this context is relevant

## Example Usage

**Security Scan Command:**
```markdown
---
description: "Analyze project for security vulnerabilities and generate report"
argument-hint: "[--format <json|html|md>]"
---

Scan the current project for security vulnerabilities using specialized security analysis.

**Operation**: Comprehensive security vulnerability detection
**Agent Used**: vulnerability-assessment-specialist
**Expected Output**: Detailed security report with findings and recommendations

**Usage:**
- `/security-scan` - Generate security report in default format
- `/security-scan --format json` - Generate JSON format security report

Use Task tool with subagent_type: "vulnerability-assessment-specialist" to analyze the project for security issues with the specified output format.

**Context Integration**: Uses `.claude/agents/claudio/extended_context/security/vulnerability-patterns/` for security analysis patterns and best practices.
```

## When to Use This Template

- Single-responsibility commands
- Straightforward user interactions
- Commands that map directly to one agent capability
- Simple parameter passing requirements
- Clear input/output relationships

## Pattern Benefits

- **Simplicity**: Easy to understand and maintain
- **Clarity**: Clear responsibility boundaries
- **Testability**: Simple to test and validate
- **Performance**: Minimal overhead and complexity
- **Reliability**: Fewer points of failure