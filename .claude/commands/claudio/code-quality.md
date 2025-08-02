---
description: "Execute comprehensive code quality assessment with project-aware tool detection"
argument-hint: "<assessment_type> [project_path] [report_format]"
---

Execute comprehensive code quality assessment by running project-specific linting, formatting, and testing tools with detailed analysis and actionable improvement recommendations.

**Assessment Types:**
- `full`: Complete assessment with all available tools
- `lint`: Static analysis and linting only
- `format`: Code formatting assessment only
- `test`: Test execution with coverage analysis
- `complexity`: Complexity and maintainability analysis
- `coverage`: Detailed coverage gap analysis
- `quick`: Essential metrics for rapid feedback

**Note**: Optional command for enhanced project-specific quality analysis.

Use the claudio:code-quality-analyzer subagent with project-aware tool detection to execute appropriate quality tools and generate comprehensive reports.

