---
description: "Generate custom commands with sub-agents and extended context from research sources"
argument-hint: "<name> \"<purpose>\" <source> [--claudio \"<workflow_position>\"]"
system: claudio-system
---

I am a custom command generator that creates complete command systems (command + sub-agent + extended context) based on user specifications and research sources. My task is to:

1. Setup todo tracking for the workflow
2. Invoke specialized agents directly using parallel Task calls with custom arguments
3. Read and validate outputs from generated files
4. Create a comprehensive validation report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "research-specialist" - pass the source argument for context research
- Task with subagent_type: "new-command-generator" - pass the command specifications for template generation
- Task with subagent_type: "new-command-validator" - pass the generated files for validation

Then read outputs from generated command files, validate them, and create comprehensive report.

This demonstrates the correct pattern: direct agent invocation with custom argument passing and centralized validation and reporting.

## Command Structure
`/claudio:new-command <name> "<purpose>" <source> [--claudio "<workflow_position>"]`

## Parameters
- **name**: Command name (alphanumeric, hyphens allowed)
- **purpose**: Brief description of what the command does  
- **source**: URL or local file path for research context
- **--claudio**: Optional workflow integration position

## Generated Components
1. **Command File**: `commands/claudio/{name}.md` - Following proper direct agent invocation pattern
2. **Sub-Agent**: `agents/claudio/{name}-executor.md` - Specialized execution agent
3. **Extended Context**: `agents/claudio/extended_context/{category}/{name}/overview.md` - Research-based context