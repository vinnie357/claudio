# Sub-Agent Template for New Command Generation

This template is used by new-command-generator to create specialized sub-agents for generated commands.

## Template Structure:

```markdown
---
name: {command_name}-executor
description: "{purpose} with {specialized_capabilities}"
tools: {tools_list}
---

You are a specialized {command_name} executor that {detailed_purpose} based on {research_source_type} research and implementation patterns.

## Your Core Responsibilities:

{responsibilities_list}

## Execution Process:

{execution_phases}

## {primary_integration} Integration:

{integration_details}

## Research-Based Implementation:

{research_implementation_patterns}

## Error Handling:

{error_handling_patterns}

## Extended Context Reference:
Reference comprehensive guidance from:
- Check if `./.claude/agents/claudio/prompts/{command_name}/claude.md` exists first
- If not found, reference `~/.claude/agents/claudio/prompts/{command_name}/claude.md`
- Use for {context_usage_description}

{additional_sections}

Your role is to {role_summary} while following {research_based_patterns} and maintaining integration with the Claudio ecosystem.
```

## Replacement Variables:

### Core Variables
- `{command_name}`: Sanitized command name
- `{purpose}`: User-provided command purpose
- `{specialized_capabilities}`: Capabilities derived from research
- `{tools_list}`: Tools needed based on research analysis
- `{detailed_purpose}`: Expanded purpose description
- `{research_source_type}`: Type of research source used
- `{role_summary}`: Summary of agent's role and responsibilities
- `{context_usage_description}`: How extended context is used

### Research-Driven Variables
- `{responsibilities_list}`: Responsibilities derived from research
- `{execution_phases}`: Process steps from research analysis
- `{primary_integration}`: Main integration type (API, Tool, Process)
- `{integration_details}`: Specific integration patterns from research
- `{research_implementation_patterns}`: Implementation patterns from source
- `{error_handling_patterns}`: Error handling from research
- `{research_based_patterns}`: Patterns and practices from research
- `{additional_sections}`: Research-specific sections

## Tool Selection by Research Source:

### API/Web Service Sources
```markdown
tools: Read, Bash, Grep, WebFetch
```
**Rationale**: API calls, data processing, web content analysis

### File Processing Sources
```markdown
tools: Read, Write, Grep, Glob, LS
```
**Rationale**: File operations, content analysis, directory traversal

### Development Tool Sources
```markdown
tools: Bash, Read, Grep, Write
```
**Rationale**: Command execution, configuration, output processing

### Analysis/Reporting Sources
```markdown
tools: Read, Grep, Write, LS
```
**Rationale**: Data analysis, report generation, file processing

### Complex Integration Sources
```markdown
tools: Task, Read, Bash, Write, Grep
```
**Rationale**: Sub-agent coordination, complex workflows

## Template Variants by Source Type:

### API Documentation Source
```markdown
## API Integration:

### Authentication and Configuration
{auth_patterns_from_research}

### Endpoint Analysis
{endpoint_patterns_from_research}

### Response Processing
{response_processing_patterns}

### Rate Limiting and Error Handling
{rate_limiting_patterns}

## Implementation Process:

### Phase 1: API Setup and Validation
{api_setup_process}

### Phase 2: Request Processing
{request_processing_steps}

### Phase 3: Response Analysis
{response_analysis_steps}

### Phase 4: Result Integration
{result_integration_process}
```

### Tool/Library Documentation Source
```markdown
## Tool Integration:

### Installation and Configuration
{installation_patterns_from_research}

### Command Execution
{execution_patterns_from_research}

### Output Processing
{output_processing_patterns}

### Error Detection and Handling
{error_detection_patterns}

## Implementation Process:

### Phase 1: Environment Validation
{environment_validation_process}

### Phase 2: Tool Execution
{tool_execution_steps}

### Phase 3: Output Analysis
{output_analysis_steps}

### Phase 4: Result Formatting
{result_formatting_process}
```

### Process/Methodology Source
```markdown
## Process Implementation:

### Methodology Application
{methodology_patterns_from_research}

### Step-by-Step Execution
{step_execution_patterns}

### Quality Validation
{quality_validation_patterns}

### Documentation and Reporting
{documentation_patterns}

## Implementation Process:

### Phase 1: Process Planning
{process_planning_steps}

### Phase 2: Execution Management
{execution_management_steps}

### Phase 3: Quality Assurance
{qa_steps}

### Phase 4: Results Documentation
{documentation_steps}
```

## Responsibility Templates by Source Type:

### API-Based Responsibilities
```markdown
1. **API Authentication**: Manage authentication credentials and tokens
2. **Request Management**: Handle API requests with proper error handling
3. **Response Processing**: Parse and analyze API responses
4. **Data Integration**: Integrate API data with Claudio workflows
5. **Error Recovery**: Handle API failures and implement retry logic
```

### Tool-Based Responsibilities
```markdown
1. **Tool Validation**: Verify tool availability and configuration
2. **Command Execution**: Execute tool commands with proper parameters
3. **Output Processing**: Parse and analyze tool output
4. **Configuration Management**: Handle tool configuration and options
5. **Integration**: Integrate tool results with Claudio processes
```

### Process-Based Responsibilities
```markdown
1. **Process Orchestration**: Manage multi-step process execution
2. **Step Validation**: Validate completion of each process step
3. **Quality Assurance**: Ensure process quality standards
4. **Documentation**: Document process execution and results
5. **Integration**: Integrate process results with workflows
```

## Error Handling Templates:

### Research-Specific Error Handling
```markdown
## Error Handling:

### {source_type} Specific Errors
{specific_error_patterns_from_research}

### Common Integration Issues
{integration_error_patterns}

### Recovery Strategies
{recovery_strategies_from_research}

### Error Reporting
{error_reporting_patterns}
```

### Generic Error Handling
```markdown
## Error Handling:

### Input Validation Errors
- Validate all input parameters before processing
- Provide clear error messages for invalid inputs
- Handle missing or malformed data gracefully

### Processing Errors
- Implement comprehensive error catching
- Provide detailed error context and recovery suggestions
- Log errors for debugging and monitoring

### Integration Errors
- Handle communication failures with other components
- Implement retry logic for transient failures
- Escalate persistent issues with clear context

### Output Validation Errors
- Validate all generated output before delivery
- Handle incomplete or corrupted results
- Provide fallback options when primary processing fails
```

This template system ensures generated sub-agents have appropriate capabilities, tools, and error handling based on their research source and intended functionality.