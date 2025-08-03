---
description: "Comprehensive project analysis and planning system with parallel workflow execution"
argument-hint: "<target_project_path> [--implement]"
---

Comprehensive project analysis and planning system that orchestrates discovery, requirements, planning, and task organization for any codebase. Creates a complete `.claudio/` folder with full project roadmap through parallel workflow execution.

**Standard Workflow** (Recommended):
- Analysis and planning only: `/claudio <project_path>`
- Separate implementation: `/claudio:implement <project_path>`

**Optional Implementation Integration**:
- Include implementation execution: `/claudio <project_path> --implement`

Use the claudio:claudio-coordinator subagent to orchestrate the complete analysis workflow with parallel phase execution. The `--implement` flag optionally includes implementation execution as the final phase.

**Reference**: Uses `.claude/agents/claudio/prompts/claudio/claude.md` for comprehensive workflow templates and execution patterns.

