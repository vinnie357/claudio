# Template Variable Reference

This document provides a comprehensive reference for all standardized variables used in Claudio templates, ensuring consistency across template usage and generation.

## Variable Format Standards

### Naming Convention
- **Format**: `{VARIABLE_NAME}` - Uppercase with underscores, enclosed in curly braces
- **Consistency**: Same variable names used across all templates for same concepts
- **Clarity**: Descriptive names that clearly indicate the variable's purpose

### Variable Categories

Variables are organized into logical categories based on their usage context:

## Core Component Variables

### Basic Information
- `{AGENT_NAME}` - Agent name in lowercase-hyphen format (e.g., "security-scanner")
- `{COMMAND_NAME}` - Command name without /claudio: prefix (e.g., "security-scan")
- `{DESCRIPTION}` - Brief description for frontmatter or documentation
- `{PURPOSE_STATEMENT}` - Longer explanation of what the component does

### Technical Configuration
- `{TOOL_LIST}` - Array of required tools (e.g., [Read, Write, Bash, Grep])
- `{MODEL_ASSIGNMENT}` - Claude model assignment (haiku, sonnet, opus)
- `{SYSTEM_FLAG}` - Whether component is system-only (claudio-system or omitted)

## Command Template Variables

### Command Structure
- `{COMMAND_DESCRIPTION}` - Description for command frontmatter
- `{ARGUMENT_HINT}` - Parameter format hint for users (e.g., "[--format <json|html>]")
- `{COMMAND_PURPOSE_STATEMENT}` - Opening sentence explaining command function
- `{OPERATION_DESCRIPTION}` - What operation the command performs

### Usage Examples
- `{DEFAULT_USAGE}` - How to use command with no arguments
- `{EXAMPLE_ARG}` - Example argument value
- `{EXAMPLE_ARGS}` - Multiple example arguments
- `{EXAMPLE_USAGE}` - Usage example with arguments

### Agent Integration
- `{AGENT_ACTION}` - What action the agent performs for this command
- `{OUTPUT_DESCRIPTION}` - What user can expect as output
- `{ERROR_HANDLING_STRATEGY}` - How errors are managed
- `{PERFORMANCE_BENEFITS}` - Performance gains from command design

### Orchestration Variables
- `{WORKFLOW_DESCRIPTION}` - High-level workflow explanation
- `{WORKFLOW_STAGES}` - Numbered list of workflow stages
- `{AGENT_LIST}` - List of agents with their roles
- `{PARALLEL_TASK_CALLS}` - List of parallel Task tool invocations
- `{COORDINATION_STRATEGY}` - How results are coordinated

### Conditional Logic Variables
- `{CONTEXT_FACTORS}` - What factors influence command behavior
- `{CONDITIONAL_LOGIC_DESCRIPTION}` - How decisions are made
- `{SUPPORTED_CONTEXTS}` - List of supported execution contexts
- `{CONTEXT_DETECTION_STEPS}` - How context is determined
- `{CONDITIONAL_EXECUTION_LOGIC}` - Decision tree for execution
- `{FALLBACK_STRATEGY}` - What happens when context unclear

## Agent Template Variables

### Agent Identity
- `{DOMAIN_EXPERTISE}` - Specific domain the agent covers
- `{PRIMARY_RESPONSIBILITY}` - Main purpose of the agent
- `{ANALYSIS_DOMAIN}` - Domain being analyzed (for analysis agents)
- `{VALIDATION_SCOPE}` - What is being validated (for validation agents)

### Responsibilities Structure
- `{RESPONSIBILITY_X_TITLE}` - Title of each major responsibility (X = 1,2,3,4)
- `{RESPONSIBILITY_X_DESCRIPTION}` - Detailed description of responsibility
- `{ORCHESTRATION_RESPONSIBILITIES}` - Workflow management duties
- `{COORDINATION_RESPONSIBILITIES}` - Agent communication duties

### Process Structure
- `{DOMAIN_NAME}` - Name of the domain/process area
- `{WORKFLOW_NAME}` - Name of the main workflow
- `{PHASE_X_NAME}` - Name of each process/workflow phase
- `{PHASE_X_DESCRIPTION}` - Description of what phase accomplishes
- `{STEP_X_NAME}` - Name of individual process steps
- `{STEP_X_DESCRIPTION}` - Detailed step implementation

### Output Structure
- `{OUTPUT_X_NAME}` - Name of each output type
- `{OUTPUT_X_SCHEMA}` - JSON schema or structure example
- `{OUTPUT_X_DESCRIPTION}` - Description of output content

### Error Handling
- `{ERROR_CATEGORY_X}` - Types of errors handled
- `{ERROR_HANDLING_X}` - Error handling approaches
- `{ERROR_HANDLING_DESCRIPTION_X}` - Detailed error management

