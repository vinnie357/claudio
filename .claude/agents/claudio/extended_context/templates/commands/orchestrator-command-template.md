# Orchestrator Command Template

This template provides a multi-agent coordination pattern for complex operations requiring multiple specialized agents.

## Template Structure

```markdown
---
description: "{COMMAND_DESCRIPTION}"
argument-hint: "{ARGUMENT_HINT}"
---

{COMMAND_PURPOSE_STATEMENT}

This command coordinates multiple specialized agents to {WORKFLOW_DESCRIPTION}.

**Workflow Stages:**
{WORKFLOW_STAGES}

**Agents Coordinated:**
{AGENT_LIST}

**Usage:**
- `/{COMMAND_NAME}` - {DEFAULT_USAGE}
- `/{COMMAND_NAME} {EXAMPLE_ARGS}` - {EXAMPLE_USAGE}

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
{PARALLEL_TASK_CALLS}

Then read outputs, validate them, and create complete report.

**Error Handling**: {ERROR_HANDLING_STRATEGY}
**Output Integration**: {OUTPUT_INTEGRATION_APPROACH}
```

## Variable Reference

- `{COMMAND_NAME}` - The slash command name
- `{COMMAND_DESCRIPTION}` - Brief description for frontmatter
- `{ARGUMENT_HINT}` - Parameter format hint
- `{COMMAND_PURPOSE_STATEMENT}` - What this orchestration accomplishes
- `{WORKFLOW_DESCRIPTION}` - High-level workflow description
- `{WORKFLOW_STAGES}` - Numbered list of workflow stages
- `{AGENT_LIST}` - List of agents with their roles
- `{DEFAULT_USAGE}` - Default usage example
- `{EXAMPLE_ARGS}` - Example arguments
- `{EXAMPLE_USAGE}` - Usage with arguments example
- `{PARALLEL_TASK_CALLS}` - List of parallel Task tool invocations
- `{ERROR_HANDLING_STRATEGY}` - How errors are handled across agents
- `{OUTPUT_INTEGRATION_APPROACH}` - How outputs are combined

## Example Usage

**Project Analysis Command:**
```markdown
---
description: "Comprehensive project analysis with security, quality, and performance assessment"
argument-hint: "[--depth <shallow|deep>] [--focus <security|quality|performance|all>]"
---

Execute comprehensive project analysis using multiple specialized assessment agents.

This command coordinates multiple specialized agents to provide complete project health assessment.

**Workflow Stages:**
1. Project structure and dependency analysis
2. Security vulnerability scanning
3. Code quality assessment
4. Performance bottleneck identification
5. Report consolidation and recommendations

**Agents Coordinated:**
- discovery-agent: Project structure and technology analysis
- vulnerability-assessment-specialist: Security vulnerability detection
- code-quality-analyzer: Code quality and maintainability analysis
- performance-analyzer: Performance bottleneck identification
- documentation-coordinator: Report generation and consolidation

**Usage:**
- `/analyze` - Run complete analysis with default settings
- `/analyze --depth deep --focus security` - Deep security-focused analysis

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "discovery-agent" - pass the project path for structure analysis
- Task with subagent_type: "vulnerability-assessment-specialist" - pass the security focus parameters
- Task with subagent_type: "code-quality-analyzer" - pass the quality assessment depth
- Task with subagent_type: "performance-analyzer" - pass the performance analysis scope

Then read outputs, validate them, and create complete analysis report.

**Error Handling**: Individual agent failures are captured, partial results provided, graceful degradation with user notification
**Output Integration**: Results combined into unified report with executive summary and detailed findings per analysis type
```

## When to Use This Template

- Complex multi-step processes
- Operations requiring multiple expertise areas
- Workflows with parallel execution opportunities
- Commands needing sophisticated error handling
- Operations requiring result synthesis

## Pattern Benefits

- **Coordination**: Manages complex multi-agent workflows
- **Parallel Execution**: Enables concurrent operations for performance
- **Error Resilience**: Graceful handling of partial failures
- **Result Synthesis**: Combines multiple perspectives effectively
- **Progress Tracking**: Clear workflow progress indication

## Implementation Requirements

- **TodoWrite Usage**: Progress tracking throughout workflow
- **Parallel Task Calls**: Multiple Task invocations in single message
- **Error Recovery**: Graceful handling of agent failures
- **Output Validation**: Verification of all agent outputs
- **Result Integration**: Synthesis of multiple agent results