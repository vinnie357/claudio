# Template Design Best Practices

This document establishes best practices for designing, maintaining, and using templates within the Claudio system to ensure consistency, maintainability, and effectiveness.

## Design Principles

### 1. Lazy Loading Architecture

**Principle**: Templates should only be loaded when actively needed for component generation.

**Implementation Guidelines:**

```markdown
**✅ CORRECT - On-Demand Loading:**
When component generation requires template:
1. Check if template exists in appropriate category
2. Load template content using Read tool
3. Apply variables and generate component
4. Discard template content after use

**❌ INCORRECT - Always Loading:**
Loading template content during normal agent operation or including full template content in agent contexts
```

**Benefits:**
- Minimal memory footprint during normal operations
- Faster agent initialization and execution
- Scalable system that doesn't degrade with more templates

### 2. Variable Consistency

**Principle**: Use standardized variable names across all templates for the same concepts.

**Implementation Guidelines:**

```markdown
**✅ CONSISTENT Variable Usage:**
- {AGENT_NAME} - Always for agent names across all templates
- {COMMAND_NAME} - Always for command names across all templates  
- {TOOL_LIST} - Always for tool arrays across all templates
- {MODEL_ASSIGNMENT} - Always for Claude model assignment

**❌ INCONSISTENT Variable Usage:**
- {AGENT_NAME} in one template, {AGENT} in another
- {DESCRIPTION} in one template, {DESC} in another
```

**Benefits:**
- Predictable template usage across generators
- Easier maintenance and updates
- Reduced errors in template population

### 3. Pattern Compliance

**Principle**: Templates must enforce proven Claudio patterns and conventions.

**Required Pattern Elements:**

```markdown
**Command Templates Must Include:**
- Proper frontmatter with description and argument-hint
- Task tool invocation with correct subagent_type format
- TodoWrite integration for orchestrator commands  
- Parallel execution patterns where appropriate

**Agent Templates Must Include:**
- Lowercase-hyphen naming convention
- Appropriate model assignment (haiku/sonnet/opus)
- TodoWrite phase management for multi-step processes
- Extended context integration with graceful degradation
```

## Template Structure Standards

### 1. Header Structure

**Standard Template Header:**

```markdown
# {Template Type} Template

This template provides {pattern description} for {use case}.

## Template Structure
[Template markdown content with variables]

## Variable Reference
[Comprehensive variable documentation]

## Example Usage
[Populated example showing template in action]

## When to Use This Template
[Clear guidance on template selection]

## Pattern Benefits
[Benefits of using this template pattern]
```

### 2. Variable Documentation

**Variable Documentation Standards:**

```markdown
## Variable Reference

### Basic Information
- `{VARIABLE_NAME}` - Clear description of purpose and format
- `{ANOTHER_VARIABLE}` - Description with examples where helpful

### Usage Notes
- Required vs optional variables clearly marked
- Default values documented where applicable
- Validation rules specified for each variable
```

### 3. Example Integration

**Example Standards:**
- Every template must include complete working example
- Examples should demonstrate common use cases
- Variable population should be realistic and representative
- Examples must follow current Claudio patterns exactly

## Template Categories and Selection

### 1. Command Template Selection Logic

```markdown
**Decision Tree for Command Templates:**

Simple single-agent operation?
→ Use basic-command-template.md

Multiple agents with coordination?
→ Use orchestrator-command-template.md

Behavior changes based on context?
→ Use conditional-command-template.md

Performance-critical with parallel execution?
→ Use parallel-execution-template.md

Project-specific testing needs?
→ Use test-command-template.md or test-g-command-template.md
```

### 2. Agent Template Selection Logic

```markdown
**Decision Tree for Agent Templates:**

Single domain expertise focus?
→ Use specialist-agent-template.md

Multi-agent workflow coordination?
→ Use orchestrator-agent-template.md

Analysis and reporting focus?
→ Use analysis-agent-template.md

Verification and compliance focus?
→ Use validation-agent-template.md
```

## Variable Management Best Practices

### 1. Naming Conventions

**Variable Naming Standards:**
- `{ALL_CAPS_WITH_UNDERSCORES}` format
- Descriptive names that clearly indicate purpose
- Consistent naming across all templates
- No abbreviations unless universally understood

**Examples:**
```markdown
**✅ GOOD Variable Names:**
- {AGENT_NAME} - Clear and specific
- {COMMAND_DESCRIPTION} - Descriptive and unambiguous
- {WORKFLOW_STAGES} - Specific to content type

**❌ POOR Variable Names:**  
- {NAME} - Too generic
- {DESC} - Abbreviated and unclear
- {STUFF} - Vague and unhelpful
```

### 2. Variable Validation

**Pre-Population Validation:**

