# Conditional Command Template

This template provides context-aware command patterns that adapt behavior based on project characteristics or user parameters.

## Template Structure

```markdown
---
description: "{COMMAND_DESCRIPTION}"
argument-hint: "{ARGUMENT_HINT}"
---

{COMMAND_PURPOSE_STATEMENT}

This command adapts its behavior based on {CONTEXT_FACTORS}.

**Conditional Logic:**
{CONDITIONAL_LOGIC_DESCRIPTION}

**Supported Contexts:**
{SUPPORTED_CONTEXTS}

**Usage:**
- `/{COMMAND_NAME}` - {DEFAULT_USAGE}
- `/{COMMAND_NAME} {EXAMPLE_ARGS}` - {EXAMPLE_USAGE}

## Implementation

I will use TodoWrite to track progress, then:

1. **Context Detection Phase:**
   {CONTEXT_DETECTION_STEPS}

2. **Conditional Execution:**
   {CONDITIONAL_EXECUTION_LOGIC}

3. **Result Integration:**
   {RESULT_INTEGRATION_APPROACH}

**Fallback Strategy**: {FALLBACK_STRATEGY}
```

## Variable Reference

- `{COMMAND_NAME}` - The slash command name
- `{COMMAND_DESCRIPTION}` - Description highlighting adaptive behavior
- `{ARGUMENT_HINT}` - Parameter hints including context overrides
- `{COMMAND_PURPOSE_STATEMENT}` - What this adaptive command accomplishes
- `{CONTEXT_FACTORS}` - What factors influence command behavior
- `{CONDITIONAL_LOGIC_DESCRIPTION}` - How decisions are made
- `{SUPPORTED_CONTEXTS}` - List of contexts the command supports
- `{DEFAULT_USAGE}` - Auto-detection usage example
- `{EXAMPLE_ARGS}` - Context override examples
- `{EXAMPLE_USAGE}` - Usage with context specification
- `{CONTEXT_DETECTION_STEPS}` - How context is determined
- `{CONDITIONAL_EXECUTION_LOGIC}` - Decision tree for agent selection
- `{RESULT_INTEGRATION_APPROACH}` - How different results are handled
- `{FALLBACK_STRATEGY}` - What happens when context is unclear

## Example Usage

**Language-Aware Testing:**
```markdown
---
description: "Execute project tests using appropriate framework-specific testing agent"
argument-hint: "[--framework <auto|jest|pytest|rspec|go>] [--pattern <test_pattern>]"
---

Execute project tests using the most appropriate testing agent based on detected or specified framework.

This command adapts its behavior based on detected testing framework and project structure.

**Conditional Logic:**
- Auto-detection analyzes package.json, requirements.txt, Gemfile, go.mod
- Framework-specific agents provide optimal testing experience
- Fallback to generic test runner for unknown frameworks

**Supported Contexts:**
- **JavaScript/TypeScript**: Uses jest-test-agent for Jest/Vitest projects
- **Python**: Uses pytest-test-agent for pytest projects  
- **Ruby**: Uses rspec-test-agent for RSpec projects
- **Go**: Uses go-test-agent for Go projects
- **Generic**: Uses project-test-runner for unknown frameworks

**Usage:**
- `/test` - Auto-detect framework and run appropriate tests
- `/test --framework pytest --pattern "test_user*"` - Force pytest with specific pattern

## Implementation

I will use TodoWrite to track progress, then:

1. **Context Detection Phase:**
   - Check for package.json (indicates Node.js project)
   - Check for requirements.txt or pyproject.toml (indicates Python project)
   - Check for Gemfile (indicates Ruby project)
   - Check for go.mod (indicates Go project)
   - Analyze test directory structure for framework clues

2. **Conditional Execution:**
   If framework is "auto" or not specified:
   - If package.json found with jest/vitest: Task with subagent_type: "jest-test-agent"
   - If requirements.txt found: Task with subagent_type: "pytest-test-agent"
   - If Gemfile found with rspec: Task with subagent_type: "rspec-test-agent"
   - If go.mod found: Task with subagent_type: "go-test-agent"
   - Otherwise: Task with subagent_type: "project-test-runner"
   
   If framework is explicitly specified:
   - Task with subagent_type: "{framework}-test-agent" with specified parameters

3. **Result Integration:**
   - Framework-specific results formatted for consistency
   - Include framework detection details in report
   - Provide framework-specific recommendations

**Fallback Strategy**: Use project-test-runner agent with generic framework detection when specific agents are unavailable
```

## Context Detection Patterns

### File-Based Detection
```markdown
Context detection based on project files:
- package.json → Node.js project
- requirements.txt → Python project  
- Gemfile → Ruby project
- go.mod → Go project
- pom.xml → Java project
```

### Content-Based Detection
```markdown
Context detection based on file contents:
- "jest" in package.json → Jest testing
- "pytest" in requirements.txt → Pytest testing
- "rspec" in Gemfile → RSpec testing
```

### Structure-Based Detection
```markdown
Context detection based on directory structure:
- src/components/ → React project
- tests/ with .py files → Python test suite
- spec/ with .rb files → Ruby test suite
```

## When to Use This Template

- Commands that work across multiple project types
- Operations that benefit from framework-specific optimization
- Commands where user preferences should override auto-detection
- Scenarios requiring intelligent fallback behavior
- Multi-language or multi-framework support needs

## Pattern Benefits

- **Adaptability**: Works across different project contexts
- **User Control**: Allows manual override of auto-detection
- **Optimization**: Uses best agent for detected context
- **Fallback Safety**: Graceful degradation for unknown contexts
- **Consistency**: Maintains uniform interface across contexts

## Implementation Requirements

- **Context Detection**: Reliable project analysis
- **Agent Mapping**: Clear mapping from context to appropriate agent
- **Fallback Logic**: Graceful handling of unknown contexts
- **User Override**: Support for manual context specification
- **Result Consistency**: Uniform output format across contexts