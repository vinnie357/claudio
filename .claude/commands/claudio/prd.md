---
description: "Create comprehensive Product Requirements Documents with research integration"
argument-hint: "<prd_type> <input_source> [additional_context]"
---

Create comprehensive Product Requirements Documents (PRDs) with clear requirements, success criteria, and implementation plans. Integrates with existing research and discovery analysis to create well-informed requirements.

**Flexible Input Patterns:**
```bash
/claudio:prd feature "user authentication system"     # Direct feature description
/claudio:prd enhancement "use research on performance optimization"  # With research integration
/claudio:prd integration "external_requirements.md"  # From external document
/claudio:prd migration "legacy system analysis"      # Migration requirements
```

**PRD Types:**
- `feature`: New feature development PRD
- `enhancement`: Product improvement/enhancement PRD  
- `integration`: System integration PRD
- `migration`: Data/system migration PRD
- `full`: Complete product PRD with all components

**Input Sources:**
- **Direct Descriptions**: Feature descriptions, objectives, requirements
- **Research Integration**: Automatically incorporates `.claudio/research/` documents when referenced
- **External Documents**: Requirements specs, analysis documents, existing PRDs
- **Discovery Context**: Uses existing `.claudio/docs/discovery.md` for project context

**Research Integration:**
When you reference research (e.g., "use research on security"), the PRD automatically:
- Locates matching `.claudio/research/` documents
- Incorporates research findings into requirements
- References research insights in PRD sections

**Output:**
Creates `.claudio/docs/prd.md` with comprehensive requirements that can be used by the plan command to generate actionable implementation structures.

Task with subagent_type: "prd-agent" - pass the project_path argument for comprehensive Product Requirements Document creation with business objectives, functional requirements, and success criteria enhanced by research integration.

