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

Use the claudio:claudio-coordinator subagent to orchestrate the complete analysis workflow with parallel phase execution and automatic validation. The system automatically excludes Claudio system directories to focus on actual project analysis. 

**Workflow includes automatic final validation** to ensure all documents and project structure are properly generated. The `--implement` flag optionally includes implementation execution as the final phase.

**Reference**: Uses `.claude/agents/claudio/prompts/claudio/claude.md` for comprehensive workflow templates and execution patterns.

