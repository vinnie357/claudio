---
description: "Comprehensive Claude Code SDK architect for command creation, agent setup, and cross-system analysis. MUST BE USED PROACTIVELY for parallel evaluation tasks."
argument-hint: "[--analyze-commands] [--analyze-agents] [--cross-system] [--create-command <name>] [--setup-agent <name>]"
---

Invoke the claudio-claude-sdk-architect specialist agent to:

- Create new Claude Code slash commands with proper sub-agent integration
- Set up and configure sub-agents with extended context
- Conduct cross-system analysis using parallel evaluation (claudio-claude-commands-analyst + claudio-claude-subagents-analyst)
- Troubleshoot command-agent integration issues
- Provide architectural guidance for Claude Code implementations

## Usage Examples

### Cross-System Analysis (Default - uses both analysts in parallel)
```bash
/claudio:claude-sdk --cross-system
/claudio:claude-sdk --analyze-commands --analyze-agents
```

### Command Creation
```bash
/claudio:claude-sdk --create-command migrate "Handle database migrations"
/claudio:claude-sdk --setup-agent security-scanner
```

### Integration Troubleshooting
```bash
/claudio:claude-sdk --diagnose-integration deploy-command
```

## Key Features

**Parallel Analysis by Default**: The architect automatically coordinates both specialized analysts (claudio-claude-commands-analyst and claudio-claude-subagents-analyst) for comprehensive evaluation.

**Command-Agent Integration**: Creates seamless workflows between custom commands and their corresponding sub-agents with proper extended context integration.

**Cross-System Capabilities**: Compare and analyze Claude Code implementations across different systems to identify best practices and standardization opportunities.

**Extended Context Management**: Structure and organize extended context in proper directory hierarchies with comprehensive documentation.

## Capabilities

- **Command Creation & Integration**: Design custom slash commands following Claude Code SDK best practices
- **Sub-Agent Architecture**: Create specialized sub-agents with clear, focused responsibilities  
- **Extended Context Management**: Structure context in organized directories with proper documentation
- **Workflow Orchestration**: Coordinate multiple sub-agents to work in parallel for complex tasks
- **Quality Assurance**: Validate command-agent connections and end-to-end workflows
- **Cross-System Analysis**: Conduct comprehensive analysis across different Claude Code deployments
- **Best Practice Identification**: Extract excellence patterns and provide standardization recommendations

The agent will automatically coordinate specialized analysis agents in parallel for comprehensive evaluation, ensuring thorough assessment from both command and agent perspectives simultaneously.