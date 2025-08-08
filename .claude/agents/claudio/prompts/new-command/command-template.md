# Command Template for New Command Generation

This template is used by new-command-generator to create consistent command files following Claudio patterns.

## Template Structure:

```markdown
---
description: "{purpose} with intelligent analysis and automation"
argument-hint: "{argument_pattern}"
---

{detailed_description}

**Key Capabilities:**
{capabilities_list}

**Research Source:** {source_type} - {source_location}
**Context Integration:** {research_context_summary}

**Usage Patterns:**
{usage_examples}

**Integration Features:**
{integration_capabilities}

{workflow_integration_section}

Use the claudio:{command_name}-executor subagent to {execution_summary} with {specialized_features}.

**Reference**: Uses `.claude/agents/claudio/prompts/{command_name}/claude.md` for {context_description} and implementation guidance.

{additional_sections}
```

## Replacement Variables:

### Core Variables
- `{purpose}`: User-provided command purpose
- `{argument_pattern}`: Generated argument pattern based on research
- `{detailed_description}`: Expanded description based on research context
- `{command_name}`: Sanitized command name
- `{source_type}`: URL, File, or Documentation
- `{source_location}`: Original research source
- `{execution_summary}`: Brief summary of what the sub-agent does
- `{specialized_features}`: Features derived from research
- `{context_description}`: Description of extended context content

### Research-Driven Variables
- `{capabilities_list}`: Bulleted list of command capabilities from research
- `{research_context_summary}`: Summary of research findings integration
- `{usage_examples}`: Usage patterns based on research content
- `{integration_capabilities}`: Integration features found in research
- `{workflow_integration_section}`: Section added if --claudio flag used
- `{additional_sections}`: Research-specific sections (prerequisites, etc.)

## Template Variants by Research Source Type:

### API Documentation Source
```markdown
**API Integration:**
- **Endpoint Analysis**: {api_endpoints}
- **Authentication**: {auth_methods}
- **Rate Limiting**: {rate_limits}
- **Response Formats**: {response_types}

**Usage:**
- `/command [options]` - {basic_usage}
- `/command --format {format}` - {format_options}
- `/command --filter {criteria}` - {filtering_options}
```

### Tool/Library Documentation Source
```markdown
**Tool Integration:**
- **Installation Requirements**: {installation_info}
- **Configuration**: {config_requirements}
- **Dependencies**: {dependencies}
- **Version Compatibility**: {version_info}

**Usage:**
- `/command` - {basic_functionality}
- `/command --config {file}` - {config_usage}
- `/command --output {format}` - {output_options}
```

### Process/Methodology Documentation Source
```markdown
**Process Automation:**
- **Methodology**: {process_description}
- **Steps**: {process_steps}
- **Best Practices**: {best_practices}
- **Quality Assurance**: {qa_measures}

**Usage:**
- `/command` - {process_execution}
- `/command --validate` - {validation_mode}
- `/command --report` - {reporting_mode}
```

## Workflow Integration Templates:

### After Discovery Integration
```markdown
**Claudio Workflow Integration:**
This command is automatically executed after the discovery phase in the Claudio workflow, using discovery analysis to {integration_purpose}.

**Discovery Integration:**
- Uses discovery.md findings for {discovery_usage}
- Enhances project understanding with {enhancement_description}
- Provides {additional_analysis_type} analysis
```

### After PRD Integration
```markdown
**Claudio Workflow Integration:**
This command runs after PRD generation, using requirements documentation to {integration_purpose}.

**Requirements Integration:**
- Uses prd.md requirements for {prd_usage}
- Validates requirements against {validation_criteria}
- Provides {analysis_type} recommendations
```

### Parallel Execution Integration
```markdown
**Claudio Workflow Integration:**
This command executes in parallel with {parallel_phase}, providing {parallel_purpose}.

**Parallel Processing:**
- Runs simultaneously with {phase_description}
- Provides independent {analysis_type}
- Results integrated in {integration_point}
```

## Quality Indicators by Source Type:

### High-Quality Research Integration
- Specific technical details from source
- Implementation examples from documentation
- Error handling patterns from source
- Best practices extracted from research
- Tool-specific configurations and options

### Medium-Quality Research Integration
- General concepts from source
- Basic implementation guidance
- Standard error handling
- Generic best practices
- Common configuration patterns

### Basic Research Integration
- Minimal source integration
- Generic command structure
- Standard Claudio patterns
- Basic error handling
- Default configuration options

## Error Handling Template Sections:

### Source-Specific Error Handling
```markdown
**Error Handling:**
- **{source_type} Issues**: {specific_error_patterns}
- **Configuration Errors**: {config_error_handling}
- **Integration Failures**: {integration_error_handling}
- **Validation Errors**: {validation_error_handling}
```

### Generic Error Handling
```markdown
**Error Handling:**
- **Input Validation**: Parameter validation and error reporting
- **Process Failures**: Graceful failure handling and recovery
- **Integration Issues**: Sub-agent communication error handling
- **Output Validation**: Result verification and error reporting
```

This template system ensures generated commands maintain consistency while incorporating research-specific details and capabilities.