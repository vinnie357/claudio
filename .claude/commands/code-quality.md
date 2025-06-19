# Code Quality Command

## Description
Execute comprehensive code quality assessment by running the project's linting tools, formatting tools, and test suite with detailed coverage analysis and cyclomatic complexity evaluation, then generate actionable quality reports with prioritized recommendations for improvement.

**Note**: This is an optional command that users can install into their own `.claude/commands/` directory for enhanced project quality analysis.

## Usage
```
/code-quality <assessment_type> [project_path] [report_format]
```

## Parameters
- `assessment_type`: Type of quality assessment to perform
  - `full`: Complete assessment including linting, formatting, testing, coverage, and complexity metrics
  - `lint`: Linting and static analysis only
  - `format`: Code formatting assessment only
  - `test`: Test suite execution with comprehensive coverage analysis only
  - `complexity`: Cyclomatic complexity and maintainability analysis only
  - `coverage`: Detailed code coverage analysis with gap identification
  - `quick`: Fast quality check with essential metrics only
- `project_path`: Path to project directory (defaults to current directory)
- `report_format`: Output format for results
  - `detailed`: Comprehensive report with all findings and recommendations (default)
  - `summary`: Executive summary with key metrics and critical issues
  - `json`: Machine-readable JSON format for CI/CD integration
  - `dashboard`: Interactive dashboard format for team review

## Context
Use the Code Quality agent prompt from `prompts/code-quality/claude.md` to guide the quality assessment process, tool execution, and report generation. The agent automatically detects project type and only includes relevant tool information to minimize context size.

## Instructions
1. **Project Detection**: Analyze project structure to identify technology stack and available tools
2. **Context Optimization**: Include only relevant tool information for the detected project type
3. **Tool Discovery**: Identify available quality tools and their configurations
4. **Quality Assessment**: Execute appropriate tools based on assessment type and project setup
5. **Results Analysis**: Parse tool outputs and generate actionable insights with prioritized recommendations
6. **Report Generation**: Create comprehensive quality reports with improvement roadmaps
7. **Direct Command**: Save to `quality-reports/<project_name>_<assessment_type>_<date>.md`
8. **Within Claudio**: Save to `<target_project>/.claudio/quality/assessment_<date>.md`

## Assessment Types

### Full Assessment (`full`)
- Complete code quality evaluation including all available tools
- Linting analysis with error categorization and fix recommendations
- Code formatting assessment with consistency analysis
- Test suite execution with comprehensive coverage analysis (line, branch, function, statement)
- Cyclomatic complexity analysis with refactoring recommendations
- Maintainability metrics including Halstead measures and technical debt estimation
- Code duplication detection and dependency analysis
- Comprehensive improvement roadmap with prioritized action items

### Linting Assessment (`lint`)
- Execute all available linting tools (ESLint, TSLint, pylint, clippy, etc.)
- Static analysis for code quality issues and security vulnerabilities
- Style violation detection and categorization
- Auto-fix capability analysis and recommendations
- Code complexity and maintainability assessment

### Formatting Assessment (`format`)
- Code formatting consistency analysis across the codebase
- Style guide compliance verification
- Naming convention validation
- Auto-formatting impact assessment
- Configuration recommendations for formatting tools

### Testing Assessment (`test`)
- Test suite execution across all test types (unit, integration, e2e)
- Comprehensive coverage analysis including line, branch, function, and statement coverage
- Coverage gap identification with prioritized testing recommendations
- Test performance and reliability assessment
- Test quality evaluation and improvement suggestions
- Coverage trend analysis and historical comparison

### Complexity Assessment (`complexity`)
- Cyclomatic complexity analysis for all functions and methods
- Identification of functions exceeding complexity thresholds
- Maintainability Index calculation and assessment
- Halstead complexity measures and cognitive complexity analysis
- Code duplication detection and refactoring opportunities
- Dependency coupling analysis and architectural complexity assessment

### Coverage Assessment (`coverage`)
- Detailed code coverage analysis across multiple dimensions
- Line, branch, function, and statement coverage with detailed breakdowns
- Module-level and package-level coverage analysis
- Critical coverage gaps identification in security-sensitive code
- Coverage improvement recommendations with prioritized action items
- Coverage trend tracking and regression detection

