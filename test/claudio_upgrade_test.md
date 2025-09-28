# Claudio Upgrade Test

This file contains validation prompts to test the `/claudio:upgrade` command orchestration workflow in a new Claude Code session.

## Purpose

Validate that:
1. **Upgrade Orchestrator Coordination**: The upgrade-orchestrator-agent properly manages the complete upgrade workflow with 6 specialized subagents
2. **Parallel Batch Execution**: Upgrade system successfully executes parallel coordination patterns for optimal performance
3. **Legacy Pattern Cleanup**: Phase 0 legacy cleanup works correctly while preserving user content
4. **Backup and Safety Features**: Comprehensive backup creation, changelog generation, and rollback capabilities
5. **File Integrity Validation**: All components are updated correctly with proper validation, including extended_context alignment with installed agents
6. **Performance Optimization**: Parallel execution achieves expected performance improvements

## Sample Application

The validation tests use the TaskFlow productivity app located in `test/upgrade/`. This application provides:

- **Technology Stack**: React Native, Node.js, AI/ML services, cross-platform sync
- **Architecture**: Microservices with GraphQL federation, real-time WebSocket connections
- **Features**: TaskFlow personal productivity app with AI-powered insights and cross-platform synchronization
- **Infrastructure**: Multi-platform deployment (iOS, Android, Web, Desktop) with AI/ML backend services
- **Development Priorities**: Architecture modernization with AI enhancement and feature expansion
- **Legacy Installation**: Existing v2.2.1 Claudio installation requiring upgrade to current version

This realistic productivity platform with an existing legacy Claudio installation allows thorough testing of the upgrade system's capabilities across complex architecture analysis, AI/ML development workflows, and multi-platform development coordination.

## Validation Prompt

