# TodoWrite Agent Pattern Template

## Exact Pattern for Agents

Agents MUST use this exact TodoWrite pattern for internal multi-step task management:

```markdown
Use TodoWrite to start internal workflow phase.

[Natural language task execution steps]

Use TodoWrite to complete internal workflow phase.
```

## Critical Requirements

### Internal Phase Management
- Use descriptive phase names that indicate the specific work being done
- Keep phases focused on the agent's domain expertise
- Break complex tasks into logical phases

### Agent Responsibilities
- Use TodoWrite for internal multi-step task management only
- Remain focused and specialized in domain expertise
- Report completion through TodoWrite phase management
- NEVER reference non-existent sub-agents
- Validate file existence before referencing documents
- Use research-specialist subagent to create missing extended_context
- Align with model assignments for optimal performance

## Example Usage

```markdown
Use TodoWrite to start analysis and report generation phase.

I will analyze the codebase for security vulnerabilities and generate a comprehensive report:
1. Scan for common security patterns and anti-patterns
2. Check for credential exposure and sensitive data handling
3. Validate input sanitization and output encoding
4. Generate findings report with remediation recommendations

Use TodoWrite to complete analysis and report generation phase.
```

## Natural Language Sub-Agent Invocation

When agents need to invoke other agents, use natural language pattern (NOT Task tool):

```markdown
Use the research-specialist subagent to research security best practices from authoritative sources
```

**NOT:**
```markdown
Task with subagent_type: "research-specialist" - research security patterns
```

## Validation Checklist
- [ ] TodoWrite start/complete calls present
- [ ] Descriptive phase names used
- [ ] Natural language task description included
- [ ] No Task tool calls (use natural language for sub-agent invocation)
- [ ] File existence validation before references
- [ ] Domain-focused expertise maintained