### Quality Assurance
- `{QA_CATEGORY_X}` - Quality assurance categories
- `{QA_DESCRIPTION_X}` - QA approach descriptions
- `{EXPERTISE_SUMMARY}` - Summary of expertise provided
- `{QUALITY_ASSURANCE}` - Quality assurance approach
- `{QUALITY_COMMITMENT}` - Quality and reliability commitments

### Integration Points
- `{INTEGRATION_ASPECT_X}` - Integration points with other systems
- `{INTEGRATION_DESCRIPTION_X}` - How integration works
- `{CONTEXT_CATEGORY}` - Extended context category (workflow, development, etc.)
- `{CONTEXT_TOPIC}` - Extended context topic within category
- `{CONTEXT_PURPOSE}` - Why context is relevant

## Project-Specific Variables

### Technology Stack
- `{PROJECT_TYPE}` - Project type (React, Python, Node.js, Elixir, Go, etc.)
- `{PROJECT_NAME}` - Actual project name from discovery
- `{FRAMEWORK}` - Main framework (Express, Django, Phoenix, Spring, etc.)
- `{VERSION}` - Framework or tool version if detected
- `{PROJECT_SLUG}` - Sanitized project name for file naming

### Development Tools
- `{TEST_FRAMEWORK}` - Testing framework (Jest, pytest, ExUnit, RSpec, etc.)
- `{TEST_COMMAND}` - Command to run tests (npm test, pytest, mix test, etc.)
- `{COVERAGE_TOOL}` - Coverage tool (nyc, coverage.py, etc.)
- `{TEST_DIRECTORY}` - Test directory location (tests/, __tests__/, spec/, etc.)

### Features and Configuration
- `{CUSTOM_FEATURES}` - Project-specific features and capabilities
- `{TEST_CATEGORIES}` - Types of tests (unit, integration, e2e, etc.)
- `{CI_INTEGRATION}` - CI/CD system (GitHub Actions, Jenkins, GitLab CI, etc.)
- `{COVERAGE_INTEGRATION}` - Coverage reporting (Codecov, Coveralls, etc.)
- `{WATCH_MODE_SUPPORT}` - How to run in watch mode

## Workflow Template Variables

### Discovery Variables
- `{TECHNOLOGY_STACK}` - Detected technologies requiring analysis
- `{ARCHITECTURE_PATTERNS}` - Patterns influencing component selection
- `{PROJECT_STRUCTURE}` - Structure affecting workflow approach
- `{SPECIAL_REQUIREMENTS}` - Unique project needs
- `{MCP_RECOMMENDATIONS}` - Suggested Model Context Protocols

### Development Variables
- `{QUALITY_FOCUS_AREAS}` - Areas for quality analysis emphasis
- `{SECURITY_ANALYSIS_SCOPE}` - Scope for security review
- `{PERFORMANCE_ANALYSIS_PARAMETERS}` - Performance analysis focus
- `{DESIGN_REVIEW_SCOPE}` - Design evaluation parameters

## Variable Usage Examples

### Basic Command Template Population

```markdown
**Template Variables:**
{COMMAND_NAME} = "security-scan"
{COMMAND_DESCRIPTION} = "Analyze project for security vulnerabilities"
{AGENT_NAME} = "vulnerability-assessment-specialist"
{DEFAULT_USAGE} = "Complete vulnerability analysis with default settings"

**Populated Result:**
---
description: "Analyze project for security vulnerabilities"
argument-hint: "[--severity <all|high|critical>]"
---

Use Task tool with subagent_type: "vulnerability-assessment-specialist" to analyze project security.

Usage:
- `/security-scan` - Complete vulnerability analysis with default settings
```

### Agent Template Population

```markdown
**Template Variables:**
{AGENT_NAME} = "code-quality-analyzer" 
{DOMAIN_EXPERTISE} = "code quality assessment and technical debt analysis"
{PRIMARY_RESPONSIBILITY} = "evaluate code maintainability and provide improvement recommendations"
{TOOL_LIST} = [Read, Glob, Bash, LS, Grep]
{MODEL_ASSIGNMENT} = "sonnet"

**Populated Result:**
---
name: code-quality-analyzer
description: "Analyzes code quality and generates improvement recommendations"
tools: [Read, Glob, Bash, LS, Grep]
model: sonnet
---

You are the code-quality-analyzer agent that specializes in code quality assessment and technical debt analysis. Your role is to evaluate code maintainability and provide improvement recommendations.
```

## Variable Validation Rules

### Required Variables
- All templates must define required vs optional variables
- Required variables must be populated before component generation
- Missing required variables should trigger clear error messages

### Validation Patterns
- **Agent Names**: Must match lowercase-hyphen pattern
- **Tool Lists**: Must be valid arrays of recognized tools
- **Model Assignments**: Must be one of: haiku, sonnet, opus
- **File Names**: Must be valid filesystem names

### Consistency Checks
- Same concepts use same variable names across all templates
- Variable values consistent across related components
- Integration variables match between commands and their agents

This variable reference ensures consistent, predictable template usage across all Claudio component generation.