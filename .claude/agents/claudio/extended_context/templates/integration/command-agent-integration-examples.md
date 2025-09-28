# Command-Agent Integration Examples

This document provides comprehensive examples of how Claudio commands integrate with their corresponding agents using proven patterns.

## Basic Integration Pattern

### Simple Command-Agent Pattern
```markdown
**Command Structure:**
```markdown
---
description: "Analyze project security vulnerabilities and generate detailed report"
argument-hint: "[--severity <all|high|critical>] [--format <json|md|html>]"
---

Analyze the current project for security vulnerabilities using specialized security analysis.

**Security Analysis**: Comprehensive vulnerability detection and risk assessment
**Agent Used**: vulnerability-assessment-specialist  
**Expected Output**: Detailed security report with findings and remediation guidance

**Usage:**
- `/security-scan` - Complete vulnerability analysis with default settings
- `/security-scan --severity critical --format json` - Critical vulnerabilities in JSON format

Use Task tool with subagent_type: "vulnerability-assessment-specialist" to analyze project security with the specified severity level and output format.

**Context Integration**: Uses `.claude/agents/claudio/extended_context/security/vulnerability-patterns/` for security analysis patterns and threat detection.
```

**Agent Integration:**
- Command passes parameters directly to agent via Task tool
- Agent receives structured arguments and project context
- Agent returns standardized output format for command processing
- Command handles user interaction and result presentation
```

## Multi-Agent Orchestration Pattern

### Command Coordinating Multiple Agents
```markdown
**Command Structure (Orchestrator Pattern):**
```markdown
---
description: "Comprehensive code review using multiple specialized reviewers"
argument-hint: "[--scope <files|changes|all>] [--focus <security|quality|performance>]"
---

Execute comprehensive code review using multiple specialized review agents for complete analysis coverage.

This command coordinates multiple expert reviewers to provide thorough code assessment.

**Review Stages:**
1. Security vulnerability analysis
2. Code quality and maintainability assessment  
3. Performance optimization review
4. Design consistency evaluation

**Agents Coordinated:**
- security-review-coordinator: Security analysis with threat modeling
- code-quality-analyzer: Quality metrics and technical debt assessment
- performance-analyzer: Performance bottleneck identification
- design-analyzer: UI/UX consistency and accessibility review

**Usage:**
- `/review` - Complete multi-perspective code review
- `/review --scope changes --focus security` - Security-focused review of recent changes

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "security-review-coordinator" - pass the scope and security analysis parameters
- Task with subagent_type: "code-quality-analyzer" - pass the code analysis scope and quality focus areas
- Task with subagent_type: "performance-analyzer" - pass the performance analysis parameters
- Task with subagent_type: "design-analyzer" - pass the design review scope and accessibility requirements

Then read outputs, validate them, and create comprehensive review report.

**Error Handling**: Individual reviewer failures are captured, partial results provided with clear coverage gaps documented
**Output Integration**: Results synthesized into unified review with cross-cutting insights and prioritized recommendations
```

**Integration Points:**
- Command manages workflow coordination and progress tracking
- Each agent operates independently with specialized expertise
- Results aggregated and synthesized by command orchestration
- Error handling ensures partial results when individual agents fail
```

## Conditional Integration Pattern

### Context-Aware Agent Selection
```markdown
**Command Structure (Conditional Pattern):**
```markdown
---
description: "Run project tests using appropriate framework-specific testing approach"  
argument-hint: "[--framework <auto|jest|pytest|rspec>] [--coverage] [--fix]"
---

Execute project tests using the most appropriate testing agent based on detected or specified testing framework.

This command adapts its approach based on project characteristics and testing setup.

**Framework Detection Logic:**
- Auto-detection analyzes project files and configuration
- Specialized agents provide framework-optimized testing experience
- Fallback to generic testing approach for unknown frameworks

**Supported Frameworks:**
- **JavaScript/TypeScript**: Uses jest-test-specialist for Jest/Vitest projects
- **Python**: Uses pytest-test-specialist for pytest-based projects
- **Ruby**: Uses rspec-test-specialist for RSpec testing
- **Generic**: Uses project-test-runner for other or unknown frameworks

**Usage:**
- `/test` - Auto-detect framework and execute appropriate tests
- `/test --framework pytest --coverage --fix` - Force pytest with coverage and auto-fix

## Implementation

I will use TodoWrite to track progress, then:

1. **Framework Detection Phase**:
   - Analyze package.json for JavaScript testing frameworks
   - Check requirements.txt and pytest.ini for Python testing
   - Look for Gemfile and spec directories for Ruby testing
   - Examine go.mod for Go testing setup

2. **Conditional Agent Selection**:
   If framework detection finds Jest/Vitest:
   - Task with subagent_type: "jest-test-specialist" - pass test parameters and coverage requirements
   
   If framework detection finds pytest:
   - Task with subagent_type: "pytest-test-specialist" - pass test patterns and fix options
   
   If framework detection finds RSpec:
   - Task with subagent_type: "rspec-test-specialist" - pass spec patterns and coverage settings
   
   Otherwise (unknown or generic):
   - Task with subagent_type: "project-test-runner" - pass generic test execution parameters

3. **Result Processing**:
   - Process framework-specific results into consistent format
   - Include framework detection details in report
   - Provide framework-appropriate recommendations

