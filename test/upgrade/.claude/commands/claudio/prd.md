---
description: "Create comprehensive Product Requirements Documents for TaskFlow productivity app features"
argument-hint: "<prd_type> <input_source> [additional_context]"
---

Create comprehensive Product Requirements Documents (PRDs) for TaskFlow productivity application features with clear requirements, success criteria, and implementation plans. Integrates with TaskFlow discovery analysis to create well-informed requirements optimized for React Native and Node.js architecture.

**Flexible Input Patterns:**
```bash
/claudio:prd feature "task synchronization enhancement"     # Direct feature description
/claudio:prd enhancement "use research on performance optimization"  # With research integration
/claudio:prd integration "external_requirements.md"  # From external document
/claudio:prd migration "microservices architecture migration"      # Migration requirements
```

**PRD Types:**
- `feature`: New TaskFlow feature development PRD
- `enhancement`: Productivity app improvement/enhancement PRD  
- `integration`: System integration PRD (API, database, third-party services)
- `migration`: Data/system migration PRD for TaskFlow architecture
- `full`: Complete TaskFlow product PRD with all components

**Input Sources:**
- **Direct Descriptions**: TaskFlow feature descriptions, productivity objectives, user requirements
- **Research Integration**: Automatically incorporates `.claudio/research/` documents when referenced
- **External Documents**: Requirements specs, user research, productivity analysis documents
- **Discovery Context**: Uses existing `.claudio/docs/discovery.md` for TaskFlow project context

**TaskFlow-Specific Examples:**
- **Task Management Features**: Intelligent task prioritization, AI-powered task suggestions, cross-platform sync
- **Mobile Experience**: React Native offline capabilities, platform-specific optimizations, real-time updates
- **Backend Services**: Node.js microservices, PostgreSQL data management, WebSocket synchronization
- **AI Integration**: Machine learning task completion prediction, smart categorization, productivity analytics

**Research Integration:**
When you reference research (e.g., "use research on productivity patterns"), the PRD automatically:
- Locates matching `.claudio/research/` documents
- Incorporates TaskFlow-specific research findings into requirements
- References productivity and synchronization insights in PRD sections

**Output:**
Creates `.claudio/docs/prd.md` with comprehensive TaskFlow requirements that can be used by the plan command to generate actionable implementation structures for React Native apps, Node.js services, and productivity workflows.

Task with subagent_type: "prd-agent" - pass the project_path argument for comprehensive TaskFlow Product Requirements Document creation with productivity objectives, functional requirements, and success criteria enhanced by research integration and mobile-first architecture considerations.