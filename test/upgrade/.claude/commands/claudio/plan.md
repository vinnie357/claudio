---
description: "Create actionable phase/task structures for TaskFlow productivity app development"
argument-hint: "<plan_type> <input_source> [options]"
---

Create actionable implementation structures with organized phases and executable tasks for TaskFlow productivity app development. Always generates `.claudio/phase*/` directories with ready-to-execute task contexts optimized for React Native and Node.js microservices.

**Flexible Input Patterns:**
```bash
/claudio:plan feature "taskflow_prd.md"                    # Use TaskFlow PRD file
/claudio:plan feature "add real-time task sync with WebSockets"    # Direct feature description  
/claudio:plan enhancement "improve mobile performance, use research on React Native optimization"  # Description with research references
/claudio:plan myexisting_plan.md                    # Update existing TaskFlow plan structure
/claudio:plan refactor "modernize microservices API layer"        # Refactoring plan
```

**Plan Types:**
- `feature`: Single TaskFlow feature implementation structure (task management, sync, mobile)
- `project`: Complete TaskFlow project implementation structure
- `migration`: System/data migration structure (database, microservices, architecture)
- `refactor`: Code refactoring and improvement structure for React Native/Node.js
- `integration`: System integration implementation structure (APIs, third-party services)
- `enhancement`: Performance and productivity optimization structure

**Input Sources:**
- **External Files**: Any .md file (TaskFlow PRDs, specs, requirements, existing plans)
- **Direct Descriptions**: TaskFlow feature descriptions, productivity objectives, mobile requirements
- **Research References**: Automatically incorporates `.claudio/research/` documents when mentioned
- **Existing Plans**: Updates and enhances existing `.claudio/phase*/` structures

**TaskFlow-Specific Planning:**
- **Mobile Development**: React Native component structure, platform-specific optimizations, offline capabilities
- **Backend Services**: Node.js microservices architecture, API design, database integration
- **Real-time Features**: WebSocket implementation, synchronization logic, conflict resolution
- **AI Integration**: Machine learning services, task prediction models, analytics implementation

**Output Structure:**
- **Phase Directories**: `.claudio/phase1/`, `phase2/`, etc. with organized TaskFlow development phases
- **Task Lists**: `tasks.md` files with specific, actionable development tasks for React Native and Node.js
- **Task Contexts**: Individual `claude.md` contexts for complex TaskFlow tasks with detailed guidance
- **Progress Tracking**: Status files for monitoring TaskFlow implementation progress

**Research Integration:**
When you reference research (e.g., "use research on mobile performance"), the plan automatically:
- Locates matching `.claudio/research/` documents
- Incorporates TaskFlow-specific research findings into task contexts
- References productivity and mobile development research in implementation guidance

Task with subagent_type: "plan-agent" - pass the project_path argument to transform any TaskFlow planning input into organized, actionable phase/task structures ready for immediate React Native and Node.js development execution.