```markdown
**Required Validations:**
- Verify all required variables are provided
- Validate variable format (e.g., lowercase-hyphen for agent names)
- Check variable values against allowed options
- Ensure cross-variable consistency

**Validation Examples:**
- {AGENT_NAME} must match pattern: [a-z][a-z0-9-]*
- {MODEL_ASSIGNMENT} must be one of: haiku, sonnet, opus
- {TOOL_LIST} must be valid array of recognized tools
```

### 3. Default Value Management

**Default Value Strategy:**

```markdown
**When to Provide Defaults:**
- Optional configuration variables
- Common patterns that rarely change
- Fallback values for optional features

**When NOT to Provide Defaults:**
- Core identifying information (names, descriptions)
- Domain-specific content that must be customized
- Integration points that vary by use case
```

## Memory Management Guidelines

### 1. Loading Strategy

**Optimal Loading Pattern:**

```markdown
**Template Loading Workflow:**
1. **Need Assessment**: Only proceed if component generation required
2. **Template Selection**: Choose appropriate template based on requirements
3. **Content Loading**: Load template content using Read tool
4. **Variable Population**: Replace variables with specific values
5. **Component Generation**: Create final component
6. **Content Disposal**: Don't cache template content beyond immediate use
```

### 2. Reference vs Content

**Documentation Strategy:**

```markdown
**✅ CORRECT - Template References:**
Agent contexts should reference template availability and selection logic without including full template content.

**❌ INCORRECT - Template Inclusion:**  
Agent contexts should NOT include full template content or cache templates unnecessarily.
```

### 3. Efficiency Optimization

**Performance Guidelines:**

```markdown
**Loading Efficiency:**
- Load only the specific template needed
- Don't load multiple templates speculatively
- Process variables in single pass through template
- Generate component immediately after population

**Memory Efficiency:**
- Don't maintain template caches across operations
- Process templates one at a time for multi-template operations
- Clear template content from memory after component generation
```

## Quality Assurance Practices

### 1. Template Validation

**Template Quality Checks:**

```markdown
**Structure Validation:**
- All required sections present and properly formatted
- Variable references use correct {VARIABLE_NAME} format
- Examples are complete and functional
- Documentation is comprehensive and accurate

**Pattern Compliance:**
- Templates enforce current Claudio patterns
- No deprecated patterns or conventions
- Integration points follow established standards
- Error handling follows Claudio guidelines
```

### 2. Generated Component Testing

**Post-Generation Validation:**

```markdown
**Component Testing Requirements:**
- Generated components follow Claudio naming conventions
- Task tool references use correct subagent_type format
- Extended context references are valid
- TodoWrite patterns are properly implemented

**Integration Testing:**
- Command-agent integration works correctly
- Agent coordination follows established patterns
- Error handling provides graceful degradation
- Performance meets expected standards
```

### 3. Template Maintenance

**Ongoing Maintenance Practices:**

```markdown
**Regular Updates:**
- Keep templates aligned with current Claudio patterns
- Update examples when patterns change
- Maintain variable consistency across updates
- Document changes and migration guidance

**Pattern Evolution:**
- Update templates when new patterns are proven
- Deprecate outdated patterns with migration paths
- Maintain backward compatibility where possible
- Provide clear upgrade guidance for template users
```

## Error Handling in Templates

### 1. Graceful Degradation

**Template Error Handling:**

```markdown
**Missing Template Handling:**
- Provide clear error messages when templates not found
- Offer fallback options or manual creation guidance
- Document template dependencies and requirements

**Variable Population Errors:**
- Validate required variables before processing
- Provide helpful error messages for missing variables
- Suggest corrections for malformed variable values
```

### 2. Recovery Strategies

**Error Recovery Patterns:**

```markdown
**Template Loading Failures:**
- Fall back to simpler template if advanced template fails
- Provide manual template creation guidance
- Log errors for template maintenance

**Variable Validation Failures:**
- Clear error messages with correction suggestions
- Examples of correct variable format
- Validation rules documentation
```

## Integration with Generator Agents

### 1. Generator Agent Requirements

**Template Integration Standards:**

```markdown
**Generator Agent Must:**
- Implement template selection logic based on requirements
- Load templates only when needed for component generation
- Validate variables before population
- Handle template errors gracefully
- Generate components that pass validation

**Generator Agent Must NOT:**
- Load templates during initialization
- Cache template content beyond immediate use
- Proceed with invalid or missing variables
- Generate non-compliant components
```

### 2. Coordination Patterns

**Multi-Template Operations:**

```markdown
**When Generating Multiple Components:**
- Load templates sequentially as needed
- Validate each component before proceeding to next
- Handle partial failures with clear error reporting
- Maintain consistency across related components
```

These best practices ensure the template system remains efficient, maintainable, and reliable while supporting the full range of Claudio component generation needs.