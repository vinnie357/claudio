# Claudio Install Test

This file contains validation prompts to test the `/claudio:install` command orchestration workflow in a new Claude Code session.

## Purpose

Validate that:
1. **Install Full Workflow Orchestration**: The install-full-workflow-agent properly manages the complete installation workflow
2. **Discovery-Based Localization**: Project discovery analysis generates localized commands and agents
3. **Direct Implementation**: Install-full-workflow-agent directly implements complete workflow without sub-agent coordination
4. **Complete System Installation**: All required files are installed to correct locations
5. **Integration Validation**: Installed system components work together correctly

## Sample Application

The validation tests use the ShopFlow e-commerce platform located in `test/install/`. This application provides:

- **Technology Stack**: Node.js microservices, PostgreSQL, MongoDB, Redis, RabbitMQ
- **Architecture**: Microservices with REST APIs and GraphQL interfaces
- **Features**: Complete e-commerce platform with user management, product catalog, orders, payments
- **Infrastructure**: AWS cloud deployment with Docker/Kubernetes
- **Development Priorities**: 4-phase implementation plan with scalability focus

This realistic e-commerce platform allows thorough testing of Claudio's discovery analysis and project-specific localization capabilities across backend architecture, API design, database design, and cloud infrastructure.

## Validation Prompt

