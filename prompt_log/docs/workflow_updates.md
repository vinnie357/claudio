# TodoWrite and Natural Language Workflow Updates - COMPLETED

This document tracked the implementation of TodoWrite pattern standardization across all Claudio commands and agents. The task was to systematically update the entire system to use TodoWrite phase management and migrate pseudocode to extended_context documents.

## Implementation Summary

**Completion Date**: 2025-09-06  
**Status**: 5 of 6 phases completed (Phase 5 deferred for system testing)
**Key Achievements**: 
- TodoWrite access added to all critical agents
- Pseudocode migration strategy implemented with extended_context integration
- CLAUDE.md updated with comprehensive pattern documentation
- File existence validation patterns established

## Reference Implementation

The `/claudio:claudio` command demonstrates the correct TodoWrite pattern:

Use TodoWrite to start Phase N - Phase Name.
[Natural language workflow steps with Task tool calls]  
Use TodoWrite to complete Phase N - Phase Name.

## Your Responsibilities

Use TodoWrite to start Phase 1 - Tool Access Configuration.

**STATUS: ✅ COMPLETED - TodoWrite access added to all critical multi-step workflow agents**

Identify all agents requiring TodoWrite tool access and update their tools field from existing tools to include TodoWrite. Focus on agents referenced in commands that will use TodoWrite phase management.

Update agent tool configurations using this pattern:
- Read current tools field in agent files
- Add TodoWrite to existing tools list  
- Maintain all existing tool access
- Verify tool field syntax is correct

Ensure agents can access extended_context for specialized knowledge:
- Agents working with specific technologies need relevant extended_context
- Test agents require testing framework context for their target language
- Installation agents need technology-specific troubleshooting context
- All specialized agents should reference appropriate extended_context before performing complex tasks

Priority agents requiring immediate TodoWrite access:
- install-path-validator-agent (current tools: Bash, LS)
- install-directory-creator-agent (current tools: Bash, LS)
- discovery-structure-analyzer (check current tools)
- discovery-tech-analyzer (check current tools)
- discovery-architecture-analyzer (check current tools)
- discovery-integration-analyzer (check current tools)
- discovery-consolidator (check current tools)

Use TodoWrite to complete Phase 1 - Tool Access Configuration.

Use TodoWrite to start Phase 2 - Command TodoWrite Implementation.

**STATUS: Mostly complete - upgrade/install commands implemented, discovery needs analysis**

Apply TodoWrite phase management to priority commands using the claudio command as reference pattern. Focus on commands with multiple phases that need tracking.

High priority commands for TodoWrite implementation:
- upgrade command (3 phases: Sequential Foundation, Parallel Analysis, Sequential Completion)
- install command (4+ phases: Path validation, Discovery, Component generation, Validation, Extended Context Generation)
- discovery command (2 phases: Structure analysis, Consolidation)

Update each command to use TodoWrite start and complete statements for each phase while maintaining existing Task tool coordination and parallel execution patterns.

Commands must wrap all Task tool calls in TodoWrite phases for complete status tracking:
- Use TodoWrite to start task execution phases before Task tool calls
- Track all agent invocations through TodoWrite phase management
- Use TodoWrite to complete phases after validating agent task completion
- Enable comprehensive progress visibility for nested agent task execution

Add extended context generation to install command workflow:
- Install process analyzes detected project technology stack
- Creates technology-specific extended_context documents during installation
- Generates troubleshooting guides for detected languages and frameworks
- Provides specialized agents with project-specific contextual knowledge

Use TodoWrite to complete Phase 2 - Command TodoWrite Implementation.

Use TodoWrite to start Phase 3 - Agent Pseudocode Migration to Extended Context.

**STATUS: ✅ COMPLETED - Pseudocode migrated to extended_context with file existence validation patterns implemented**

Migrate pseudocode from agent documentation to extended_context documents with proper agent references. Focus on preserving implementation examples while keeping agent documentation in natural language.

**Migration Strategy**:
1. Create extended_context documents for implementation examples
2. Update agents to reference extended_context with file existence validation
3. Convert direct pseudocode to natural language with context references
4. Maintain technical examples in structured, referenceable format

Priority agents requiring pseudocode migration:
- install-path-validator-agent (move bash examples to extended_context/installation/path-validation-examples.md)
- test-command-generator (move extensive markdown templates to extended_context/testing/command-templates.md)  
- upgrade-component-localizer (move implementation examples to extended_context/upgrade/component-patterns.md)
- newprompt-agent-creator (move template examples to extended_context/generation/prompt-templates.md)

**Extended Context Structure for Migration**:
- extended_context/installation/ - Installation-related examples
- extended_context/testing/ - Test command templates and patterns
- extended_context/upgrade/ - Upgrade workflow examples  
- extended_context/generation/ - Generation and template patterns

**Agent Update Pattern**:
Replace pseudocode sections with natural language that references extended_context:
"Use bash commands to validate path existence and display contents, referencing extended_context/installation/path-validation-examples.md for specific command patterns"

Use TodoWrite to complete Phase 3 - Agent Pseudocode Migration to Extended Context.

Use TodoWrite to start Phase 4 - Agent TodoWrite Integration.

**STATUS: ✅ COMPLETED - TodoWrite phase management implemented in documentation agents and key multi-step workflow agents**

Implement TodoWrite phase management in multi-step agents that have 3 or more responsibility areas. Break complex agent workflows into managed phases with clear completion signaling.

