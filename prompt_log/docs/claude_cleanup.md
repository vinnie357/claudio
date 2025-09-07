# CLAUDE.md Cleanup Plan

## Objective
Transform current 673-line CLAUDE.md from human documentation into concise agent control specifications (~150-200 lines).

## Task Breakdown

### Task 1: Content Analysis
- **Content**: "Read current CLAUDE.md and identify agent-critical vs human documentation sections"
- **Status**: "pending"
- **ActiveForm**: "Analyzing CLAUDE.md content sections"
- **Acceptance Criteria**: Clear categorization of essential vs removable content

### Task 2: Core Architecture Extraction
- **Content**: "Extract Commands → Agents → Extended Context mapping structure"
- **Status**: "pending" 
- **ActiveForm**: "Extracting core system architecture"
- **Acceptance Criteria**: Preserved command-to-agent relationships and extended context paths

### Task 3: Critical Patterns Identification
- **Content**: "Identify essential execution patterns (Task invocation, parallel execution, naming)"
- **Status**: "pending"
- **ActiveForm**: "Identifying critical execution patterns"
- **Acceptance Criteria**: All agent control patterns preserved without explanatory text

### Task 4: Content Removal
- **Content**: "Remove tutorials, explanations, getting started guides, and pseudo-code examples"
- **Status**: "pending"
- **ActiveForm**: "Removing human documentation content"
- **Acceptance Criteria**: No human-readable tutorials or workflow explanations remain

### Task 5: Agent Specifications Consolidation
- **Content**: "Consolidate system vs user classification, model assignments, and workflow rules"
- **Status**: "pending"
- **ActiveForm**: "Consolidating agent control specifications"
- **Acceptance Criteria**: Essential agent control information organized and accessible

### Task 6: Structure Optimization
- **Content**: "Create streamlined 150-200 line structure focused on agent workflow control with navigation system"
- **Status**: "pending"
- **ActiveForm**: "Optimizing structure for agent use with information discovery"
- **Acceptance Criteria**: Concise structure with agent-critical information and clear navigation to detailed sources

### Task 7: Validation
- **Content**: "Verify all critical agent control information is preserved and accessible"
- **Status**: "pending"
- **ActiveForm**: "Validating streamlined CLAUDE.md completeness"
- **Acceptance Criteria**: No loss of essential workflow control capabilities

## Current Issues with CLAUDE.md
- 673 lines of human documentation vs agent control information
- Extensive tutorials and explanations not needed by agents
- Pseudo-code examples that agents don't need
- Performance explanations and getting started guides
- Redundant information across multiple sections

## Content to Remove
- All human tutorials and usage examples
- Getting started guides and explanations  
- Performance benefits descriptions
- Detailed workflow explanations
- Documentation structure references
- Pseudo-code in markdown blocks
- Redundant pattern examples

## Content to Preserve
- Agent naming conventions (lowercase-hyphen)
- Task invocation patterns for commands
- System component classification rules
- Extended context structure mapping
- Model assignment strategy
- Anti-fabrication requirements
- Critical execution patterns

## Essential Navigation References
CLAUDE.md must include clear navigation to detailed information sources:

- **Agent Index**: `.claude/agents/claudio/index.md` - complete agent catalog with capabilities
- **Command Index**: `.claude/commands/index.md` - command specifications and arguments  
- **Extended Context**: `.claude/agents/claudio/extended_context/` - detailed workflow contexts
- **Research Documents**: `.claudio/research/` - project-specific research and analysis
- **System Documentation**: `docs/` - technical architecture and implementation details

### Information Discovery Patterns
- How agents access detailed specifications when needed
- Where to find missing extended context
- Navigation to research documents for project-specific analysis
- Access patterns for system documentation and technical details

## Expected Outcome
- Streamlined CLAUDE.md (~150-200 lines)
- Pure agent control specifications
- No human tutorials or explanations
- Direct agent instruction format only
- Commands → Agents → Extended Context workflow control
- Navigation to detailed specifications when needed
- Information discovery system for agents
- Clear access patterns for extended context and research documents

## Implementation Status Tracking

### TodoWrite Integration Pattern
All tasks should use TodoWrite pattern for status tracking:

```
Use TodoWrite to start Task N - Task Name.
[Implementation steps]
Use TodoWrite to complete Task N - Task Name.
```

### Task Status Overview
- **Total Tasks**: 7
- **Pending**: 7
- **In Progress**: 0
- **Completed**: 0

### Implementation Readiness
✅ **READY TO BEGIN**: All tasks defined with clear acceptance criteria
✅ **NAVIGATION REQUIREMENTS**: Essential information sources identified
✅ **CONTENT STRATEGY**: Clear removal and preservation guidelines
✅ **VALIDATION APPROACH**: Completeness verification defined

**Next Step**: Begin Task 1 with TodoWrite status tracking

## Implementation Results

### File Size Transformation
- **Original CLAUDE.md**: 761 lines 
- **Streamlined CLAUDE_STREAMLINED.md**: 182 lines
- **Reduction**: 76% smaller (579 lines removed)

### Content Analysis Completed
**REMOVED (Human Documentation):**
- Lines 1-20: Project descriptions and documentation structure references
- Lines 245-391: Quick start guides, installation tutorials, system explanations  
- Lines 392-422: "What claudio means" explanations and integration descriptions
- Lines 424-477: Workflow execution pattern explanations
- Lines 479-536: Subagent command invocation explanations  
- Lines 538-577: System reliability explanations
- Lines 663-673: Getting started guides and changelog references
- Multiple sections: Performance benefits, tutorials, pseudo-code examples

**PRESERVED & ENHANCED (Agent Control):**
- Navigation First: Clear paths to index files, extended context, research docs
- Critical Execution Patterns: Task invocation, parallel execution, TodoWrite integration
- System Architecture: Commands → Agents → Extended Context mapping (condensed)
- Component Classification: System vs User with clear tagging rules
- Model Assignments: Distribution strategy and implementation format
- Command Development Standards: Mandatory patterns and anti-patterns
- File Validation Rules: Zero tolerance for non-existent references
- TodoWrite Requirements: Command and agent responsibilities

### Implementation Status - COMPLETE
✅ **Task 1**: Content analysis completed - categorized all sections
✅ **Task 2**: Core architecture extracted - Commands → Agents → Extended Context mapping
✅ **Task 3**: Critical patterns identified - Task invocation, parallel execution, naming
✅ **Task 4**: Content removal completed - All human documentation removed
✅ **Task 5**: Agent specifications consolidated - System vs User, model assignments, workflow rules
✅ **Task 6**: Structure optimized - 182 lines with navigation system
✅ **Task 7**: Validation completed - All critical information preserved and accessible

### Transformation Success Metrics
- **Conciseness**: 76% reduction while preserving all critical agent control information
- **Navigation**: Added clear paths to detailed specifications when needed
- **Focus**: Pure agent instructions without human tutorial content
- **Completeness**: All essential workflow control patterns preserved
- **Accessibility**: Information discovery system for comprehensive details

**STATUS**: COMPLETE - Ready for implementation (replace CLAUDE.md with CLAUDE_STREAMLINED.md)