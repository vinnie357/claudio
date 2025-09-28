# Claudio Install Commands Test

This file contains validation prompts to test the `/claudio:install commands` orchestration workflow in a new Claude Code session.

## Purpose

Validate that:
1. **Install Coordinator Orchestration**: The install-coordinator-agent properly manages the commands-only installation workflow
2. **Discovery-Based Localization**: Project discovery analysis generates localized commands and agents without full workflow documents
3. **Parallel Agent Coordination**: Install-coordinator-agent successfully launches installation sub-agents in parallel
4. **Commands-Only System Installation**: All required files are installed to correct locations without PRD/planning documents
5. **Integration Validation**: Installed system components work together correctly

## Sample Application

The validation tests use the DevOps automation suite located in `test/install-commands/`. This application provides:

- **Technology Stack**: Python/FastAPI, Kubernetes, Terraform, CI/CD pipelines
- **Architecture**: Infrastructure automation with multi-cloud deployment capabilities
- **Features**: Complete DevOps automation suite with infrastructure management, deployment pipelines, and monitoring
- **Infrastructure**: Multi-cloud deployment (AWS, Azure, GCP) with Kubernetes orchestration
- **Development Priorities**: Infrastructure-as-Code focus with automation and scalability

This realistic DevOps platform allows thorough testing of Claudio's discovery analysis and project-specific localization capabilities across infrastructure automation, cloud deployment, and CI/CD pipeline development.

## Validation Prompt

