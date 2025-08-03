# Code Quality Agent

## Overview
The Code Quality agent provides comprehensive code quality assessment through automated linting, formatting, and testing. This agent is designed as an **optional command** that users can install into their own projects for enhanced code quality analysis.

## Purpose
This prompt enables systematic code quality evaluation by:
- **Automated Tool Execution**: Running project-specific linting, formatting, and testing tools
- **Comprehensive Coverage Analysis**: Line, branch, function, and statement coverage with gap identification
- **Cyclomatic Complexity Assessment**: Function-level complexity analysis with refactoring recommendations
- **Multi-Language Support**: JavaScript/TypeScript, Python, Rust, Go, Elixir, Java, C#, PHP, Ruby
- **Actionable Reporting**: Prioritized improvement recommendations with implementation guidance

## Key Features
- **Context-Aware Analysis**: Automatically detects project type and includes only relevant tools
- **Multiple Assessment Types**: full, lint, format, test, complexity, coverage, quick
- **Flexible Output Formats**: detailed, summary, json, dashboard
- **CI/CD Integration**: Machine-readable output for automated pipelines
- **Tool Auto-Detection**: Automatically identifies and uses available quality tools
- **Historical Tracking**: Quality trends and regression detection
- **Minimal Context Size**: Only loads information relevant to the detected project technology stack

## Context Optimization for Optional Deployment

When deployed as an optional command to a user's project, the agent optimizes context usage by:

### Project Type Detection
- Analyzes project structure (package.json, Cargo.toml, mix.exs, etc.)
- Identifies primary technology stack and available tools
- Detects existing tool configurations and preferences

### Selective Tool Information
- **JavaScript/TypeScript projects**: Only includes ESLint, Prettier, Jest, etc.
- **Python projects**: Only includes pylint, black, pytest, etc.
- **Elixir projects**: Only includes Credo, Dialyzer, ExUnit, etc.
- **Other languages**: Only relevant tools for the detected project type

### Context Size Benefits
- **Traditional approach**: ~400 lines of tool information for all languages
- **Optimized approach**: ~80-120 lines for the specific project type
- **Reduction**: 70-80% smaller context size when deployed to specific projects

This optimization ensures efficient token usage while maintaining comprehensive quality analysis capabilities for the user's specific technology stack.

## Integration Instructions

This document contains integration instructions for adding code-quality as a standard Claudio workflow component. However, the current implementation treats code-quality as an **optional command** for targeted use.

## Required File Updates

### 1. Claudio Master Agent (`prompts/claudio/claude.md`)

#### Add to Core Responsibilities (after existing responsibilities):
```markdown
6. **Code Quality Assessment**: Use code quality agent context to:
   - Execute comprehensive code quality assessment through automated tools
   - Run project linting, formatting, and test suites
   - Generate quality reports with prioritized improvement recommendations
   - Establish quality baselines and track quality metrics over time
   - Integrate quality validation into project workflow phases
```

#### Add to Workflow Process (as new phase after Task Organization):
```markdown
### Phase 6: Code Quality Assessment
1. Execute comprehensive code quality evaluation
2. Use `prompts/code-quality/claude.md` context for quality assessment
3. Run project-specific linting, formatting, and testing tools
4. Generate quality reports with actionable insights and improvement roadmaps
5. Create quality-focused tasks for issue resolution and improvement
6. Establish quality baselines and validation gates for project phases

### Phase 7: Project Structure Creation (updated numbering)
1. Create comprehensive `.claudio/` folder structure
2. Organize all artifacts and documentation including quality reports
3. Establish progress tracking systems with quality metrics integration
4. Set up task execution contexts with quality validation requirements
```

