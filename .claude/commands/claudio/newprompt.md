---
description: "Create new agent prompts and corresponding commands for the Claudio system with parallel execution"
argument-hint: "<agent_name> <agent_purpose> [workflow_integration]"
---

Create new agent prompts and corresponding commands for the Claudio system, including integration planning and documentation updates.

Use the claudio:newprompt-coordinator subagent to orchestrate parallel creation of agent prompts, command files, and integration plans.

**CRITICAL**: Run multiple Task invocations in a SINGLE message to ensure proper parallel execution of sub-agents.