### Quick Check (`quick`)
- Essential quality metrics for rapid feedback
- Critical issue identification requiring immediate attention
- Pass/fail status for established quality gates
- High-level recommendations for next actions
- Suitable for CI/CD integration and pull request validation

## Project-Aware Tool Integration

The code-quality agent automatically detects the project type and includes only relevant tools in the analysis context, significantly reducing context size when deployed as an optional command.

### Automatic Project Detection
- **JavaScript/TypeScript**: Detected via package.json, tsconfig.json, .eslintrc files
- **Python**: Detected via requirements.txt, pyproject.toml, setup.py, .python-version
- **Rust**: Detected via Cargo.toml, Cargo.lock files
- **Go**: Detected via go.mod, go.sum files
- **Elixir**: Detected via mix.exs, mix.lock files
- **Java**: Detected via pom.xml, build.gradle, build.sbt files
- **C#**: Detected via .csproj, .sln, packages.config files
- **PHP**: Detected via composer.json, composer.lock files
- **Ruby**: Detected via Gemfile, Gemfile.lock, .gemspec files

### Context Optimization
When deployed to a specific project, the agent will:
1. **Analyze Project Structure**: Identify the primary technology stack
2. **Detect Available Tools**: Check for existing tool configurations
3. **Include Only Relevant Information**: Load only the tool patterns for the detected project type
4. **Provide Targeted Recommendations**: Focus on tools actually used or recommended for the project
5. **Minimize Context Size**: Exclude information about unrelated technologies

### Dynamic Tool Selection Examples

#### Example: Python Project Detection
```
Detected: requirements.txt, setup.py, .pylintrc
Context includes: pylint, black, pytest, coverage.py tools only
Excludes: JavaScript, Rust, Go, Elixir tools and configurations
```

#### Example: Elixir Project Detection  
```
Detected: mix.exs, .credo.exs, dialyzer.plt
Context includes: Credo, Dialyzer, ExUnit, Sobelow tools only
Excludes: Non-Elixir tools and configurations
```

This approach ensures optimal context usage while maintaining comprehensive quality analysis capabilities.

## Integration with Other Agents

### Discovery Integration
- Leverages project structure analysis from discovery phase
- Uses identified tooling and build systems for appropriate tool selection
- References technology stack analysis for language-specific quality standards
- Builds upon dependency analysis for security vulnerability assessment

### Task Integration
- Provides quality validation for implementation task completion
- Generates quality-specific acceptance criteria for development tasks
- Creates improvement tasks based on quality assessment findings
- Supports code review processes with objective quality metrics

### Plan Integration
- Establishes quality gates and milestones within implementation plans
- Provides quality improvement estimates for project planning
- Identifies quality-related dependencies and blockers
- Supports resource allocation for quality improvement initiatives

### Documentation Integration
- Generates quality metrics documentation for project artifacts
- Creates quality standards and guidelines documentation
- Provides quality assessment history for project documentation
- Supports compliance documentation with quality evidence

## Example Usage

### Full Project Assessment
```
/code-quality full ./my-project detailed
```
Generates comprehensive quality report with all tools, metrics, and improvement roadmap

### Quick CI/CD Check
```
/code-quality quick . json
```
Provides machine-readable quality status for automated pipeline integration

### Pre-Release Validation
```
/code-quality full ./production-app dashboard
```
Creates interactive quality dashboard for release readiness review

### Focused Linting Review
```
/code-quality lint ./feature-branch summary
```
Analyzes code quality issues in specific branch with summary report

## Expected Output

### Direct Command Output
- **File Location**: `quality-reports/<project_name>_<assessment_type>_<date>.md`
- **Report Structure**: Comprehensive quality assessment with tool results and recommendations
- **Improvement Roadmap**: Prioritized action items with implementation guidance
- **Quality Metrics**: Baseline metrics for trend tracking and comparison

### Within Claudio Workflow
- **File Location**: `<target_project>/.claudio/quality/assessment_<date>.md`
- **Integration**: Quality findings integrated with project planning and task management
- **Progress Tracking**: Quality improvement tasks added to project roadmap
- **Standards Alignment**: Quality requirements aligned with project standards and guidelines