#### Update Folder Structure (add to existing structure):
```markdown
target_project/
└── .claudio/
    ├── summary.md                 # Executive summary with quality metrics
    ├── discovery.md               # Complete discovery report
    ├── prd.md                     # Product Requirements Document
    ├── plan.md                    # Implementation plan
    ├── status.md                  # Overall project status and quality tracking
    ├── quality/                   # Code quality assessments and reports
    │   ├── assessment_latest.md   # Most recent quality assessment
    │   ├── baseline.md           # Quality baseline and standards
    │   └── improvement_tasks.md   # Quality improvement action items
    ├── research/                  # Research topics organized by category
    ├── docs/                      # Generated documentation
    ├── design/                    # Design specifications and analysis
    ├── phase1/
    │   ├── tasks.md              # Task list with quality validation
    │   ├── quality_status.md     # Phase-specific quality metrics
    │   └── [task directories]    # Individual task contexts with quality requirements
    └── shared/
        ├── standards/
        │   └── claude.md         # Project coding standards with quality requirements
        └── quality/
            └── claude.md         # Quality assessment utilities and standards
```

#### Add Integration Context Section:
```markdown
### Code Quality Integration
- Reference `prompts/code-quality/claude.md` for comprehensive quality assessment methodology
- Apply quality validation to all implementation phases and task completion
- Generate quality-focused improvement tasks and integration with project planning
- Coordinate quality standards with shared standards and development workflows

### Quality Assessment Workflow
1. **Tool Discovery**: Identify available linting, formatting, and testing tools
2. **Baseline Establishment**: Create initial quality baseline and standards
3. **Continuous Assessment**: Integrate quality validation into task completion workflows
4. **Improvement Planning**: Generate quality improvement tasks and integrate with project phases
5. **Progress Tracking**: Monitor quality metrics and trends throughout project development
```

#### Update Execution Workflow (add step):
```markdown
6. **Quality Assessment Execution**: Run comprehensive code quality assessment
7. **Quality Integration**: Integrate quality findings with project planning and task management
8. **Structure Creation**: Build complete `.claudio/` folder with all artifacts including quality reports
9. **Status Initialization**: Set up progress tracking and status management with quality metrics
```

### 2. Task Agent (`prompts/task/claude.md`)

#### Add to Context Integration section:
```markdown
### Code Quality Integration
- Use `prompts/code-quality/claude.md` context for quality validation requirements
- Generate quality-focused acceptance criteria for development tasks
- Create quality improvement tasks based on assessment findings
- Establish quality gates and validation checkpoints within task workflows
```

#### Add to Task Templates:
```markdown
### Quality Validation Task Template
```markdown
## Task: [Quality Improvement Task Name]
**ID**: [Phase].[Task Number]
**Priority**: High/Medium/Low
**Effort**: [Hours/Days]
**Type**: Quality Improvement/Bug Fix/Standards Compliance

### Quality Issue Description
[Detailed description of quality issue from assessment]

### Acceptance Criteria
- [ ] [Quality metric improvement target]
- [ ] [Specific code quality issue resolved]
- [ ] [Test coverage improvement achieved]
- [ ] [Linting/formatting compliance verified]

### Quality Validation
- **Before**: [Current quality metrics]
- **Target**: [Desired quality metrics]
- **Validation**: [How improvement will be measured]

### Dependencies
- **Quality Assessment**: [Baseline quality assessment completed]
- **Tool Setup**: [Required quality tools available and configured]
- **Standards**: [Project quality standards defined]
```

### 3. Plan Agent (`prompts/plan/claude.md`)

#### Add to Integration with Code Quality Agent section:
```markdown
### Integration with Code Quality Agent:
When implementation planning includes quality requirements:
- Reference quality assessment results from `prompts/code-quality/claude.md`
- Include quality validation phases in implementation timeline
- Allocate time for quality improvement and technical debt reduction
- Plan quality gates and validation checkpoints throughout development phases
- Coordinate quality improvement tasks with feature development schedules
```

#### Add to Phase Templates:
```markdown
#### Quality Validation Phase
```markdown
## Phase [N]: Quality Validation and Improvement
**Duration**: [X weeks/days]
**Focus**: Code quality assessment and improvement

### Key Activities
- Comprehensive code quality assessment
- Quality issue resolution and improvement
- Test coverage enhancement and validation
- Code formatting and style consistency
- Technical debt reduction and refactoring

### Time Allocation
- Quality assessment: 20% of phase time
- Issue resolution: 50% of phase time
- Test coverage improvement: 20% of phase time
- Documentation and validation: 10% of phase time
```

