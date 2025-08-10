---
description: "Comprehensive project analysis and planning system with parallel workflow execution"
argument-hint: "<target_project_path> [--implement]"
---

Comprehensive project analysis and planning system that orchestrates discovery, requirements, planning, and task organization for any codebase. Creates a complete `.claudio/` folder with full project roadmap through parallel workflow execution.

**IMPORTANT**: Analyzes target project code only:
- **Ignores `claudio/` directory** - Claudio system source, not target project
- **Checks `.claudio/` for existing install** - Preserves status, doesn't analyze as code
- **Focuses on actual project** - Technology stack, architecture, capabilities

**Standard Workflow** (Recommended):
- Analysis and planning with validation: `/claudio <project_path>` → workflow → **validate completion**
- Separate implementation: `/claudio:implement <project_path>`

**Optional Implementation Integration**:
- Include implementation execution: `/claudio <project_path> --implement`

Use the claudio-coordinator-agent subagent to orchestrate the complete analysis workflow with parallel phase execution and mandatory workflow validation. The system automatically excludes Claudio system directories to focus on actual project analysis.

**Critical**: The workflow MUST complete with workflow-validator execution and ALL documents in `.claudio/docs/` folder before reporting success.

**CRITICAL**: This command coordinates multiple phases - each phase may use parallel Task invocations in SINGLE messages to ensure optimal workflow execution. 

**Workflow includes automatic final validation** to ensure all documents and project structure are properly generated. The `--implement` flag optionally includes implementation execution as the final phase.

**Reference**: Uses claudio-coordinator-agent for comprehensive workflow orchestration and parallel execution patterns.

