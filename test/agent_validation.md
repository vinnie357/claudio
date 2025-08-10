# Agent Validation Test

This file contains validation prompts to test the restructured Claudio agent system in a new Claude Code session after implementing the agent renaming and extended context restructure.

## Purpose

Validate that:
1. **Agent Invocation**: Renamed agents can be properly invoked using `claudio:agent-name` pattern
2. **Agent Selection**: Agent descriptions are sufficiently detailed for Claude Code to select appropriate agents
3. **Extended Context**: New extended context structure works with agent references
4. **System Integration**: Overall restructured system functions correctly
5. **Sample Application**: Test environment provides realistic codebase for validation

## Sample Application

The validation tests use a sample Elixir Phoenix application located in `test/claudio-agents/`. This application provides:

- **Technology Stack**: Phoenix LiveView, GenServer state management, REST API
- **Features**: Task management with real-time updates, statistics, and CRUD operations
- **Architecture**: Clear separation of concerns with business logic, web layer, and data storage
- **Testing**: Comprehensive ExUnit test suite
- **Enhancement Opportunities**: Multiple areas for feature additions (auth, dark mode, persistence, etc.)

This realistic codebase allows thorough testing of Claudio's discovery, analysis, and planning capabilities across backend architecture, frontend development, API design, and testing strategies.

## Validation Prompt