**Fallback Strategy**: Use project-test-runner with generic detection when specialized agents unavailable
```

**Integration Characteristics:**
- Command analyzes project context before agent selection
- Different agents used based on detected or specified conditions
- Consistent user interface despite varying backend agents
- Graceful fallback ensures functionality across all project types
```

## Parallel Execution Pattern

### High-Performance Multi-Agent Integration
```markdown
**Command Structure (Parallel Pattern):**
```markdown
---
description: "Comprehensive project analysis with parallel specialist assessment"
argument-hint: "[--depth <shallow|standard|deep>] [--focus <all|security|quality|performance>]"
---

Execute comprehensive project analysis using multiple specialist agents running in parallel for optimal performance.

**🚀 CRITICAL: This command uses parallel execution for optimal performance**

**Parallel Analysis Operations:**
1. Security vulnerability scanning (security-review-coordinator)
2. Code quality and technical debt assessment (code-quality-analyzer)  
3. Performance bottleneck identification (performance-analyzer)
4. Design system and accessibility evaluation (design-analyzer)
5. Architecture and dependency analysis (discovery-agent)

**Usage:**
- `/analyze` - Complete project analysis with standard depth
- `/analyze --depth deep --focus security` - Deep security-focused analysis

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "security-review-coordinator" - pass security analysis depth and focus parameters
- Task with subagent_type: "code-quality-analyzer" - pass quality assessment scope and technical debt analysis
- Task with subagent_type: "performance-analyzer" - pass performance analysis parameters and optimization focus
- Task with subagent_type: "design-analyzer" - pass design evaluation scope and accessibility requirements  
- Task with subagent_type: "discovery-agent" - pass architecture analysis parameters for dependency assessment

Then read outputs from all parallel analyses, validate completeness, and create comprehensive project assessment report.

**Performance Benefits**: 5x faster execution compared to sequential analysis, complete assessment in ~2-3 minutes vs 10-12 minutes sequential
**Coordination Strategy**: Results consolidated with cross-analysis insights and unified recommendations prioritized by impact
```

**Parallel Integration Requirements:**
- All Task calls must be in single message for true parallelism
- Agents operate independently with no cross-dependencies
- Command coordinates result aggregation and synthesis
- Error isolation prevents single agent failure from blocking others
```

## Error Handling Integration Patterns

### Graceful Degradation Example
```markdown
**Error Handling in Command-Agent Integration:**

**Primary Execution Path:**
```markdown
Use Task tool with subagent_type: "specialized-analyzer" to perform detailed analysis with project-specific parameters.
```

**Error Handling Logic:**
```markdown
If specialized-analyzer fails or times out:
  Fallback: Use Task tool with subagent_type: "generic-analyzer" with reduced feature set
  
If generic-analyzer also fails:
  Final fallback: Use basic analysis with built-in command logic
  
Always report the level of analysis achieved and any limitations encountered.
```

**User Communication:**
- Clear explanation of what analysis was completed
- Documentation of any limitations or missing coverage
- Recommendations for manual steps to complete analysis
- Guidance for resolving agent failures for future runs
```

## Parameter Passing Patterns

### Direct Parameter Mapping
```markdown
**User Input → Agent Parameters:**

Command receives: `--format json --severity high --output report.json`

Agent Task call:
```markdown
Task with subagent_type: "vulnerability-scanner" - pass the analysis scope with format: json, severity: high, output_file: report.json parameters for vulnerability detection and reporting
```

**Benefits:**
- Simple, direct parameter flow
- Clear traceability from user input to agent execution
- Minimal transformation overhead
```

### Parameter Transformation Pattern
```markdown
**User Input Transformation:**

Command receives: `--quick --verbose`

Transformed for agent:
```markdown
Task with subagent_type: "code-analyzer" - pass analysis parameters with depth: shallow (from --quick), detailed_output: true (from --verbose), include_metrics: false (quick mode optimization)
```

**Use Cases:**
- User-friendly flags mapped to technical parameters
- Multiple user inputs combined into single agent parameter
- Default values applied based on user selections
```

### Context-Enhanced Parameters
```markdown
**Context-Aware Parameter Generation:**

Based on project analysis:
- Detected language: JavaScript/TypeScript  
- Framework: React with Next.js
- Testing: Jest with Testing Library

Agent Task call:
```markdown
Task with subagent_type: "quality-analyzer" - pass analysis parameters enhanced with project context: language: typescript, framework: react-nextjs, testing_framework: jest, optimization_focus: react_patterns, include_accessibility: true
```

**Benefits:**
- Agents receive rich context for optimized analysis
- Framework-specific analysis patterns automatically applied
- Better results through project-aware parameter generation
```

## Integration Validation Patterns

### Command-Agent Contract Validation
```markdown
**Integration Testing Approach:**

1. **Parameter Contract Verification**:
   - Verify command passes all required parameters to agent
   - Test parameter format compatibility between command and agent
   - Validate optional parameter handling and defaults

2. **Output Format Validation**:
   - Verify agent output matches command expectations
   - Test error output handling and user communication
   - Validate result aggregation for multi-agent commands

3. **Error Handling Verification**:
   - Test agent failure scenarios and command response
   - Verify fallback behavior and graceful degradation
   - Test timeout handling and recovery mechanisms
```

These integration examples demonstrate proven patterns for connecting Claudio commands with their specialized agents while maintaining reliability, performance, and user experience.