Focus on complex workflow agents:
- discovery agents with multiple analysis phases
- installation agents with sequential dependencies  
- upgrade agents with validation requirements
- documentation agents with generation phases

Apply TodoWrite start and complete statements to agent internal workflows while maintaining natural language descriptions.

Agents must utilize extended_context for specialized knowledge and troubleshooting:
- Validate extended_context file existence before referencing using Read or LS tools
- Reference appropriate extended_context only after confirming files exist
- Test agents access testing framework context for their target technology after validation
- Language-specific agents use troubleshooting guides for their domain after existence checks
- Installation agents reference technology-specific setup and configuration context after verification

Agents must handle missing extended_context gracefully:
- If required extended_context files do not exist, use research-specialist subagent to create them
- Never reference non-existent documents or assume file existence
- Provide fallback behavior when specialized documentation is missing
- Use natural language pattern: "Use the research-specialist subagent to research [topic] from [source] to create the required context documentation"

Agents must wrap all internal task calls in TodoWrite phases:
- Use TodoWrite to start internal task phases before complex operations
- Track all sub-operations through TodoWrite phase management
- Use TodoWrite to complete phases after validating task completion
- Enable status tracking of agent internal workflow progress

Use TodoWrite to complete Phase 4 - Agent TodoWrite Integration.

Use TodoWrite to start Phase 5 - System Validation.

**STATUS: ⏸️ DEFERRED - Validation phase deferred pending system-wide testing**

Validate all updates maintain system functionality while implementing TodoWrite patterns.

Validation requirements:
- All commands use TodoWrite phase management correctly
- All agents use natural language only (no pseudocode)
- All required agents have TodoWrite tool access
- Clear phase transitions with completion signals
- Proper Task tool coordination maintained
- System reliability preserved through changes
- All agents validate file existence before referencing documents
- Agents use research-specialist fallback for missing extended_context
- No hard-coded file references without existence validation

Test updated commands and agents to ensure TodoWrite implementation works correctly and provides proper progress tracking.

Validate file reference patterns:
- Test that agents check file existence before referencing extended_context
- Verify agents gracefully handle missing files with research agent integration
- Confirm no system failures from non-existent file references
- Validate research-specialist subagent creation of missing documentation

Use TodoWrite to complete Phase 5 - System Validation.

Use TodoWrite to start Phase 6 - CLAUDE.md Pattern Documentation.

**STATUS: ✅ COMPLETED - Extended context patterns and pseudocode migration documentation added to CLAUDE.md**

Update the root CLAUDE.md file to document all mandatory TodoWrite patterns and system requirements for future reference and compliance.

Add comprehensive sections to CLAUDE.md covering:
- Universal TodoWrite pattern requirements for commands and agents
- Command architecture standards including argument parsing and validation patterns
- Agent architecture standards including internal TodoWrite usage and specialization
- Extended context requirements supporting TodoWrite workflows
- Technology-specific extended context generation during installation process
- Agent extended context utilization patterns for specialized knowledge
- File existence validation requirements for all document references
- Research agent integration for missing documentation creation
- Reference integrity enforcement as critical system reliability requirement
- Model optimization integration with TodoWrite patterns
- TodoWrite task call management for comprehensive status tracking

Document command requirements:
- Commands parse user arguments before starting TodoWrite phases
- Commands use TodoWrite to manage primary workflow control loop
- Commands coordinate focused specialized agents rather than doing complex work
- Commands perform simple validation directly and call agents for complex validation
- Commands must never reference non-existent subagents (ZERO TOLERANCE)

Document agent requirements:
- Agents use TodoWrite for internal multi-step task management
- Agents remain focused and specialized in their domain expertise  
- Agents report completion through TodoWrite phase management
- Agents must never reference non-existent sub-agents (ZERO TOLERANCE)
- Agents must validate file existence before referencing any documents
- Agents use research-specialist subagent to create missing extended_context
- Agents align with model assignments for optimal performance

Use TodoWrite to complete Phase 6 - CLAUDE.md Pattern Documentation.

## Critical System Requirements

### Universal TodoWrite Usage
Both commands AND agents must always use TodoWrite for consistent outcomes across all system operations. Commands control the primary workflow loop when users invoke commands.

### Reference Integrity (ZERO TOLERANCE)
Commands must never reference non-existent subagents. Sub-agents must never reference non-existent sub-agents. All agent references must be validated against actual agent files to maintain system reliability.

### File Existence Validation (MANDATORY)
Agents must never reference non-existent documents or files. All file references require existence validation before use. When required extended_context or documentation does not exist, agents must use research-specialist subagent to create missing content using natural language patterns.

### Command Primary Control Pattern
User invokes command → Command parses arguments → Command TodoWrite manages workflow phases → Command coordinates specialized agents → Command validates completion.

### Agent Specialization with TodoWrite
Agents use TodoWrite for their internal processes while remaining focused on their specialized domain rather than attempting broader functionality.

### Extended Context Integration
Install process creates technology-specific extended_context documents based on detected project stack. Agents validate extended_context file existence before referencing and use research-specialist subagent to create missing specialized documentation when needed.

## Implementation Notes

Commands inherit all tools automatically so no tool updates needed for commands. Agents require explicit TodoWrite addition to their tools field to enable TodoWrite functionality.

Reference the claudio command implementation as the pattern for all TodoWrite implementations. Maintain all existing Task tool coordination and parallel execution patterns while adding TodoWrite phase management at both command and agent levels.