### 4. Shared Standards (`shared/standards/claude.md`)

#### Add Quality Standards section:
```markdown
## Code Quality Standards

### Quality Assessment Requirements
- **Linting**: Zero errors, minimal warnings with justification
- **Test Coverage**: Minimum 80% coverage for critical functionality
- **Code Formatting**: Consistent formatting using project-standard tools
- **Static Analysis**: Clean static analysis results with security compliance
- **Documentation**: Comprehensive code documentation and comments

### Quality Tools Integration
- **JavaScript/TypeScript**: ESLint, Prettier, Jest, TypeScript compiler
- **Python**: pylint, Black, pytest, mypy, bandit
- **Rust**: clippy, rustfmt, cargo test, cargo audit
- **Go**: golint, gofmt, go test, staticcheck
- **Multi-language**: SonarQube, CodeClimate, security scanning tools

### Quality Gates
- **Development**: Linting passes, tests pass, coverage maintained
- **Pre-merge**: Full quality assessment passes with no critical issues
- **Release**: Comprehensive quality validation with improvement roadmap
- **Production**: Quality monitoring and continuous improvement tracking
```

### 5. README.md Updates

#### Add to Available Commands table:
```markdown
| Command | Purpose | Usage Example |
|---------|---------|---------------|
| `/code-quality` | Execute comprehensive code quality assessment | `/code-quality full ./my-project` |
```

#### Add to Command Descriptions:
```markdown
### Code Quality Assessment
Execute comprehensive code quality assessment including linting, formatting, and testing:

```bash
# Full quality assessment with detailed report
/code-quality full ./my-project detailed

# Quick quality check for CI/CD
/code-quality quick . json

# Focus on test coverage analysis
/code-quality test ./project summary
```

**Outputs**: Quality assessment reports with prioritized improvement recommendations
**Integration**: Included in standard Claudio workflow for comprehensive project health evaluation
```

### 6. CLAUDE.md System Architecture Updates

#### Add to Core Components section:
```markdown
- **`prompts/code-quality/claude.md`**: Code quality assessment and tool execution
```

#### Add to Commands section:
```markdown
- **`/code-quality`**: Comprehensive code quality assessment with tool execution
```

#### Update Claudio Workflow Output:
```markdown
└── .claudio/
    ├── summary.md              # Executive overview with quality metrics
    ├── quality/                # Code quality assessments and reports
    │   ├── assessment_latest.md # Most recent comprehensive assessment
    │   ├── baseline.md         # Quality baseline and improvement tracking
    │   └── improvement_tasks.md # Quality-focused action items
```

#### Add to Integration Benefits:
```markdown
- **Quality-Driven**: All implementation validated through comprehensive quality assessment
- **Standards-Enforced**: Consistent code quality standards across project development
- **Improvement-Focused**: Systematic quality improvement integrated with project planning
```

## Implementation Steps

1. **Update Claudio Master Agent**: Add code quality as Phase 6 in standard workflow
2. **Update Related Agents**: Add code quality integration to Task and Plan agents
3. **Update Shared Standards**: Include comprehensive quality standards and requirements
4. **Update Documentation**: Add code quality command to README and system architecture
5. **Test Integration**: Validate code quality integration with example projects

## Quality Metrics Integration

### Baseline Establishment
- Initial quality assessment creates baseline metrics for project
- Quality standards aligned with project type and technology stack
- Improvement targets established based on project requirements and timeline

### Progress Tracking
- Quality metrics tracked throughout development phases
- Quality improvement tasks integrated with project task management
- Quality trends monitored and reported in project status updates

### Continuous Improvement
- Regular quality assessments identify improvement opportunities
- Quality-focused tasks created and prioritized within project workflow
- Quality validation integrated into task completion and phase gate criteria

This integration ensures that code quality assessment becomes a standard part of the Claudio workflow while maintaining the flexibility to be used as a standalone command for specific quality evaluation needs.