```
Please test the Claudio install command workflow by performing the following validation:

### 1. Install Command Execution Test
Test the complete `/claudio:install` command using the system testing agent:

**Agent Invocation**: "Use the claudio:claudio-install-test subagent to execute and validate the complete /claudio:install test/install workflow, including command execution, install-full-workflow-agent implementation, and file system installation validation"

**Expected Behavior**:
a) **Command Execution**: Execute `claude --dangerously-skip-permissions -p "/claudio:install test/install"` successfully (full workflow install)
b) **Full Workflow Implementation**: Install-full-workflow-agent should implement complete workflow (discovery → PRD → planning → tasks)
c) **Discovery Analysis**: Should run project discovery analysis on ShopFlow platform
d) **Requirements Creation**: Should generate PRD based on ShopFlow e-commerce analysis
e) **Implementation Planning**: Should create implementation plan for ShopFlow enhancement
f) **Task Breakdown**: Should break down plan into executable tasks
g) **System Filtering**: Should exclude system components from user installation
h) **File System Installation**: Should create both `.claude/` and `.claudio/` directory structures

### 2. Install Full Workflow Agent Implementation Test
Verify the install-full-workflow-agent implements the complete workflow:

The install-full-workflow-agent should implement the complete workflow through its internal implementation process. This test validates that the single agent invocation above properly manages:

#### Phase 1: Discovery and Validation (Sequential)
a) **Project Discovery**: Analysis of the test/install/ ShopFlow e-commerce platform to understand technology stack, architecture, and development needs

b) **Discovery Validation**: Launch of the discovery-validator agent to ensure the discovery analysis meets quality standards before proceeding

#### Phase 2: Complete Workflow Generation (Sequential)
c) **Requirements Generation**: Launch claudio:prd-agent to create product requirements based on ShopFlow analysis

d) **Implementation Planning**: Launch claudio:plan-agent to create implementation plan for ShopFlow enhancements

e) **Task Breakdown**: Launch claudio:task-agent to break down the plan into executable tasks with contexts

#### Phase 3: Parallel Installation Coordination
**CRITICAL: The install-full-workflow-agent should implement complete workflow through direct execution**
f) **System Installation**: Launch of the install-system-installer agent to generate and install localized commands and agents based on the ShopFlow discovery

g) **Installation Validation**: Launch of the install-validation-coordinator agent to orchestrate comprehensive validation through 5 specialized validators (extended_context dependencies, orchestrator integration, mode compliance, content quality, and command-agent integration)

### 3. File System Validation
After installation completion, verify the following directory structure exists in `test/install/`:

#### Required Directory Structure
- `test/install/.claude/` - Base Claude system directory
- `test/install/.claude/commands/claudio/` - Localized command files
- `test/install/.claude/agents/claudio/` - Localized agent files (flat structure)
- `test/install/.claude/agents/claudio/extended_context/` - Extended context categories
- `test/install/.claudio/docs/` - Workflow documentation directory
- `test/install/.claudio/phase1/` - Phase 1 tasks with contexts
- `test/install/.claudio/phase2/` - Phase 2 tasks with contexts
- `test/install/.claudio/status.md` - Workflow progress tracking

#### Required Files Validation

**Commands (minimum 10 files in `test/install/.claude/commands/claudio/`)**:
- claudio.md ✓
- discovery.md ✓ 
- prd.md ✓
- plan.md ✓
- task.md ✓
- implement.md ✓
- documentation.md ✓
- claude-sdk.md ✓
- upgrade.md ✓

**Agents (40+ user components in `test/install/.claude/agents/claudio/`)**:
Core workflow agents:
- claudio-coordinator-agent.md ✓
- discovery-agent.md ✓
- prd-agent.md ✓
- plan-agent.md ✓
- task-agent.md ✓
- implement-agent.md ✓

Infrastructure agents (system components excluded):
- upgrade-orchestrator-agent.md ✓
- (6 upgrade sub-agents) ✓

Documentation agents:
- documentation-coordinator.md ✓
- documentation-api-creator.md ✓
- documentation-readme-creator.md ✓
- documentation-developer-guide-creator.md ✓
- documentation-user-guide-creator.md ✓

Quality and testing agents:
- code-quality-analyzer.md ✓
- test-command-generator.md ✓
- test-review.md ✓
- discovery-validator.md ✓
- workflow-validator.md ✓

Security agents:
- security-review-coordinator.md ✓
- security-architecture-analyst.md ✓
- security-threat-modeler.md ✓
- security-diagram-generator.md ✓
- vulnerability-assessment-specialist.md ✓

Development and generation agents:
- new-command-generator.md ✓
- new-command-validator.md ✓
- newprompt-coordinator.md ✓
- newprompt-agent-creator.md ✓
- newprompt-command-creator.md ✓
- newprompt-integration-planner.md ✓
- design-analyzer.md ✓
- research-specialist.md ✓
- git-commit-message.md ✓

Claude SDK agents:
- claude-sdk-architect.md ✓
- claude-commands-analyst.md ✓
- claude-subagents-analyst.md ✓
- phoenix-dev-executor.md ✓

**Extended Context (4-6 categories in `test/install/.claude/agents/claudio/extended_context/`)**:
Only categories referenced by installed agents should be created:
- workflow/ ✓ (required for workflow agents)
- development/ ✓ (required for development agents)  
- documentation/ ✓ (required for documentation agents)
- research/ ✓ (required for research agents)
- infrastructure/ ✓ (if infrastructure agents installed)
- command-analysis/ ✓ (if Claude SDK agents installed)
- agent-analysis/ ✓ (if Claude SDK agents installed)

**Workflow Documents (full workflow in `test/install/.claudio/docs/`)**:
- discovery.md ✓ (ShopFlow e-commerce platform analysis)
- prd.md ✓ (Product requirements based on ShopFlow analysis) 
- plan.md ✓ (Implementation plan for ShopFlow enhancements)
- executive-summary.md ✓ (Overview of complete analysis and planning)

**Task Breakdown (in `test/install/.claudio/phase1/`, `phase2/`, etc.)**:
- Task contexts with acceptance criteria
- Implementation guidance
- Testing requirements

### 4. Localization Validation
Verify that installed components are properly localized for the ShopFlow e-commerce platform:

a) **Discovery Document Content**:
   - Verify `test/install/.claudio/docs/discovery.md` contains comprehensive analysis of ShopFlow platform
   - Should include technology stack identification (Node.js, PostgreSQL, MongoDB, Redis, etc.)
   - Should include architecture analysis (microservices, APIs, cloud infrastructure)
   - Should include development priorities and enhancement opportunities

b) **Localized Commands**:
   - Verify commands in `test/install/.claude/commands/claudio/` reference ShopFlow-specific context
   - Check that command descriptions reflect e-commerce domain knowledge
   - Ensure agent references use correct `claudio:agent-name` patterns

c) **Localized Agents**:
   - Verify agents in `test/install/.claude/agents/claudio/` include ShopFlow-specific guidance
   - Check that agent extended context references are properly configured
   - Ensure agents include dynamic context location logic

### 5. Integration Testing
Test that the installed system components work together:

a) **Command-Agent Integration**:
   - Verify commands can successfully invoke their corresponding agents
   - Test that agent namespace references (`claudio:agent-name`) resolve correctly
   - Ensure no broken references between commands and agents

b) **Extended Context Access**:
   - Verify agents can access extended context files from proper locations
   - Test dynamic context location logic (project vs user mode)
   - Ensure context references match actual file locations

c) **System Functionality**:
   - Test that the installed Claudio system can execute basic workflows
   - Verify that localized content enhances functionality for ShopFlow platform
   - Ensure no file permission or access issues

### 6. System Component Exclusion Verification
Verify that system components are properly excluded from user installation:

a) **System Commands Exclusion**:
   - Verify `install.md` is NOT present in `test/install/.claude/commands/claudio/`
   - Confirm system-only commands remain available only in main Claudio directory

b) **System Agents Exclusion**:
   - Verify install-full-workflow-agent.md is NOT present in `test/install/.claude/agents/claudio/` (system component excluded)
   - Verify install-system-installer.md is NOT present in `test/install/.claude/agents/claudio/`  
   - Verify install-validation-coordinator.md and 5 validation subagents are NOT present in `test/install/.claude/agents/claudio/`
   - Confirm system-only agents remain available only in main Claudio directory

c) **User Components Presence**:
   - Verify all workflow agents ARE present (discovery, prd, plan, task, implement)
   - Verify all development agents ARE present (documentation, security, quality, etc.)
   - Verify upgrade agents ARE present (users need these for project upgrades)

### 7. Install Validation Coordination Verification
Verify the install-validation-coordinator properly orchestrates comprehensive validation through specialized subagents:

a) **Structural Validation**:
   - Confirms all required directories exist
   - Validates flat agent structure (no subdirectories under agents/claudio/ except extended_context/)
   - Checks extended context categories are present

b) **Content Validation**:
   - Verifies file integrity and readability
   - Checks file sizes and content patterns
   - Validates discovery.md exists for localization

c) **Integration Validation**:
   - Tests command-agent namespace references
   - Validates extended context location logic
   - Confirms dynamic location patterns are present

## Expected Results

### ✅ **Success Criteria**:

#### Install Coordinator Orchestration
- Install-coordinator-agent successfully parses `/claudio:install test/install`
- Properly executes complete workflow: discovery → PRD → planning → task breakdown
- Launches discovery-validator for quality assurance
- Coordinates workflow agents (prd-agent, plan-agent, task-agent) in sequence
- Coordinates parallel installation using proper Task tool patterns
- Generates comprehensive installation report

#### File System Installation
- Complete `.claude/` directory structure created in `test/install/`
- All 9+ user commands installed in correct location with proper localization (install.md excluded)
- All 40+ user agents installed in flat structure under `agents/claudio/` (install agents excluded)
- All 7 extended context categories properly organized
- Complete `.claudio/` workflow structure created with:
  - `docs/discovery.md` - ShopFlow analysis
  - `docs/prd.md` - Product requirements based on analysis
  - `docs/plan.md` - Implementation plan
  - `docs/executive-summary.md` - Complete overview
  - `phase1/`, `phase2/`, etc. - Task breakdown with contexts
  - `status.md` - Workflow progress tracking
- System components properly excluded from user installation

#### Localization Quality
- Discovery document contains comprehensive ShopFlow platform analysis
- PRD reflects e-commerce platform requirements and enhancement opportunities
- Implementation plan addresses ShopFlow's specific technology stack and architecture
- Task breakdown provides executable contexts for ShopFlow development
- Commands and agents customized for e-commerce domain
- Extended context properly references ShopFlow technology stack
- All components work together as integrated system

#### Integration Success
- Command-agent references work correctly
- Extended context access functions properly
- Dynamic location logic handles different installation modes
- No broken references or permission issues

### ❌ **Failure Indicators**:

#### Orchestration Failures
- Install-coordinator-agent fails to parse command parameters
- Discovery analysis incomplete or missing for ShopFlow platform
- Discovery-validator not executed or reports quality issues
- Parallel agent coordination fails or uses sequential fallback
- System installation or validation sub-agents fail

#### File System Issues
- Missing or incomplete directory structure
- Commands not properly localized for ShopFlow platform
- Agents installed in wrong locations (subdirectories instead of flat)
- Extended context categories missing or improperly organized
- Discovery.md missing or contains generic content

#### Integration Problems
- Command-agent namespace references broken
- Extended context files not accessible
- Dynamic location logic missing or incorrect
- File permissions prevent system functionality

## Troubleshooting Guide

### If Install Command Fails:
1. Check that test/install/ directory exists and is accessible
2. Verify Claude Code has write permissions for target directory
3. Ensure install-full-workflow-agent exists and is properly configured
4. Check command syntax: `claude --dangerously-skip-permissions -p "/claudio:install test/install"`

### If Discovery Analysis Fails:
1. Verify test/install/README.md exists with ShopFlow platform description
2. Check that discovery-agent is available and functional
3. Ensure discovery-validator can access analysis outputs
4. Confirm discovery analysis covers technology stack and architecture

### If File Installation Fails:
1. Check install-system-installer agent exists and functions
2. Verify target directory permissions allow file creation
3. Ensure all template files exist in source Claudio installation
4. Check that localization process completes without errors

### If Integration Issues:
1. Verify install-validation-coordinator and its 5 specialized validators complete successfully
2. Check that all namespace references use correct patterns
3. Ensure extended context files are properly linked
4. Test dynamic location logic with different installation modes

## Post-Validation Actions

### Generate Test Report (Always)
**Generate test_report.md**: Create `test/install/test_report.md` with:
- Test execution status and timestamps
- Enhanced validation architecture results (install-validation-coordinator + 5 specialists)
- File system installation validation details
- Workflow generation validation (discovery, PRD, plan, tasks)
- Localization quality assessment for ShopFlow e-commerce platform
- Integration testing results and performance metrics
- Error details and failure analysis (if applicable)
- Critical issues identified and recommendations
- Overall test status (PASS/FAIL) with detailed breakdown

### If All Tests Pass:
- Document successful install workflow completion
- Record localization quality for ShopFlow platform
- Validate system ready for development use
- Consider installation process verified and functional

### If Tests Fail:
- Identify specific failure points in orchestration workflow
- Update agent coordination patterns if needed
- Fix file installation or localization issues
- Retest specific failing components before complete revalidation

## Notes for Implementation

This validation should be run in a **new Claude Code session** after any changes to the install-full-workflow-agent or related installation components, as agents are only loaded at session start.

The test focuses on the **complete workflow orchestration** rather than individual component functionality, ensuring the entire installation system works as an integrated process.
```

## Validation Execution

Run this validation by copying the validation prompt above into a new Claude Code session and executing the test command. Document results in the accompanying validation results file.