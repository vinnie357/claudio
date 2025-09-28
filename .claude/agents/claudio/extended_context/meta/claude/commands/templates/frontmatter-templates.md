# Frontmatter Templates

## Command Frontmatter Template

ALL commands MUST include this exact frontmatter:

```yaml
---
description: "Clear command purpose statement"
argument-hint: "[expected-input-format]"
---
```

### Required Fields
- **description**: Brief, clear statement of command purpose (in quotes)
- **argument-hint**: Expected input format in brackets

### Examples
```yaml
---
description: "Analyze project structure and capabilities with parallel analysis system"
argument-hint: "[project-path]"
---
```

```yaml
---
description: "Generate intelligent Git commit messages based on staged changes"
argument-hint: "[optional-message-context]"
---
```

```yaml
---
description: "Execute project test suite with intelligent analysis and optional fixes"
argument-hint: "[test-pattern] [--fix]"
---
```

## Agent Frontmatter Template

ALL agents MUST include this exact frontmatter:

```yaml
---
name: agent-name
model: haiku    # or sonnet, or opus
---
```

### Required Fields
- **name**: Agent name using lowercase-hyphen format
- **model**: Claude model assignment (haiku, sonnet, or opus)

### System Component Classification
For system components (excluded from user installations), add:

```yaml
---
name: agent-name
model: haiku
system: claudio-system
---
```

### Model Assignment Guidelines

**Haiku** - Fast, cost-effective operations:
- Simple validation tasks
- Basic file operations
- Lightweight processing
- Examples: path validators, git commit message generators

**Sonnet 4** - Complex reasoning and code generation:
- Complex code analysis and generation
- Multi-step workflows with decision-making
- Technology stack analysis
- Documentation creation
- Examples: discovery agents, workflow agents, analysis agents

**Opus 4.1** - Multi-agent coordination and highest complexity:
- Multi-agent orchestration and coordination
- Cross-system analysis
- Complex security analysis
- Sophisticated reasoning across domains
- Examples: coordinator agents, orchestrator agents

### Agent Examples
```yaml
---
name: discovery-agent
model: sonnet
---
```

```yaml
---
name: install-path-validator-agent
model: haiku
system: claudio-system
---
```

```yaml
---
name: claudio-coordinator-agent
model: opus
---
```

## Validation Checklist

### For Commands:
- [ ] description field present and in quotes
- [ ] argument-hint field present with brackets
- [ ] Clear, action-oriented description
- [ ] Expected input format specified

### For Agents:
- [ ] name field using lowercase-hyphen format
- [ ] model field with valid assignment (haiku/sonnet/opus)
- [ ] system field added if internal component
- [ ] Model assignment appropriate for complexity level

## Naming Conventions

### ALWAYS Use lowercase-hyphen:
- **Agent Names**: `discovery-agent`, `security-review-coordinator`
- **Command Names**: `new-command`, `code-quality`
- **File Names**: `agent-name.md`, `command-name.md`

### NEVER Use underscores:
- ❌ `discovery_agent`
- ❌ `security_review_coordinator`
- ❌ `agent_name.md`