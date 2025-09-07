# TodoWrite Command Pattern Template

## Exact Pattern for Commands

Commands MUST use this exact TodoWrite pattern for phase management:

```markdown
Use TodoWrite to start Phase N - Phase Name.

[Natural language workflow steps with Task tool calls]
- Task with subagent_type: "agent-name" - pass arguments for processing
- Task with subagent_type: "agent-name" - pass arguments for processing

Use TodoWrite to complete Phase N - Phase Name.
```

## Critical Requirements

### Phase Naming
- Use descriptive phase names that clearly indicate the work being done
- Examples: "Phase 1 - Project Discovery", "Phase 2 - Quality Analysis"

### Task Tool Integration
- Always include specific Task tool calls within TodoWrite phases
- Pass meaningful arguments to each subagent
- Use exact subagent_type names that match actual agent files

### Command Responsibilities
- Parse user arguments before starting TodoWrite phases
- Use TodoWrite for primary workflow control loop
- Coordinate focused specialized agents
- Perform simple validation directly
- NEVER reference non-existent subagents
- Wrap all Task tool calls in TodoWrite phases

## Example Usage

```markdown
Use TodoWrite to start Phase 1 - Project Discovery Analysis.

I will analyze the project structure and technology stack using parallel specialized agents:
- Task with subagent_type: "discovery-structure-analyzer" - analyze project directory structure and file organization
- Task with subagent_type: "discovery-tech-analyzer" - identify technology stack and dependencies
- Task with subagent_type: "discovery-architecture-analyzer" - evaluate design patterns and architecture

Use TodoWrite to complete Phase 1 - Project Discovery Analysis.
```

## Validation Checklist
- [ ] TodoWrite start/complete calls present
- [ ] Descriptive phase names used
- [ ] Task tool calls included with arguments
- [ ] Subagent_type references validated
- [ ] Natural language workflow description included