```
Please test the Claudio install commands workflow by performing the following validation:

### 1. Install Commands Execution Test
Test the complete `/claudio:install commands` command using the system testing agent:

**Agent Invocation**: "Use the claudio:claudio-install-commands-test subagent to execute and validate the complete /claudio:install commands test/install-commands workflow, including command execution, install-coordinator-agent orchestration, and file system installation validation"

**Expected Behavior**:
a) **Command Execution**: Execute `claude --dangerously-skip-permissions -p "/claudio:install commands test/install-commands"` successfully (commands-only install)
b) **Coordinator Orchestration**: Install-coordinator-agent should orchestrate commands-only workflow (discovery → installation, no PRD/planning)
c) **Discovery Analysis**: Should run project discovery analysis on DevOps automation platform
d) **System Filtering**: Should exclude system components from user installation
e) **File System Installation**: Should create `.claude/` directory structure only (no `.claudio/` workflow documents)

### 2. Install Coordinator Agent Orchestration Test
Verify the install-coordinator-agent manages the commands-only workflow:

The install-coordinator-agent should orchestrate the commands-only workflow through its internal coordination process. This test validates that the single agent invocation above properly manages:

#### Phase 1: Discovery and Validation (Sequential)
a) **Project Discovery**: Analysis of the test/install-commands/ DevOps automation platform to understand technology stack, architecture, and development needs

b) **Discovery Validation**: Launch of the discovery-validator agent to ensure the discovery analysis meets quality standards before proceeding

#### Phase 2: Commands-Only Installation (Parallel)
**CRITICAL: The install-coordinator-agent should run multiple Task invocations in a SINGLE message**
c) **System Installation**: Launch of the install-system-installer agent to generate and install localized commands and agents based on the DevOps automation discovery

d) **Installation Validation**: Launch of the install-validation-coordinator agent to orchestrate comprehensive validation through 5 specialized validators (extended_context dependencies, orchestrator integration, mode compliance, content quality, and command-agent integration)

### 3. File System Validation
After installation completion, verify the following directory structure exists in `test/install-commands/`:

#### Required Directory Structure
- `test/install-commands/.claude/` - Base Claude system directory
- `test/install-commands/.claude/commands/claudio/` - Localized command files
- `test/install-commands/.claude/agents/claudio/` - Localized agent files (flat structure)
- `test/install-commands/.claude/agents/claudio/extended_context/` - Extended context categories
- **NO `.claudio/` directory** - Commands-only mode should not create full workflow documents

#### Required Files Validation

**Commands (minimum 10 files in `test/install-commands/.claude/commands/claudio/`)**:
- claudio.md ✓
- discovery.md ✓ 
- prd.md ✓
- plan.md ✓
- task.md ✓
- implement.md ✓
- documentation.md ✓
- claude-sdk.md ✓
- upgrade.md ✓

**Agents (40+ user components in `test/install-commands/.claude/agents/claudio/`)**:
Core workflow agents, infrastructure agents, documentation agents, quality agents, security agents, development agents, Claude SDK agents (40+ total)

**Extended Context (2-6 categories in `test/install-commands/.claude/agents/claudio/extended_context/`)**:
Only categories referenced by installed agents should be created:
- workflow/ ✓ (if workflow agents installed)
- development/ ✓ (if development agents installed)  
- documentation/ ✓ (if documentation agents installed)
- research/ ✓ (if research agents installed)
- infrastructure/ ✓ (if infrastructure agents installed)
- command-analysis/ ✓ (if Claude SDK agents installed)
- agent-analysis/ ✓ (if Claude SDK agents installed)

**Discovery Document Only**:
- `test/install-commands/.claude/docs/discovery.md` ✓ (DevOps automation platform analysis)
- **NO PRD, plan, or task documents** - Commands-only mode excludes full workflow generation

## Expected Results

### ✅ **Success Criteria**:

#### Install Coordinator Orchestration
- Install-coordinator-agent successfully parses `/claudio:install commands test/install-commands`
- Properly executes commands-only workflow: discovery → installation (no PRD/planning)
- Launches discovery-validator for quality assurance
- Coordinates parallel installation using proper Task tool patterns
- Uses install-validation-coordinator for comprehensive validation through specialized subagents
- Generates commands-only installation report

#### File System Installation
- Complete `.claude/` directory structure created in `test/install-commands/`
- All 9+ user commands installed in correct location with proper localization (install.md excluded)
- All 40+ user agents installed in flat structure under `agents/claudio/` (install agents excluded)
- Extended context categories (2-6 typically) properly organized based on installed agent requirements
- **NO `.claudio/` directory created** - Commands-only mode excludes full workflow documents
- Only `discovery.md` present in `.claude/docs/` (required for localization)
- System components properly excluded from user installation

#### Localization Quality
- Discovery document contains comprehensive DevOps automation platform analysis
- Commands and agents customized for infrastructure automation domain
- Extended context properly references DevOps automation technology stack
- All components work together as integrated system

#### Integration Success
- Command-agent references work correctly
- Extended context access functions properly
- Dynamic location logic handles different installation modes
- No broken references or permission issues

## Post-Validation Actions

### Generate Test Report (Always)
**Generate test_report.md**: Create `test/install-commands/test_report.md` with:
- Test execution status and timestamps
- Enhanced architecture pattern validation results (pass/fail for each pattern)
- File system installation validation details
- Localization quality assessment for DevOps automation platform
- Performance metrics and error details
- Critical issues identified and recommendations
- Overall test status (PASS/FAIL) with detailed breakdown

### If All Tests Pass:
- Document successful commands-only install workflow completion
- Record localization quality for DevOps automation platform
- Validate system ready for development use
- Consider commands-only installation process verified and functional

### If Tests Fail:
- Identify specific failure points in orchestration workflow
- Update agent coordination patterns if needed
- Fix file installation or localization issues
- Retest specific failing components before complete revalidation

## Notes for Implementation

This validation should be run in a **new Claude Code session** after any changes to the install-coordinator-agent or related installation components, as agents are only loaded at session start.

The test focuses on the **commands-only workflow orchestration** rather than full workflow functionality, ensuring the entire commands-only installation system works as an integrated process distinct from full workflow installation.
```

## Validation Execution

Run this validation by copying the validation prompt above into a new Claude Code session and executing the test command. Document results in the accompanying validation results file.