```
Please test the restructured Claudio agent system by performing the following validations:

### 1. Agent Availability Test
List all available claudio namespace agents and verify the following **43 agents** are present:

#### Core Workflow Agents
- claudio:discovery-agent (formerly discovery-orchestrator)
- claudio:prd-agent (formerly prd-orchestrator)
- claudio:plan-agent (formerly plan-orchestrator)
- claudio:task-agent (formerly task-orchestrator)
- claudio:implement-agent (formerly implement-orchestrator)
- claudio:claudio-coordinator-agent (formerly claudio-coordinator)
- claudio:claudio-structure-creator-agent (formerly claudio-structure-creator)

#### Infrastructure & Installation Agents
- claudio:install-coordinator-agent
- claudio:upgrade-orchestrator-agent (lightweight coordinator)
- claudio:upgrade-discovery-analyzer (project discovery and installation analysis)
- claudio:upgrade-legacy-cleaner (Phase 0 legacy pattern cleanup)
- claudio:upgrade-template-analyzer (template comparison and localization planning)
- claudio:upgrade-backup-manager (backup creation and version management)
- claudio:upgrade-component-localizer (component re-localization execution)
- claudio:upgrade-installation-validator (post-upgrade validation and reporting)
- claudio:install-system-installer
- claudio:install-validator

#### Documentation Agents
- claudio:documentation-coordinator
- claudio:documentation-api-creator
- claudio:documentation-developer-guide-creator
- claudio:documentation-readme-creator
- claudio:documentation-user-guide-creator

#### Quality & Testing Agents
- claudio:code-quality-analyzer
- claudio:test-command-generator
- claudio:test-review
- claudio:discovery-validator
- claudio:workflow-validator

#### Security Agents
- claudio:security-review-coordinator
- claudio:security-architecture-analyst
- claudio:security-threat-modeler
- claudio:security-diagram-generator
- claudio:vulnerability-assessment-specialist

#### Development & Generation Agents
- claudio:new-command-generator
- claudio:new-command-validator
- claudio:newprompt-coordinator
- claudio:newprompt-agent-creator
- claudio:newprompt-command-creator
- claudio:newprompt-integration-planner
- claudio:design-analyzer
- claudio:research-specialist
- claudio:git-commit-message

#### Claude SDK Agents
- claudio:claudio-claude-sdk-architect (Claude SDK orchestrator)
- claudio:claudio-claude-commands-analyst (command analysis specialist)
- claudio:claudio-claude-subagents-analyst (agent analysis specialist)

### 2. Agent Invocation Test
Test agent invocation using the new naming pattern with the sample application in `test/claudio-agents/`:

#### Phase 1: Discovery (Sequential - Foundation)
a) **Discovery Agent Test**:
   "Use the claudio:discovery-agent subagent to analyze the test/claudio-agents/ project's structure and technology stack"

#### Phase 2: Core Workflow (Parallel Batch 1)
**Run multiple Task invocations in a SINGLE message**:
b) **PRD Agent Test**:
   "Use the claudio:prd-agent subagent to help create requirements documentation for adding user authentication to the task manager application in test/claudio-agents/"

c) **Planning Agent Test**:
   "Use the claudio:plan-agent subagent to create an implementation plan for adding dark mode to the task manager application in test/claudio-agents/"

d) **Task Agent Test**:
   "Use the claudio:task-agent subagent to break down the dark mode implementation plan into executable tasks for the test/claudio-agents/ application"

e) **Implementation Test**:
   "Use the claudio:implement-agent subagent to execute planned tasks for adding a new feature to the test/claudio-agents/ application"

#### Phase 3: Documentation Suite (Parallel Batch 2)
**Run multiple Task invocations in a SINGLE message**:
f) **Documentation Coordinator Test**:
   "Use the claudio:documentation-coordinator subagent to orchestrate comprehensive documentation creation for the test/claudio-agents/ application"

g) **API Documentation Test**:
   "Use the claudio:documentation-api-creator subagent to create API reference documentation for the test/claudio-agents/ REST endpoints"

h) **README Creation Test**:
   "Use the claudio:documentation-readme-creator subagent to create a comprehensive README for the test/claudio-agents/ project"

i) **User Guide Test**:
   "Use the claudio:documentation-user-guide-creator subagent to create user documentation for the task manager application"

#### Phase 4: Quality & Security Analysis (Parallel Batch 3)
**Run multiple Task invocations in a SINGLE message**:
j) **Code Quality Test**:
   "Use the claudio:code-quality-analyzer subagent to analyze code quality and technical debt in the test/claudio-agents/ application"

k) **Security Review Test**:
   "Use the claudio:security-review-coordinator subagent to perform comprehensive security analysis of the test/claudio-agents/ application"

l) **Test Generation Test**:
   "Use the claudio:test-command-generator subagent to create testing workflows for the test/claudio-agents/ application"

m) **Vulnerability Assessment Test**:
   "Use the claudio:vulnerability-assessment-specialist subagent to identify security vulnerabilities in the test/claudio-agents/ codebase"

#### Phase 5: Claude SDK Analysis (Parallel Batch 4)
**Run multiple Task invocations in a SINGLE message**:
n) **Claude SDK Architect Test**:
   "Use the claudio:claudio-claude-sdk-architect subagent to analyze Claude Code command and agent implementations"

o) **Commands Analysis Test**:
   "Use the claudio:claudio-claude-commands-analyst subagent to evaluate the quality of Claude Code slash commands"

p) **Subagents Analysis Test**:
   "Use the claudio:claudio-claude-subagents-analyst subagent to assess Claude Code agent architecture and performance"

#### Phase 6: Specialized Agents (Parallel Batch 5)
**Run multiple Task invocations in a SINGLE message**:
q) **Design Analysis Test**:
   "Use the claudio:design-analyzer subagent to evaluate the UI/UX design patterns in the test/claudio-agents/ LiveView application"

r) **Research Specialist Test**:
   "Use the claudio:research-specialist subagent to conduct research on Phoenix LiveView best practices for the test/claudio-agents/ enhancement"

s) **Git Workflow Test**:
   "Use the claudio:git-commit-message subagent to generate appropriate commit messages for changes made to test/claudio-agents/"

t) **Command Generation Test**:
   "Use the claudio:new-command-generator subagent to create a custom command for Elixir Phoenix development workflows"

#### Phase 7: Upgrade System Architecture (Parallel Subagent Validation)
**Test the new specialized upgrade subagent architecture**:

u) **Upgrade Orchestrator Test**:
   "Use the claudio:upgrade-orchestrator-agent subagent to coordinate a check-mode upgrade analysis of the current Claudio installation"

v) **Upgrade Discovery Test** (Sequential Foundation):
   "Use the claudio:upgrade-discovery-analyzer subagent to analyze project discovery and installation status for a simulated upgrade operation"

w) **Upgrade Legacy Cleanup Test**:
   "Use the claudio:upgrade-legacy-cleaner subagent to detect and analyze legacy patterns in a test installation structure"

**Parallel Batch Execution Test - Analysis Phase**:
**Run multiple Task invocations in a SINGLE message**:
x) **Template Analysis Test**:
   "Use the claudio:upgrade-template-analyzer subagent to analyze template differences and plan localization strategy for a simulated upgrade"

y) **Backup Manager Test**:
   "Use the claudio:upgrade-backup-manager subagent to create comprehensive backup plan with version management for upgrade operations"

**Parallel Batch Execution Test - Application Phase**:
**Run multiple Task invocations in a SINGLE message**:
z) **Component Localizer Test**:
   "Use the claudio:upgrade-component-localizer subagent to execute a simulated localization plan with test command coordination"

aa) **Installation Validator Test**:
   "Use the claudio:upgrade-installation-validator subagent to validate file integrity and pattern compliance for a completed upgrade simulation"

### 3. Agent Description Validation
For each test above, verify:
- Claude Code successfully identifies and selects the appropriate agent
- Agent descriptions provide sufficient detail for proper selection
- Agent invocation works without confusion between commands and agents
- **CRITICAL**: Agents use Task tool directly, not through bash code blocks

### 4. Extended Context Reference Test
Check if agents can properly reference the new extended context structure:
- `extended_context/workflow/discovery/overview.md`
- `extended_context/workflow/prd/overview.md`
- `extended_context/workflow/planning/overview.md`
- `extended_context/command-analysis/best-practices.md`
- `extended_context/command-analysis/evaluation-framework.md`
- `extended_context/agent-analysis/architecture-patterns.md`
- `extended_context/agent-analysis/evaluation-framework.md`

### 5. Task Tool Usage Pattern Validation
**CRITICAL**: Verify agents use Task tool correctly without bash code blocks:

a) **Correct Pattern Test**:
   Agents should use Task tool directly as: "Use Task tool with subagent_type: 'agent-name' to [task]"

b) **Incorrect Pattern Detection**:
   Agents should NEVER wrap Task tool invocations in bash code blocks like:
   ```bash
   Use Task tool with subagent_type: "agent-name" to [task]
   ```

c) **Upgrade Orchestrator Validation**:
   Verify upgrade-orchestrator-agent uses proper Task tool patterns for all 6 specialized subagents without bash execution

### 6. Command vs Agent Disambiguation Test
Verify proper disambiguation between commands and agents using proper Task tool patterns:

a) **Command Test** (test command syntax validation):
   Test that command exists: `/claudio:claude-sdk --analyze-commands`

b) **Agent Test** (proper Task tool invocation):
   Task tool invocation with subagent_type: "claudio-claude-sdk-architect"

c) **Agent Coordination Test**:
   Task tool invocation with subagent_type: "claudio-claude-commands-analyst"
   
d) **Agent Architecture Test**:
   Task tool invocation with subagent_type: "claudio-claude-subagents-analyst"

**Validation**: Ensure Claude Code distinguishes between:
- `/claudio:claude-sdk` (command invocation with flags)
- Task tool with proper subagent_type for agent invocation

### 7. System Integration Test
Perform end-to-end tests with the sample application:

a) **Traditional Workflow**:
   "Use the claudio:discovery-agent subagent to analyze the test/claudio-agents/ codebase, then use the claudio:prd-agent subagent to create requirements for a new feature based on the discovery analysis"

b) **Full Claudio Workflow**:
   "Run the complete Claudio workflow on test/claudio-agents/ to create a comprehensive .claudio/ folder with discovery, requirements, planning, and task breakdown"

c) **Claude SDK Workflow**:
   "Use the claudio:claudio-claude-sdk-architect subagent to perform comprehensive analysis of Claude Code implementation, coordinating both command and agent analysis specialists"

d) **Claude SDK Command-Specific Workflow**:
   "/claudio:claude-sdk --analyze-command /claudio:plan" followed by "Use the analysis results to identify improvement opportunities"

e) **Claude SDK Agent-Specific Workflow**:
   Task tool with subagent_type: "claudio-claude-sdk-architect" for proper agent analysis

## Expected Results

### ✅ **Success Criteria**:
#### Agent Availability & Invocation
- All **43 agents** are available in claudio namespace (up from 37)
- Agent invocation works with "Use the claudio:agent-name subagent..." pattern
- No confusion between `/claudio:command` (commands) and `claudio:agent-name` (agents)
- Proper disambiguation between `/claudio:claude-sdk` command and `claudio:claudio-claude-sdk-architect` agent

#### Parallel Execution Performance
- **Multiple Task invocations in SINGLE message** work correctly across all 7 phases
- No conflicts or failures when running 3-4 agents simultaneously in parallel batches
- Upgrade system parallel batch execution works for both analysis and application phases
- Memory usage remains stable during parallel agent execution

#### Specialized Agent Capabilities
- **Documentation agents** create appropriate docs (API, README, user guides)
- **Security agents** identify vulnerabilities and provide threat analysis
- **Quality agents** run appropriate linters/analyzers for Elixir/Phoenix
- **Design agents** evaluate LiveView UI/UX patterns correctly
- **Research agents** provide relevant Phoenix/Elixir best practices
- **Installation agents** handle Claudio system setup properly
- **Upgrade agents** coordinate specialized subagent orchestration with proper parallel execution

#### Context & Integration
- Agents can reference extended context using new paths (all categories)
- End-to-end agent coordination functions across all workflow phases
- Claude SDK agents coordinate parallel command and agent analysis effectively
- Claude SDK command properly handles `--analyze-command` and `--analyze-agent` flags
- All agent analysis provides focused, actionable insights specific to their domain

### ❌ **Failure Indicators**:
#### Agent Availability Issues
- Any of the 43 agents not found in claudio namespace
- Claude Code cannot select appropriate agent based on description
- Confusion between command and agent invocation patterns

#### Parallel Execution Failures
- **Multiple Task invocations in SINGLE message** fail or cause errors
- Agent conflicts during parallel execution in any of the 7 phases
- Memory issues or performance degradation during batch execution
- Upgrade system parallel batch execution fails in analysis or application phases
- Sequential fallback required due to parallel failures

#### Specialized Agent Failures
- Documentation agents produce generic or incorrect documentation
- Security agents miss obvious vulnerabilities or provide irrelevant analysis
- Quality agents fail to run or misinterpret Elixir/Phoenix code patterns
- Design agents cannot evaluate LiveView-specific UI patterns
- Research agents provide outdated or incorrect Phoenix information

#### Context & Integration Issues
- Extended context references broken (any category paths)
- Agent coordination fails across workflow phases
- Claude SDK parallel analysis coordination problems
- Command/agent-specific analysis too generic or lacks domain expertise

#### Task Tool Pattern Issues
- **CRITICAL**: Agents wrapping Task tool invocations in bash code blocks (causing bash execution failures)
- Task tool invocations being executed as bash commands instead of direct tool usage
- Upgrade orchestrator attempting bash execution of Task tool commands
- Invalid tool usage patterns preventing proper subagent coordination

## Troubleshooting Guide

### If Agent Not Found:
1. Check that agent file exists: `.claude/agents/claudio/{agent_name}_agent.md`
2. Verify agent has proper frontmatter with `name:` field
3. Confirm agent is in correct location and properly named

### If Agent Selection Fails:
1. Review agent description for clarity and detail
2. Ensure description matches the requested task
3. Check for ambiguous or insufficient description text

### If Extended Context Broken:
1. Verify new extended context paths exist
2. Check agent references use new `extended_context/category/topic/file.md` pattern
3. Confirm files moved correctly from old `prompts/` structure
4. **Claude SDK Specific**: Verify `command-analysis/` and `agent-analysis/` directories exist with proper files:
   - `command-analysis/best-practices.md`
   - `command-analysis/evaluation-framework.md`
   - `agent-analysis/architecture-patterns.md`
   - `agent-analysis/evaluation-framework.md`

### If Claude SDK Analysis Fails:
1. Check that all 3 Claude SDK agents are properly installed and named:
   - `claudio-claude-sdk-architect.md`
   - `claudio-claude-commands-analyst.md`
   - `claudio-claude-subagents-analyst.md`
2. Verify agent descriptions contain "MUST BE USED PROACTIVELY" language for proper selection
3. Test individual analysis agents separately before testing coordinated analysis
4. Ensure `/claudio:claude-sdk` command exists and doesn't conflict with agent invocation

### If Command/Agent Analysis Fails:
1. Verify the command file exists: `.claude/commands/claudio/claude_sdk.md`
2. Check that the command properly handles flag parsing for `--analyze-command` and `--analyze-agent`
3. Test with known existing commands/agents first (e.g., `/claudio:discovery`, `discovery_agent`)
4. Ensure the command invokes the correct analysis sub-agents based on flags
5. Verify analysis output is specific to the requested component

## Post-Validation Actions

Based on test results:

### If All Tests Pass:
- Document successful restructure completion
- Update any remaining references to old naming
- Consider this restructure validated and complete

### If Tests Fail:
- Identify specific failure points
- Update agent descriptions for better Claude Code selection
- Fix extended context path references
- Retest specific failing components

## Notes for Implementation

This validation should be run in a **new Claude Code session** after implementing all structural changes, as agents are only loaded at session start.