```
Please test the Claudio upgrade workflow by performing the following validation:

### 1. Upgrade Command Execution Test
Test the complete `/claudio:upgrade` command using the system testing agent:

**Agent Invocation**: "Use the claudio:claudio-upgrade-test subagent to execute and validate the complete /claudio:upgrade test/upgrade workflow, including command execution, upgrade-orchestrator-agent coordination with 6 specialized subagents, and parallel batch execution validation"

**Expected Behavior**:
a) **Command Execution**: Execute `claude --dangerously-skip-permissions -p "/claudio:upgrade test/upgrade"` successfully (full upgrade with legacy cleanup)
b) **Orchestrator Coordination**: Upgrade-orchestrator-agent should coordinate 6 specialized subagents using parallel batch patterns
c) **Legacy Cleanup**: Should detect and clean up deprecated patterns in existing v2.2.1 installation
d) **Backup Creation**: Should create comprehensive timestamped backups with rollback capabilities
e) **Template Localization**: Should re-localize components based on current TaskFlow productivity app analysis
f) **Installation Validation**: Should validate all components updated correctly with integrity checks

### 2. Upgrade Orchestrator Agent Coordination Test
Verify the upgrade-orchestrator-agent manages the complete 6-subagent workflow:

The upgrade-orchestrator-agent should orchestrate the specialized subagent workflow through its internal coordination process. This test validates that the single agent invocation above properly manages:

#### Phase 1: Sequential Foundation (Dependencies)
a) **Discovery Analysis**: Launch upgrade-discovery-analyzer to analyze project discovery and installation status, including path resolution and compatibility assessment

b) **Legacy Cleanup** (if needed): Launch upgrade-legacy-cleaner to perform Phase 0 legacy pattern cleanup while preserving all user content

#### Phase 2: Parallel Analysis Batch
**CRITICAL: The upgrade-orchestrator-agent should run multiple Task invocations in a SINGLE message**
c) **Template Analysis**: Launch upgrade-template-analyzer to analyze template differences, detect conflicts, and plan localization strategy

d) **Backup Management**: Launch upgrade-backup-manager to create comprehensive timestamped backups and prepare rollback scripts

#### Phase 3: Parallel Execution Batch  
**CRITICAL: The upgrade-orchestrator-agent should run multiple Task invocations in a SINGLE message**
e) **Component Localization**: Launch upgrade-component-localizer to execute localization plan, apply updates, and preserve user customizations

f) **Installation Validation**: Launch upgrade-installation-validator to validate file integrity, verify pattern compliance, validate extended_context alignment with installed agents, and generate completion reports

### 3. Parallel Batch Execution Validation
Verify that the upgrade system properly executes parallel batches for performance optimization:

a) **Phase 2 Parallel Coordination**: 
   - Template analysis and backup creation should run simultaneously
   - Both operations should complete before Phase 3 begins
   - Performance improvement should be evident over sequential execution

b) **Phase 3 Parallel Coordination**:
   - Component localization and installation validation should run simultaneously
   - Real-time progress monitoring during parallel operations
   - Error isolation ensures individual failures don't block other operations

c) **Performance Metrics**:
   - Parallel execution should demonstrate improved performance over sequential execution
   - Resource optimization through concurrent operations
   - Reduced overall upgrade time and better user experience

### 4. Legacy Pattern Cleanup Validation
Verify Phase 0 legacy cleanup functionality:

a) **Legacy Pattern Detection**:
   - Should detect deprecated patterns in existing v2.2.1 installation
   - Should identify outdated component structures and naming conventions
   - Should preserve all user content while modernizing system structure

b) **Cleanup Execution**:
   - Should safely remove deprecated patterns without data loss
   - Should modernize directory structures and file organization
   - Should maintain user customizations and project-specific content

### 5. Backup and Safety Feature Validation
Verify comprehensive backup and rollback capabilities:

a) **Backup Creation**:
   - Should create timestamped backup of current installation state
   - Should generate detailed changelog documenting all planned changes
   - Should prepare rollback scripts for easy reversion if needed

b) **Rollback Readiness**:
   - Should validate backup integrity before proceeding with changes
   - Should provide clear rollback instructions and scripts
   - Should maintain rollback capability throughout entire upgrade process

### 6. File System Validation
After upgrade completion, verify the updated directory structure in `test/upgrade/`:

#### Updated Directory Structure
- `test/upgrade/.claude/` - Upgraded Claude system directory
- `test/upgrade/.claude/commands/claudio/` - Updated command files with current patterns
- `test/upgrade/.claude/agents/claudio/` - Updated agent files with current naming and structure
- `test/upgrade/.claude/agents/claudio/extended_context/` - Updated extended context with current organization (only categories referenced by installed agents)
- `test/upgrade/.claudio/` - Updated workflow documents (if existing) with current structure

#### Backup Files
- `test/upgrade/.claude/backup_[timestamp]/` - Complete backup of previous installation
- `test/upgrade/.claude/upgrade_changelog_[date].md` - Detailed changelog of all changes
- `test/upgrade/.claude/rollback_[timestamp].sh` - Rollback script for reversion

#### Updated Components
- **Commands**: All commands updated with current patterns and TaskFlow-specific localization
- **Agents**: All agents updated with proper Task tool patterns and current naming conventions
- **Extended Context**: Extended context updated with current organization and TaskFlow technology references (only categories referenced by installed agents)
- **Workflow Documents**: Existing workflow documents updated to current structure (if present)

### 7. Localization Quality Validation
Verify that upgraded components are properly re-localized for the TaskFlow productivity platform:

a) **Discovery Re-Analysis**:
   - Should perform fresh discovery of TaskFlow app's current state
   - Should identify technology stack updates and architecture changes
   - Should detect new development priorities and enhancement opportunities

b) **Component Re-Localization**:
   - Should update commands to reference current TaskFlow context and AI/ML development
   - Should update agents to include TaskFlow-specific guidance and productivity app insights
   - Should update extended context to reflect current multi-platform architecture (only creating categories referenced by installed agents)

c) **Pattern Modernization**:
   - Should apply current Task tool patterns throughout all components
   - Should use current naming conventions and structure organization
   - Should implement current parallel execution guidance where appropriate

### 8. Performance and Error Handling Validation
Verify upgrade system performance and error handling capabilities:

a) **Performance Optimization**:
   - Should demonstrate improved performance through parallel batch execution
   - Should show efficient resource utilization during concurrent operations
   - Should complete upgrade faster than sequential execution would

b) **Error Handling**:
   - Should handle individual subagent failures gracefully without blocking other operations
   - Should provide clear error messages and resolution guidance
   - Should maintain backup and rollback capability even during error conditions

c) **Progress Monitoring**:
   - Should provide real-time progress updates during upgrade process
   - Should show status of parallel operations and overall completion percentage
   - Should generate comprehensive upgrade report upon completion

## Expected Results

### ✅ **Success Criteria**:

#### Upgrade Orchestrator Coordination
- Upgrade-orchestrator-agent successfully parses `/claudio:upgrade test/upgrade`
- Properly executes all 6 specialized subagents in correct sequence with parallel batches
- Coordinates legacy cleanup, backup creation, template analysis, localization, and validation
- Demonstrates proper parallel batch execution for Phases 2 and 3
- Generates comprehensive upgrade completion report

#### Parallel Batch Execution
- **Phase 2**: Template analysis and backup creation run simultaneously
- **Phase 3**: Component localization and installation validation run simultaneously  
- Performance improvement demonstrated over sequential execution
- Error isolation working correctly with individual operation monitoring
- Real-time progress tracking during parallel operations

#### Legacy Cleanup and Safety
- Legacy patterns detected and cleaned up while preserving user content
- Comprehensive timestamped backups created with rollback scripts
- File integrity maintained throughout upgrade process
- Rollback capability available and validated

#### Component Modernization
- All components updated with current Task tool patterns
- Current naming conventions applied throughout system
- Extended context updated with current organization structure (only categories needed by installed agents)
- TaskFlow-specific localization updated based on current project analysis

#### Integration and Performance
- All upgraded components work together correctly
- No broken references or integration issues
- Performance optimization through parallel execution validated
- Comprehensive upgrade reporting and documentation

### ❌ **Failure Indicators**:

#### Orchestration Failures
- Upgrade-orchestrator-agent fails to coordinate 6 specialized subagents
- Parallel batch execution fails or falls back to sequential execution
- Legacy cleanup causes data loss or corruption
- Backup creation fails or rollback scripts are invalid

#### Performance Issues
- No performance improvement demonstrated over sequential execution
- Parallel operations conflict or cause resource contention
- Upgrade process takes longer than expected or times out
- Error handling fails to isolate individual operation failures

#### Component Update Issues
- Components not updated with current patterns or naming conventions
- TaskFlow-specific localization not applied or contains generic content
- Extended context not updated with current organization structure or contains unused categories
- Integration issues between updated components

#### Safety and Validation Problems
- Backup integrity validation fails or backups are incomplete
- Rollback scripts don't work or are missing critical components  
- File integrity validation fails or reports corruption
- User content lost or corrupted during upgrade process

## Post-Validation Actions

### Generate Test Report (Always)
**Generate test_report.md**: Create `test/upgrade/test_report.md` with:
- Test execution status and timestamps
- Parallel batch execution results (6 specialized upgrade subagents)
- Legacy cleanup validation and safety feature verification
- Component modernization and re-localization results
- TaskFlow productivity platform upgrade quality assessment
- Performance metrics for parallel vs sequential upgrade execution
- Backup and rollback capability validation
- Error details and failure analysis (if applicable)
- Critical issues identified and recommendations
- Overall test status (PASS/FAIL) with detailed breakdown

### If All Tests Pass:
- Document successful upgrade workflow completion with performance metrics
- Record localization quality improvements for TaskFlow productivity platform
- Validate upgraded system ready for development use with all modern patterns
- Consider upgrade process verified and production-ready

### If Tests Fail:
- Identify specific failure points in orchestration workflow or parallel execution
- Update subagent coordination patterns if needed
- Fix parallel batch execution issues or safety feature problems
- Retest specific failing components before complete revalidation

## Notes for Implementation

This validation should be run in a **new Claude Code session** after any changes to the upgrade-orchestrator-agent or related upgrade components, as agents are only loaded at session start.

The test focuses on **complete upgrade orchestration with parallel batch execution** rather than individual subagent functionality, ensuring the entire upgrade system works as an integrated, high-performance process with comprehensive safety features.
```

## Validation Execution

Run this validation by copying the validation prompt above into a new Claude Code session and executing the test command. Document results in the accompanying validation results file.