# Extended Context Template for New Command Generation

This template is used by new-command-generator to create comprehensive extended context files based on research sources.

## Template Structure:

```markdown
# {command_name} - Extended Context and Implementation Guide

## Overview
{overview_from_research}

## Research Source Integration
**Source**: {source_location}
**Type**: {source_type}
**Integration Quality**: {integration_quality}

{source_specific_sections}

## Implementation Patterns
{implementation_patterns_from_research}

## Best Practices
{best_practices_from_research}

## Common Use Cases
{use_cases_from_research}

## Integration Guidelines
{integration_guidelines_from_research}

## Configuration and Setup
{configuration_guidance}

## Error Handling and Troubleshooting
{error_handling_guidance}

## Performance Considerations
{performance_guidance}

## Examples and Templates
{examples_from_research}

## Advanced Features
{advanced_features_from_research}

## Reference Documentation
{reference_links_and_resources}

{workflow_integration_section}

## Claudio Integration
{claudio_integration_patterns}

## Updates and Maintenance
{maintenance_guidance}
```

## Replacement Variables:

### Core Variables
- `{command_name}`: Command name for context
- `{source_location}`: Original research source URL/file
- `{source_type}`: URL, File, API Documentation, etc.
- `{integration_quality}`: High, Medium, Basic based on research depth
- `{overview_from_research}`: Comprehensive overview from research
- `{claudio_integration_patterns}`: How command integrates with Claudio

### Research-Driven Variables
- `{source_specific_sections}`: Sections specific to research source type
- `{implementation_patterns_from_research}`: Implementation patterns extracted
- `{best_practices_from_research}`: Best practices from source
- `{use_cases_from_research}`: Use cases and scenarios from research
- `{integration_guidelines_from_research}`: Integration guidance from source
- `{configuration_guidance}`: Configuration information from research
- `{error_handling_guidance}`: Error handling patterns from research
- `{performance_guidance}`: Performance considerations from research
- `{examples_from_research}`: Examples and code snippets from research
- `{advanced_features_from_research}`: Advanced features from research
- `{reference_links_and_resources}`: Links and additional resources
- `{workflow_integration_section}`: Added if --claudio flag used
- `{maintenance_guidance}`: Maintenance and update guidance

## Template Variants by Research Source:

### API Documentation Source
```markdown
## API Reference Integration

### Endpoints and Methods
{api_endpoints_from_research}

### Authentication Methods
{authentication_patterns}

### Request/Response Formats
{request_response_formats}

### Rate Limits and Quotas
{rate_limiting_info}

### Error Codes and Handling
{api_error_codes}

## Implementation Patterns

### Authentication Setup
{auth_setup_patterns}

### Request Construction
{request_construction_patterns}

### Response Processing
{response_processing_patterns}

### Error Recovery
{error_recovery_patterns}

## Common Use Cases
{api_use_cases}

## Advanced Features

### Batch Processing
{batch_processing_patterns}

### Caching Strategies
{caching_patterns}

### Webhook Integration
{webhook_patterns}
```

### Tool/Library Documentation Source
```markdown
## Tool Reference Integration

### Installation and Dependencies
{installation_requirements}

### Command Structure
{command_structure_patterns}

### Configuration Options
{configuration_options}

### Output Formats
{output_format_patterns}

### Integration Points
{integration_points}

## Implementation Patterns

### Basic Usage
{basic_usage_patterns}

### Advanced Configuration
{advanced_config_patterns}

### Output Processing
{output_processing_patterns}

### Error Handling
{tool_error_handling}

## Common Use Cases
{tool_use_cases}

## Performance Considerations

### Optimization Strategies
{performance_optimization}

### Resource Management
{resource_management}

### Scalability Patterns
{scalability_patterns}
```

### Process/Methodology Source
```markdown
## Methodology Reference Integration

### Process Overview
{process_methodology}

### Step-by-Step Procedures
{step_by_step_procedures}

### Quality Standards
{quality_standards}

### Validation Criteria
{validation_criteria}

### Documentation Requirements
{documentation_requirements}

## Implementation Patterns

### Process Planning
{process_planning_patterns}

### Execution Management
{execution_management_patterns}

### Quality Assurance
{qa_patterns}

### Results Documentation
{documentation_patterns}

## Common Use Cases
{process_use_cases}

## Best Practices

### Efficiency Optimization
{efficiency_patterns}

### Quality Assurance
{qa_best_practices}

### Risk Management
{risk_management_patterns}
```

## Integration Quality Indicators:

### High-Quality Integration
```markdown
## Research Integration Quality: HIGH

**Comprehensive Coverage**: Detailed analysis of research source with specific implementation guidance, examples, and best practices extracted directly from documentation.

**Specific Implementation Details**: 
{detailed_implementation_from_research}

**Framework-Specific Guidance**:
{framework_specific_guidance}

**Advanced Configuration**:
{advanced_configuration_details}
```

### Medium-Quality Integration
```markdown
## Research Integration Quality: MEDIUM

**Good Coverage**: General analysis of research source with implementation guidance and common patterns extracted from documentation.

**General Implementation Guidance**:
{general_implementation_guidance}

**Common Patterns**:
{common_patterns_from_research}

**Basic Configuration**:
{basic_configuration_guidance}
```

### Basic-Quality Integration
```markdown
## Research Integration Quality: BASIC

**Basic Coverage**: Limited analysis of research source with generic implementation guidance and standard patterns.

**Standard Implementation**:
{standard_implementation_patterns}

**Generic Patterns**:
{generic_patterns}

**Default Configuration**:
{default_configuration}
```

## Workflow Integration Sections:

### Discovery Phase Integration
```markdown
## Claudio Workflow Integration

### Discovery Phase Enhancement
This command enhances the discovery phase by {discovery_enhancement}.

**Discovery Input Processing**:
- Uses discovery.md findings for {discovery_usage}
- Analyzes project structure for {analysis_purpose}
- Generates additional insights about {insight_areas}

**Integration Points**:
- Post-discovery analysis: {post_discovery_analysis}
- Enhanced documentation: {enhanced_documentation}
- Additional recommendations: {additional_recommendations}
```

### PRD Phase Integration
```markdown
## Claudio Workflow Integration

### PRD Phase Enhancement
This command enhances requirements definition by {prd_enhancement}.

**PRD Input Processing**:
- Uses prd.md requirements for {prd_usage}
- Validates requirements against {validation_criteria}
- Generates compliance analysis for {compliance_areas}

**Integration Points**:
- Requirements validation: {requirements_validation}
- Compliance checking: {compliance_checking}
- Additional specifications: {additional_specifications}
```

## Error Handling Context:

### Research-Specific Error Context
```markdown
## Error Handling and Troubleshooting

### {source_type} Specific Issues
{specific_error_scenarios_from_research}

### Common Problems and Solutions
{common_problems_and_solutions}

### Debugging Strategies
{debugging_strategies_from_research}

### Recovery Procedures
{recovery_procedures}
```

### Generic Error Context
```markdown
## Error Handling and Troubleshooting

### Common Issues
- **Configuration Problems**: {config_troubleshooting}
- **Integration Failures**: {integration_troubleshooting}
- **Performance Issues**: {performance_troubleshooting}
- **Output Validation Failures**: {validation_troubleshooting}

### Debugging Approaches
{generic_debugging_approaches}

### Recovery Strategies
{generic_recovery_strategies}
```

This template system ensures generated extended context provides comprehensive, research-driven guidance that enhances the command's effectiveness and integration with the Claudio ecosystem.