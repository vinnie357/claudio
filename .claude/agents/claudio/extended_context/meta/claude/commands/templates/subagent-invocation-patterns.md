# Sub-Agent Invocation Patterns

## Critical Pattern Distinction

The invocation pattern depends on WHO is calling:

### Commands Use Task Tool Pattern

**For COMMANDS invoking sub-agents, use Task tool pattern:**

```markdown
Task with subagent_type: "target-agent" - pass the input-value argument for processing
```

**Example:**
```markdown
- Task with subagent_type: "discovery-agent" - analyze project structure and technology stack
- Task with subagent_type: "security-review-coordinator" - perform comprehensive security analysis  
- Task with subagent_type: "code-quality-analyzer" - evaluate code quality and maintainability
```

### Sub-Agents Use Natural Language Pattern

**For SUB-AGENTS invoking other sub-agents, use natural language:**

```markdown
Use the target-agent-name subagent to [action] [context]
```

**Example:**
```markdown
Use the research-specialist subagent to research workflow task patterns from https://www.atlassian.com/agile/project-management to create the required context documentation
```

## Forbidden Patterns

**❌ FORBIDDEN Pattern (for both):**
```markdown
suggest using `/claudio:command-name` to [action]
```

**❌ NEVER directly reference command invocations from agents**

## Pattern Selection Guide

### When to Use Task Tool Pattern
- You are writing a COMMAND (.claude/commands/)
- You need parallel execution of multiple agents
- You are coordinating a workflow from the command level
- You have arguments to pass to specialized agents

### When to Use Natural Language Pattern
- You are writing an AGENT (.claude/agents/)
- You need to invoke another agent from within an agent
- You are creating missing extended context via research-specialist
- You need specialized sub-agent capabilities

## Implementation Examples

### Command Example (Task Tool Pattern)
```markdown
I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "vulnerability-assessment-specialist" - scan codebase for security issues
- Task with subagent_type: "security-architecture-analyst" - evaluate security design patterns
- Task with subagent_type: "security-threat-modeler" - perform STRIDE threat analysis
```

### Agent Example (Natural Language Pattern)
```markdown
If the required security context documentation is missing, I will:

Use the research-specialist subagent to research OWASP security best practices from authoritative sources to create the missing security guidance documentation
```

## System Integration Benefits

This hybrid approach ensures:
- ✅ Commands use proper Tool-based invocation for parallel execution
- ✅ Sub-agents use Claude Code's natural language sub-agent patterns
- ✅ Prevention of bash execution errors and tool conflicts
- ✅ Consistent system reliability across all coordination patterns

## Validation Checklist

### For Commands:
- [ ] Using Task tool pattern with subagent_type
- [ ] Passing meaningful arguments
- [ ] Referencing actual agent files (lowercase-hyphen naming)
- [ ] Within TodoWrite phases

### For Sub-Agents:
- [ ] Using natural language pattern
- [ ] Clear action and context description
- [ ] Valid sub-agent name reference
- [ ] Appropriate fallback for missing context