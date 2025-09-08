---
description: "Create actionable phase/task structures from any planning input"
argument-hint: "<plan_type> <input_source> [options]"
---

Create actionable implementation structures with organized phases and executable tasks from any planning input. Always generates `.claudio/phase*/` directories with ready-to-execute task contexts.

**Flexible Input Patterns:**
```bash
/claudio:plan feature "myprd.md"                    # Use external PRD file
/claudio:plan feature "add auth system with JWT"    # Direct feature description  
/claudio:plan enhancement "improve performance, use research on caching and optimization"  # Description with research references
/claudio:plan myexisting_plan.md                    # Update existing plan structure
/claudio:plan refactor "modernize API layer"        # Refactoring plan
```

**Plan Types:**
- `feature`: Single feature implementation structure
- `project`: Complete project implementation structure
- `migration`: System/data migration structure
- `refactor`: Code refactoring and improvement structure
- `integration`: System integration implementation structure
- `enhancement`: Improvement and optimization structure

**Input Sources:**
- **External Files**: Any .md file (PRDs, specs, requirements, existing plans)
- **Direct Descriptions**: Feature descriptions, objectives, requirements
- **Research References**: Automatically incorporates `.claudio/research/` documents when mentioned
- **Existing Plans**: Updates and enhances existing `.claudio/phase*/` structures

**Output Structure:**
- **Phase Directories**: `.claudio/phase1/`, `phase2/`, etc. with organized development phases
- **Task Lists**: `tasks.md` files with specific, actionable development tasks
- **Task Contexts**: Individual `claude.md` contexts for complex tasks with detailed guidance
- **Progress Tracking**: Status files for monitoring implementation progress

**Research Integration:**
When you reference research (e.g., "use research on caching"), the plan automatically:
- Locates matching `.claudio/research/` documents
- Incorporates research findings into task contexts
- References research in implementation guidance

Task with subagent_type: "plan-agent" - pass the project_path argument to transform any planning input into organized, actionable phase/task structures ready for immediate development execution.

