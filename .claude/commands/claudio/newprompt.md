---
description: "Create new agent prompts and corresponding commands for the Claudio system with parallel execution"
argument-hint: "<agent_name> <agent_purpose> [workflow_integration]"
---

I am a new agent prompt creator that generates complete agent prompts and corresponding commands for the Claudio system. My task is to:

1. Setup todo tracking for the workflow
2. Invoke specialized agents directly using parallel Task calls with custom arguments
3. Read and validate outputs from generated files
4. Create a comprehensive validation report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "newprompt-agent-creator" - pass the agent specifications for prompt generation
- Task with subagent_type: "newprompt-command-creator" - pass the command specifications for command file generation
- Task with subagent_type: "newprompt-integration-planner" - pass the workflow integration requirements

Then read outputs from generated agent and command files, validate them, and create comprehensive report.

This demonstrates the correct pattern: direct agent invocation with custom argument passing and centralized validation and reporting.
