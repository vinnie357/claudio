---
description: "Execute code quality assessment with project-aware tool detection"
argument-hint: "<assessment_type> [project_path] [report_format]"
---

Execute code quality assessment by running project-specific linting, formatting, and testing tools with factual analysis based on actual tool outputs.

**CRITICAL: NEVER fabricate quality metrics or results. Only report actual tool execution outputs and real findings.**

**Assessment Types:**
- `full`: Assessment with all available tools
- `lint`: Static analysis and linting only
- `format`: Code formatting assessment only
- `test`: Test execution with coverage analysis
- `complexity`: Complexity and maintainability analysis
- `coverage`: Coverage gap analysis
- `quick`: Essential metrics for rapid feedback

**Note**: Optional command for enhanced project-specific quality analysis.

Task with subagent_type: "code-quality-analyzer" - pass the project_path argument for project-aware tool detection to execute appropriate quality tools and generate factual reports based on actual analysis.

