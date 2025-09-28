# Development Workflow Examples

This document provides comprehensive examples of development workflow patterns used throughout the Claudio system for code development, quality assurance, and project management.

## Code Quality Assessment Workflow

### Basic Quality Analysis Pattern
```markdown
## Code Quality Assessment Implementation

I will use TodoWrite to track progress, then analyze code quality:

Use TodoWrite to start code quality assessment.

1. **Project Analysis and Tool Detection**:
   Analyze project structure to identify languages, frameworks, and existing quality tools. Configure appropriate linters, formatters, and static analysis tools.

2. **Quality Analysis Execution**:
   Execute detected quality tools (ESLint, Pylint, RuboCop, etc.) and collect metrics on code coverage, complexity, and maintainability indicators.

3. **Results Analysis and Reporting**:
   Generate comprehensive quality report with actionable improvement recommendations and prioritized technical debt assessment.

Use TodoWrite to complete code quality assessment.

**Tools Executed**: Project-specific linters and analyzers based on detected technology stack
```

## Security Review Workflow

### Comprehensive Security Assessment Pattern
```markdown
## Security Review Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

Use TodoWrite to start comprehensive security review.

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "vulnerability-assessment-specialist" - pass the project path for vulnerability scanning and analysis
- Task with subagent_type: "security-architecture-analyst" - pass the architecture review parameters for design security assessment
- Task with subagent_type: "security-threat-modeler" - pass the STRIDE methodology parameters for threat modeling
- Task with subagent_type: "security-diagram-generator" - pass the threat visualization requirements for diagram creation

Then read outputs from all security specialists, validate completeness, and create comprehensive security assessment report.

Use TodoWrite to complete comprehensive security review.

**Performance Benefits**: Complete security review in ~3-4 minutes vs 12-15 minutes sequential, parallel expert analysis with STRIDE methodology
```

## Testing and Validation Workflow

### Project Testing Pattern
```markdown
## Testing Workflow Implementation

I will use TodoWrite to track progress, then execute testing workflow:

Use TodoWrite to start project testing analysis.

1. **Framework Detection**: Identify testing frameworks (Jest, pytest, ExUnit, Go test) and project structure
2. **Test Execution**: Run appropriate test commands based on detected framework with coverage analysis
3. **Result Analysis**: Parse test outputs, identify failures, and generate actionable summary with fix recommendations

Use TodoWrite to complete project testing analysis.

**Conditional Logic**:
- If package.json with Jest detected → Use Jest-specific testing patterns
- If requirements.txt with pytest → Use Python testing patterns  
- If mix.exs detected → Use ExUnit testing patterns
- Otherwise → Use generic project-test-runner
```

### Test-Driven Development Workflow
```markdown
## TDD Workflow Pattern

**Red-Green-Refactor Implementation**:

1. **Red Phase**: Write failing tests for new functionality
   - Use TodoWrite to track test creation progress
   - Generate test templates based on detected testing framework
   - Validate tests fail as expected before implementation

2. **Green Phase**: Implement minimal code to pass tests
   - Execute tests continuously during implementation
   - Focus on making tests pass with minimal code changes
   - Track implementation progress with TodoWrite phases

3. **Refactor Phase**: Improve code while maintaining test coverage
   - Run quality analysis to identify refactoring opportunities
   - Execute full test suite after each refactor step
   - Generate final quality and coverage report
```

## Design and Architecture Workflow

### Design System Analysis Pattern
```markdown
## Design Analysis Implementation  

I will use TodoWrite to track progress, then analyze design system:

Use TodoWrite to start design system analysis.

1. **Component Analysis**: Analyze UI components for consistency, reusability, and accessibility compliance
2. **Design Pattern Assessment**: Evaluate design patterns, user experience flows, and interface consistency
3. **Accessibility Evaluation**: Check WCAG compliance, color contrast, keyboard navigation, and screen reader compatibility

Use TodoWrite to complete design system analysis.

**Design Outputs**: Component inventory, accessibility report, design system recommendations, and UX improvement roadmap
```

## Documentation Workflow

### Comprehensive Documentation Generation Pattern
```markdown
## Documentation Generation Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

Use TodoWrite to start documentation generation.

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "documentation-readme-creator" - pass the project analysis for README generation
- Task with subagent_type: "documentation-api-creator" - pass the API endpoints for API documentation
- Task with subagent_type: "documentation-user-guide-creator" - pass the feature analysis for user guide creation
- Task with subagent_type: "documentation-developer-guide-creator" - pass the architecture analysis for developer documentation

Then read outputs from all documentation creators, validate completeness, and create integrated documentation suite.

Use TodoWrite to complete documentation generation.

**Performance Benefits**: Complete documentation suite generation in ~2-3 minutes with parallel expert creation
```

