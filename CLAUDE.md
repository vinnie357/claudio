# Claudio Agent Control Specifications

## Navigation
- **Agent Index**: `.claude/agents/claudio/index.md` - Complete agent catalog
- **Command Index**: `.claude/commands/index.md` - Command specifications
- **Extended Context**: `.claude/agents/claudio/extended_context/` - Workflow contexts
- **Research Documents**: `.claudio/research/` - Project analysis
- **System Documentation**: `docs/` - Technical details
- **Templates**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/` - Exact formatting templates

## Documentation Structure

### Core Documentation
- **Usage Guide**: `docs/usage-guide.md` - Complete command reference, workflow examples, and practical usage patterns
- **System Architecture**: `docs/system-architecture.md` - Extended context structure, agent integration, and technical implementation details
- **Specialized Features**: `docs/specialized-features.md` - Research system, Claude SDK capabilities, and advanced features
- **Best Practices**: `docs/best-practices.md` - Development workflows, context management, and integration guidance
- **Changelog Management**: `docs/changelog-management.md` - Maintenance protocol and update procedures

### Extended Context Reference
- **Command Development**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/command-development-template.md`
- **Agent Architecture**: `.claude/agents/claudio/extended_context/agent-analysis/architecture-patterns.md`
- **Integration Patterns**: `.claude/agents/claudio/extended_context/command-analysis/integration-patterns.md`
- **Sub-agent Coordination**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/subagent-invocation-patterns.md`
- **Discovery Workflows**: `.claude/agents/claudio/extended_context/workflow/discovery/overview.md`

## Critical Execution Patterns

### Task Invocation
```
Task with subagent_type: "agent-name" - pass arguments
```

### Parallel Execution
```
Run multiple Task invocations in a SINGLE message
```

### TodoWrite Integration
```
Use TodoWrite to start Phase N - Phase Name
[Task execution steps]
Use TodoWrite to complete Phase N - Phase Name
```

### Naming Convention
**ALWAYS lowercase-hyphen**: `agent-name`, `command-name` (NOT `agent_name`)

## System Architecture

### Commands → Agents → Extended Context
- `/claudio:discovery` → `discovery-agent` → `extended_context/workflow/discovery/`
- `/claudio:prd` → `prd-agent` → `extended_context/workflow/prd/`
- `/claudio:plan` → `plan-agent` → `extended_context/workflow/planning/`
- `/claudio:task` → `task-agent` → `extended_context/workflow/task/`
- `/claudio:claudio` → `claudio-coordinator-agent` → Multiple contexts
- `/claudio:research` → `research-specialist` → `extended_context/research/`
- `/claudio:code-quality` → `code-quality-analyzer` → `extended_context/development/quality/`
- `/claudio:security-review` → `security-review-coordinator` → Security contexts
- `/claudio:test` → `project-test-runner` → Testing contexts

### Extended Context Structure
- `extended_context/workflow/` - Core workflow contexts
- `extended_context/development/` - Development contexts
- `extended_context/infrastructure/` - System contexts
- `extended_context/documentation/` - Documentation contexts
- `extended_context/research/` - Research contexts

## Component Classification

### System vs User Component Filtering

**Installation Rule**: Check frontmatter `system: claudio-system` field
- **System components**: Tagged with `system: claudio-system` - exclude from user installations
- **User components**: No system tag - install to user projects

**Filtering Logic** (for installation agents):
```markdown
1. Read component file frontmatter
2. Check for `system: claudio-system` field
3. If system tag present, skip during user installations
4. If no system tag, include in user installations
```

## Model Assignments

### Agent Model Distribution
- **Haiku (11 agents)**: Simple validation, file operations
- **Sonnet 4 (58 agents)**: Complex reasoning, analysis
- **Opus 4.1 (8 agents)**: Multi-agent coordination

### Model Assignment Implementation
```yaml
---
name: agent-name
model: haiku    # or sonnet, or opus
---
```

## Command Development Standards

**For complete templates with examples, see**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/command-development-template.md`

### Mandatory Pattern
```markdown
---
description: "Command purpose"
argument-hint: "[input]"
---

I am a [purpose] that [description]. My task is to:

1. Setup todo tracking for workflow
2. Invoke specialized agents using parallel Task calls
3. Read and validate outputs
4. Create comprehensive report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "agent1" - pass arguments
- Task with subagent_type: "agent2" - pass arguments

Then read outputs, validate them, and create complete report.
```

### Required Elements
- **TodoWrite first**: Always setup todo tracking before Task calls
- **Parallel Task calls**: Multiple agents with custom arguments
- **Output validation**: Read and validate actual outputs
- **Complete report**: Centralized result compilation

## Anti-Patterns (NEVER USE)
- Coordinator agents that call other agents
- Sequential execution when parallel is possible
- Missing TodoWrite progress tracking
- Generic arguments or no argument passing
- Assuming outputs without validation
- Incorrect subagent_type references
- Inconsistent agent naming (must use lowercase-hyphen)

