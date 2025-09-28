# Plan Command Enhancement Strategy

## Redesign `/claudio:plan` Command for Flexible Input and Structure Generation

### Current Limitations
- Plan command expects specific `.claudio/docs/prd.md` input
- Creates plan.md document instead of actionable structure
- Hard dependency on PRD workflow
- Limited input flexibility

### Target Pattern
```bash
/claudio:plan feature "myprd.md"                    # Use external PRD file
/claudio:plan feature "my feature does x, use research on x and y"  # Direct description with research references  
/claudio:plan myplan_document.md                    # Update existing plan
/claudio:plan enhancement "add auth system"         # Direct feature planning
```

## Enhancement Tasks

### Task 1: Command Interface Redesign
- **Action**: Redesign `/claudio:plan` argument handling to support flexible inputs
- **Input Types**: External files, direct descriptions, research references, existing plans
- **Arguments**: `<plan_type> <input_source> [options]`
- **Status**: completed
- **ActiveForm**: Redesigning plan command argument handling
- **Completed**: Updated command description, argument hints, and comprehensive usage examples

### Task 2: Plan Agent Input Processing
- **Action**: Update plan-agent to handle multiple input types and source materials
- **Requirements**: Parse various input formats, process external documents, detect research references
- **Integration**: Auto-locate `.claudio/research/` documents when referenced
- **Status**: completed
- **ActiveForm**: Updating plan-agent input processing capabilities
- **Completed**: Added flexible input type detection and research auto-detection logic

### Task 3: Remove Hard PRD Dependency
- **Action**: Make PRD optional input rather than required prerequisite
- **Logic**: Plan can work with any planning input, not just formal PRDs
- **Flexibility**: Support direct feature descriptions, external documents, research combinations
- **Status**: completed
- **ActiveForm**: Removing hard PRD dependency from plan workflow
- **Completed**: Removed hard PRD references, made discovery optional, updated workflow integration

### Task 4: Structure Generation Focus
- **Action**: Refactor plan output from plan.md creation to phase structure generation
- **Output**: Always create `.claudio/phase1/`, `phase2/` directories with executable tasks
- **Components**: Generate `tasks.md` files, individual task contexts, progress tracking
- **Status**: completed
- **ActiveForm**: Refactoring plan output to generate actionable phase structures
- **Completed**: Updated agent to focus on directory/task structure creation over document generation

### Task 5: Research Integration Logic
- **Action**: Create automatic research incorporation when user references research documents
- **Pattern**: "use research on x and y" -> auto-locate and incorporate research findings
- **Integration**: Include research context in task planning and execution contexts
- **Status**: completed
- **ActiveForm**: Creating automatic research integration logic
- **Completed**: Added research auto-detection section and integration patterns in both plan and prd agents

### Task 6: Update Capability Implementation
- **Action**: Add ability to enhance existing phase structures rather than overwriting
- **Detection**: Identify existing `.claudio/phase*` structures
- **Enhancement**: Add new tasks, update existing contexts, maintain progress
- **Status**: completed
- **ActiveForm**: Implementing plan update and enhancement capabilities
- **Completed**: Added existing structure detection and enhancement integration logic

### Task 7: External Document Parsing
- **Action**: Add capability to read and process any referenced .md files as planning input
- **Support**: Handle PRDs, specifications, requirements docs, existing plans
- **Processing**: Extract requirements, objectives, constraints from external documents
- **Status**: completed
- **ActiveForm**: Adding external document parsing capabilities
- **Completed**: Updated input processing to handle external files and document references

### Task 8: Agent Context Updates
- **Action**: Update plan-agent instructions to focus on structure creation over document generation
- **Shift**: From "create plan.md" to "create executable phase/task structure"
- **Validation**: Ensure all generated tasks are actionable and properly contextualized
- **Status**: completed
- **ActiveForm**: Updating plan-agent context for structure-focused output
- **Completed**: Completely refactored plan-agent responsibilities, process, and output requirements

## Success Criteria

### ✅ Flexible Input Processing
- **COMPLETED**: Plan command accepts any combination of: external documents, direct descriptions, research references
- **COMPLETED**: Auto-detection of research documents when referenced by user
- **COMPLETED**: Seamless processing of various input formats and sources

### ✅ Actionable Structure Generation
- **COMPLETED**: Every plan execution creates ready-to-execute `.claudio/phase*/` directory structure
- **COMPLETED**: Generated tasks are specific, actionable, and properly contextualized
- **COMPLETED**: Task contexts include relevant research findings and external document insights

### ✅ Update and Enhancement
- **COMPLETED**: Existing phase structures can be enhanced without losing progress
- **COMPLETED**: New requirements can be integrated into existing planning structures
- **COMPLETED**: Maintains continuity of ongoing work while adding new capabilities

### ✅ Research Integration
- **COMPLETED**: Automatic incorporation of `.claudio/research/` documents when referenced
- **COMPLETED**: Research findings integrated into task contexts and execution guidance
- **COMPLETED**: Clear traceability from research to implementation tasks

## Implementation Notes

This enhancement transforms `/claudio:plan` from a document generator into an actionable structure creator that works with any planning input. The focus shifts from creating planning documents to creating executable development structures that teams can immediately begin working with.

Key principle: **Every plan command execution should result in developers having clear, actionable next steps organized in the `.claudio/` structure.**

## Implementation Status: ✅ COMPLETE

**Date Completed**: 2025-01-06  
**Total Tasks**: 8/8 completed  
**Success Criteria**: 4/4 achieved  

**Key Achievements**:
- Plan command now supports flexible input patterns (files, descriptions, research references)
- Plan agent creates actionable phase/task structures instead of static documents
- Automatic research integration when referenced in user input
- Enhanced PRD command with research integration capabilities
- Complete removal of hard PRD dependencies from plan workflow
- Update capability for existing phase structures

The plan command is now a flexible, structure-focused tool that transforms any planning input into executable development phases ready for immediate implementation.