### JSON Output Format
```json
{
  "project": "project-name",
  "assessment_date": "2025-06-19T10:00:00Z",
  "assessment_type": "full",
  "overall_score": 85,
  "quality_gate": "PASS",
  "tools": {
    "linting": {
      "status": "PASS",
      "errors": 0,
      "warnings": 5,
      "auto_fixable": 3
    },
    "testing": {
      "status": "WARNING",
      "pass_rate": 95.2,
      "coverage": 78.5,
      "failed_tests": 2
    },
    "formatting": {
      "status": "FAIL",
      "files_need_formatting": 12,
      "style_violations": 34
    }
  },
  "action_items": [
    {
      "priority": "critical",
      "category": "security",
      "description": "Fix SQL injection vulnerability in user authentication",
      "file": "src/auth.js:45",
      "estimated_effort": "2 hours"
    }
  ]
}
```

## Continuous Integration Support
- **Pipeline Integration**: JSON output format suitable for CI/CD pipeline consumption
- **Quality Gates**: Configurable pass/fail criteria for automated deployment decisions
- **Trend Tracking**: Historical quality metrics for regression detection
- **Pull Request Validation**: Quick assessment mode for code review quality checks
- **Release Readiness**: Comprehensive assessment for production deployment validation

## Configuration and Customization
- **Tool Configuration**: Automatically detects and uses existing tool configurations
- **Quality Standards**: Adapts to project-specific quality requirements and thresholds
- **Custom Rules**: Supports integration of custom linting rules and quality metrics
- **Reporting Customization**: Flexible report formatting and content customization
- **Integration Settings**: Configurable integration with external quality management systems

This command provides comprehensive code quality assessment capabilities that integrate seamlessly with development workflows while maintaining consistency with the Claudio system's approach to systematic project analysis and improvement.

## Installation for Personal Use

This is an **optional command** that users can install into their own projects for enhanced code quality analysis. To install:

### Option 1: Copy to Project Commands
1. Copy this file to your project's `.claude/commands/` directory:
   ```bash
   mkdir -p .claude/commands
   cp /path/to/claudio/.claude/commands/code-quality.md .claude/commands/
   ```

2. Copy the agent prompt to your project:
   ```bash
   mkdir -p .claude/prompts/code-quality
   cp /path/to/claudio/prompts/code-quality/claude.md .claude/prompts/code-quality/
   ```

### Option 2: Symlink for Updates
1. Create symlinks to stay updated with Claudio improvements:
   ```bash
   mkdir -p .claude/commands .claude/prompts/code-quality
   ln -s /path/to/claudio/.claude/commands/code-quality.md .claude/commands/
   ln -s /path/to/claudio/prompts/code-quality/claude.md .claude/prompts/code-quality/
   ```

### Option 3: Git Submodule (Recommended for Teams)
If using Claudio as a git submodule, the code-quality command is automatically available.

### Project-Specific Dependencies
The agent will automatically detect your project type and only recommend tools relevant to your technology stack. Upon first use, the agent will:

1. **Analyze your project** to determine the primary technology stack
2. **Check for existing tools** and their configurations
3. **Recommend missing tools** that would enhance quality analysis for your specific project type
4. **Provide installation commands** only for tools relevant to your detected project

#### Automatic Tool Detection
The agent will detect and use tools that are already configured in your project, and suggest installing only the tools that are missing but would benefit your specific technology stack.

#### Example: For a detected Python project
```bash
# Agent will only suggest Python-specific tools
pip install radon mccabe coverage pytest-cov
```

#### Example: For a detected Elixir project
```bash
# Agent will only suggest Elixir-specific dependencies
# Add to mix.exs dependencies:
{:credo, "~> 1.7", only: [:dev, :test], runtime: false}
{:dialyxir, "~> 1.3", only: [:dev], runtime: false}
{:sobelow, "~> 0.13", only: [:dev, :test], runtime: false}
{:excoveralls, "~> 0.18", only: :test}
```

This targeted approach minimizes setup overhead and focuses on tools that will actually be used for your project.

### Usage After Installation
Once installed, use the command in your project:

```bash
# Full quality assessment
/code-quality full

# Quick CI/CD check
/code-quality quick . json

# Focus on coverage analysis
/code-quality coverage . detailed
```

The command will automatically detect your project type and use appropriate tools for quality assessment.