## Implementation Planning Workflow

### Feature Implementation Pattern
```markdown
## Implementation Planning Workflow

I will use TodoWrite to track progress through implementation planning:

Use TodoWrite to start implementation planning analysis.

1. **Requirements Analysis**: Break down feature requirements into implementable components with clear acceptance criteria
2. **Architecture Planning**: Design system architecture, component interactions, and integration points
3. **Task Breakdown**: Create detailed, executable tasks with time estimates and resource requirements
4. **Risk Assessment**: Identify implementation risks, dependencies, and mitigation strategies

Use TodoWrite to complete implementation planning analysis.

**Planning Outputs**: Implementation phases, task breakdown structure, resource requirements, timeline estimates, risk mitigation plan
```

### Technical Debt Management Workflow
```markdown
## Technical Debt Assessment Pattern

**Systematic Debt Analysis**:

1. **Debt Identification**: 
   - Run code quality analysis to identify technical debt areas
   - Analyze code complexity, duplication, and maintainability metrics
   - Identify outdated dependencies and security vulnerabilities

2. **Impact Assessment**:
   - Quantify technical debt in terms of development time impact
   - Assess business risk and maintenance burden
   - Prioritize debt reduction based on impact and effort

3. **Remediation Planning**:
   - Create prioritized technical debt reduction roadmap
   - Estimate effort and timeline for debt reduction initiatives
   - Integrate debt reduction into development sprint planning
```

## Continuous Integration Workflow

### CI/CD Pipeline Integration Pattern
```markdown
## CI/CD Integration Workflow

**Pipeline Integration Approach**:

1. **Pipeline Analysis**: 
   - Detect existing CI/CD configurations (GitHub Actions, GitLab CI, Jenkins)
   - Analyze current pipeline stages and optimization opportunities
   - Identify testing, quality, and deployment gaps

2. **Quality Gate Integration**:
   - Integrate Claudio quality analysis into CI pipeline
   - Set up automated security scanning and vulnerability assessment
   - Configure test execution and coverage reporting

3. **Deployment Optimization**:
   - Analyze deployment patterns and recommend improvements
   - Integrate monitoring and health check capabilities
   - Optimize pipeline performance and reliability
```

## Performance Optimization Workflow

### Performance Analysis Pattern
```markdown
## Performance Optimization Implementation

I will use TodoWrite to track progress, then analyze performance:

Use TodoWrite to start performance analysis.

1. **Baseline Establishment**: Measure current performance metrics, identify bottlenecks, and establish performance baselines
2. **Optimization Analysis**: Analyze code patterns, database queries, and resource usage for optimization opportunities
3. **Improvement Recommendations**: Generate prioritized optimization recommendations with expected impact assessment

Use TodoWrite to complete performance analysis.

**Performance Focus Areas**: Database query optimization, caching strategies, resource utilization, scalability patterns
```

## Code Review Workflow

### Multi-Perspective Review Pattern
```markdown
## Comprehensive Code Review Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

Use TodoWrite to start multi-perspective code review.

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "security-review-coordinator" - pass the code changes for security vulnerability analysis
- Task with subagent_type: "code-quality-analyzer" - pass the files for quality and maintainability assessment
- Task with subagent_type: "design-analyzer" - pass the UI changes for design consistency review
- Task with subagent_type: "performance-analyzer" - pass the performance-critical code for optimization review

Then read outputs from all reviewers, validate completeness, and create comprehensive review report.

Use TodoWrite to complete multi-perspective code review.

**Review Coverage**: Security vulnerabilities, code quality, design consistency, performance implications, and maintainability assessment
```

## Workflow Integration Patterns

### Command Chaining Pattern
```markdown
**Sequential Workflow Execution**:

Complete development workflow using command chaining:
1. `/claudio:discovery` → Project analysis and setup
2. `/claudio:prd` → Requirements documentation  
3. `/claudio:plan` → Implementation planning
4. `/claudio:code-quality` → Quality baseline establishment
5. `/claudio:security-review` → Security assessment
6. `/claudio:test` → Testing validation
7. `/claudio:documentation` → Documentation generation
```

### Iterative Development Pattern
```markdown
**Sprint-Based Development Cycle**:

Iterative development with Claudio integration:
1. **Sprint Planning**: Use `/claudio:plan` for feature breakdown and estimation
2. **Development**: Regular `/claudio:test` execution during development
3. **Quality Gates**: `/claudio:code-quality` before code review
4. **Security Review**: `/claudio:security-review` before deployment  
5. **Documentation Updates**: `/claudio:documentation` for feature documentation
6. **Retrospective**: Analysis of workflow effectiveness and optimization opportunities
```

These development workflow patterns provide structured approaches for implementing comprehensive development practices with integrated quality assurance, security review, and documentation generation.