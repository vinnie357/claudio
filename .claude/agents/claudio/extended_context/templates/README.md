# Claudio Template System Documentation

This directory contains the comprehensive template system for Claudio workflows, providing standardized patterns for commands, agents, workflows, and integrations.

## Template System Overview

The Claudio template system provides reusable patterns and examples that ensure consistency across commands, agents, and workflows while maintaining flexibility for project-specific customization.

### Lazy Loading Architecture

**Memory Efficiency Principle**: Templates are loaded on-demand only when needed, not during normal command execution.

**When Templates Are Loaded**:
- **Command Generation**: `/claudio:new-command` loads command templates
- **Agent Creation**: `/claudio:newprompt` loads agent templates  
- **System Installation**: Installation agents load templates for project-specific localization
- **Context Creation**: Research agents load templates when creating missing extended context
- **Pattern Validation**: Validation agents load templates for compliance checking

**When Templates Are NOT Loaded**:
- During normal command execution (e.g., running `/claudio:discovery`)
- During agent processing unless explicitly creating new components
- During workflow execution unless generating new templates

## Template Categories

### 1. Command Templates (`commands/`)

Standard patterns for Claudio slash commands with variable placeholders and proven integration patterns.

**Available Templates**:
- `basic-command-template.md` - Simple single-agent command pattern
- `orchestrator-command-template.md` - Multi-agent coordination pattern
- `conditional-command-template.md` - Context-aware command pattern
- `parallel-execution-template.md` - High-performance parallel agent pattern
- `test-command-template.md` - Project-specific test command pattern (moved from development/)
- `test-g-command-template.md` - Gemini-integrated test command pattern

**Usage**: Command generators load appropriate template based on command requirements and populate variables with project-specific values.

### 2. Agent Templates (`agents/`)

Proven patterns for different types of Claudio agents with standardized structure and integration points.

**Available Templates**:
- `specialist-agent-template.md` - Single-purpose, domain-focused agent pattern
- `orchestrator-agent-template.md` - Multi-agent coordination agent pattern
- `analysis-agent-template.md` - Examination and reporting agent pattern
- `validation-agent-template.md` - Verification and compliance agent pattern

**Usage**: Agent creators select template based on agent type, load template content, and replace variables with agent-specific information.

### 3. Workflow Templates (`workflows/`)

Complete workflow examples demonstrating proven patterns for different types of project operations.

**Available Templates**:
- `discovery-workflow-examples.md` - Project analysis workflow patterns
- `development-workflow-examples.md` - Code development and quality workflows

**Usage**: Referenced by workflow agents and coordinators for implementing complex multi-step processes with proper phase management.

### 4. Integration Templates (`integration/`)

Patterns for how different Claudio components work together, including command-agent integration and agent coordination.

**Available Templates**:
- `command-agent-integration-examples.md` - How commands invoke and coordinate with agents
- `agent-coordination-examples.md` - How agents work together in complex workflows

**Usage**: Referenced during system design, integration validation, and when creating new coordination patterns.

## Template Usage Patterns

### On-Demand Loading

Templates follow the lazy loading principle for memory efficiency:

```markdown
## Template Loading Pattern

When template is needed:
1. **Check Template Existence**: Verify template file exists in appropriate category
2. **Load Template Content**: Use Read tool to load template file
3. **Apply Variables**: Replace template variables with specific values
4. **Generate Component**: Create final component from populated template

When template is not needed:
- Templates remain unloaded
- References to template availability documented but content not accessed
- Memory footprint remains minimal
```

### Variable Replacement System

All templates use a standardized variable replacement system:

**Variable Format**: `{VARIABLE_NAME}` in UPPERCASE with underscores
**Common Variables**:
- `{AGENT_NAME}` - Agent name in lowercase-hyphen format
- `{COMMAND_NAME}` - Command name for slash commands
- `{DESCRIPTION}` - Brief description of purpose
- `{TOOL_LIST}` - Array of required tools
- `{MODEL_ASSIGNMENT}` - Claude model (haiku, sonnet, opus)

**Project-Specific Variables**:
- `{PROJECT_TYPE}` - React, Python, Node.js, etc.
- `{FRAMEWORK}` - Detected framework (Express, Django, Phoenix)
- `{TEST_FRAMEWORK}` - Testing framework (Jest, pytest, ExUnit)

### Template Selection Logic

Generators use decision trees to select appropriate templates:

**Command Template Selection**:
- Single agent operation → `basic-command-template.md`
- Multi-agent coordination → `orchestrator-command-template.md`
- Context-dependent behavior → `conditional-command-template.md`
- Performance-critical operations → `parallel-execution-template.md`

**Agent Template Selection**:
- Domain expertise focus → `specialist-agent-template.md`
- Workflow coordination → `orchestrator-agent-template.md`
- Data analysis and reporting → `analysis-agent-template.md`
- Compliance and verification → `validation-agent-template.md`

## Integration with Generator Agents

### Command Generation Integration

The `new-command-generator` agent uses templates as follows:

1. **Template Selection**: Analyzes command requirements to select appropriate command template
2. **Template Loading**: Loads selected template from `templates/commands/` directory
3. **Variable Population**: Replaces template variables with command-specific values
4. **Agent Template Integration**: Selects and populates matching agent template
5. **Component Generation**: Creates final command and agent files

### Agent Creation Integration

The `newprompt-agent-creator` agent uses templates as follows:

1. **Template Selection**: Chooses agent template based on agent type and responsibilities
2. **Template Loading**: Loads template content from `templates/agents/` directory
3. **Customization**: Adapts template structure for specific domain requirements
4. **Integration Points**: Establishes connections with other agents and extended context

### Installation Integration

Installation agents use templates for project-specific localization:

1. **Project Analysis**: Analyze project characteristics for template customization
2. **Template Loading**: Load relevant templates based on project needs
3. **Localization**: Adapt templates for specific technology stacks and frameworks
4. **Component Generation**: Create project-specific commands and agents

## Best Practices

### Template Design

1. **Variable Clarity**: Use descriptive variable names with clear documentation
2. **Pattern Consistency**: Follow established Claudio patterns and conventions
3. **Flexibility**: Provide sufficient customization points for different use cases
4. **Documentation**: Include comprehensive examples and usage guidance

### Template Usage

1. **Lazy Loading**: Only load templates when actively creating components
2. **Validation**: Verify template completeness before variable replacement
3. **Error Handling**: Graceful degradation when templates are missing or malformed
4. **Testing**: Validate generated components work correctly with populated templates

### Memory Management

1. **On-Demand Access**: Load template content only when needed
2. **Reference Documentation**: Document template availability without loading content
3. **Garbage Collection**: Don't cache template content beyond immediate usage
4. **Efficiency**: Minimize memory footprint during normal operations

## Extending the Template System

### Adding New Templates

1. **Category Selection**: Choose appropriate category (commands, agents, workflows, integration)
2. **Template Structure**: Follow existing template patterns and variable conventions
3. **Documentation**: Include comprehensive variable reference and usage examples
4. **Integration**: Update generator agents to recognize and use new templates

### Template Maintenance

1. **Pattern Updates**: Keep templates aligned with current Claudio patterns
2. **Variable Consistency**: Maintain consistent variable naming across templates
3. **Example Validation**: Ensure template examples work correctly
4. **Documentation Sync**: Keep documentation current with template changes

This template system provides a robust foundation for consistent, efficient component generation while maintaining the lazy loading principle for optimal memory usage.