## Critical Requirements

### File Validation (MANDATORY)
```markdown
Use Read or LS tools to validate file existence before referencing
If file does not exist, use research-specialist subagent to create required documentation
```


### Sub-Agent Invocation Patterns

**For detailed patterns and examples, see**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/subagent-invocation-patterns.md`

**Commands use Task tool pattern:**
```
Task with subagent_type: "target-agent" - pass arguments
```

**Sub-agents use natural language pattern:**
```
Use the target-agent-name subagent to [action] [context]
```

### Anti-Fabrication Rules
- Base all outputs on actual analysis of real project data
- Execute tools and report actual results
- Mark uncertain information as "requires analysis"
- Use precise, factual language without unnecessary adjectives
- Execute tests before marking tasks complete
- Validate integration recommendations through actual framework detection

**Time and Effort Estimation Rule:**
- Never provide time estimates, effort estimates, or completion timelines without actual measurement or analysis
- If estimates are requested, execute tools to analyze scope (e.g., count files, measure complexity, assess dependencies) before providing data-backed estimates
- When estimates cannot be measured, explicitly state "timeline requires analysis of [specific factors]"
- Avoid fabricated scheduling language like "15 minutes", "2 hours", "quick task" without factual basis

## Workflow Dependencies

### Sequential vs Parallel Execution Rules
**Sequential Prerequisites** (must complete before others):
- Discovery analysis must complete before PRD creation
- PRD must complete before planning
- Planning must complete before task breakdown

**Parallel Execution** (after prerequisites):
- Documentation generation, security analysis, and code quality can run in parallel
- Multiple analysis agents can execute simultaneously when dependencies are met

**Reference**: `.claude/agents/claudio/extended_context/command-analysis/integration-patterns.md`

## System Reliability Requirements

### Error Handling Pattern
**When extended_context is missing:**
- Provide graceful degradation 
- Use research-specialist subagent fallback for missing documentation
- Never assume files exist without verification

### Extended Context Integration
**Template Loading**: Templates are loaded on-demand only when:
- Creating new commands with `/claudio:new-command`
- Creating new agents with `/claudio:newprompt`
- Installing system components with `/claudio:install`
- Research agents creating missing context

**Memory Efficiency**: Templates are not loaded during normal command execution

## Changelog Maintenance

**When working on Claudio system**, check for `changelog/YYYY-MM-DD.md` and update for changes to:
- Agent contexts (`extended_context/` directory)
- Commands (`.claude/commands/` directory)
- System documentation (`README.md`, `CLAUDE.md`, `docs/` directory)

**Reference**: `docs/changelog-management.md`

## TodoWrite Pattern Requirements

**For detailed templates with exact formatting, see**: `.claude/agents/claudio/extended_context/templates/`

### Template System Reference

**Template Locations:**
- `.claude/agents/claudio/extended_context/templates/` - Template library
- `.claude/agents/claudio/extended_context/command-analysis/` - Integration patterns
- `.claude/agents/claudio/extended_context/agent-analysis/` - Architecture patterns

### Command and Agent Responsibilities

**Commands:**
- Parse user arguments before starting TodoWrite phases
- Use TodoWrite for primary workflow control loop
- Coordinate focused specialized agents
- Wrap all Task tool calls in TodoWrite phases
- NEVER reference non-existent subagents

**Agents:**
- Use TodoWrite for internal multi-step task management
- Remain focused and specialized in domain expertise
- Report completion through TodoWrite phase management
- Validate file existence before referencing documents
- Use research-specialist subagent to create missing extended_context
- NEVER reference non-existent sub-agents

## Extended Context Integration Patterns

### Pseudocode Migration Strategy
**All implementation examples must be moved to extended_context documents**

**Agent Documentation Pattern:**
```markdown
Generate outputs using patterns referenced in extended_context/[category]/[specific-templates.md]. 
Validate file existence before referencing extended_context documents using Read or LS tools. 
If template files do not exist, use research-specialist subagent to create required documentation.
```

**Extended Context Structure for Implementation Examples:**
- `extended_context/installation/` - Installation-related examples and bash commands
- `extended_context/testing/` - Test command templates and framework patterns  
- `extended_context/upgrade/` - Upgrade workflow examples and procedures
- `extended_context/generation/` - Generation templates and prompt patterns
- `extended_context/documentation/` - Documentation templates and structures


### Extended Context Content Standards
- **Natural Language Focus**: Agent documentation uses natural language only
- **Implementation Separation**: All code examples, templates, and pseudocode moved to extended_context
- **Reference Integrity**: Agents reference specific extended_context files with existence validation
- **Graceful Degradation**: Agents handle missing extended_context with research-specialist fallback