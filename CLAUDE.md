# Claudio Agent Control Specifications

## Navigation
- **Agent Index**: `.claude/agents/claudio/index.md` - Complete agent catalog
- **Command Index**: `.claude/commands/index.md` - Command specifications
- **Extended Context**: `.claude/agents/claudio/extended_context/` - Workflow contexts
- **Research Documents**: `.claudio/research/` - Project analysis
- **System Documentation**: `docs/` - Technical details
- **Templates**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/` - Exact formatting templates

## Documentation Structure

### Core Documentation
- **Usage Guide**: `docs/usage-guide.md` - Complete command reference, workflow examples, and practical usage patterns
- **System Architecture**: `docs/system-architecture.md` - Extended context structure, agent integration, and technical implementation details
- **Specialized Features**: `docs/specialized-features.md` - Research system, Claude SDK capabilities, and advanced features
- **Best Practices**: `docs/best-practices.md` - Development workflows, context management, and integration guidance
- **Changelog Management**: `docs/changelog-management.md` - Maintenance protocol and update procedures

### Extended Context Reference
- **Command Development**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/command-development-template.md`
- **Agent Architecture**: `.claude/agents/claudio/extended_context/agent-analysis/architecture-patterns.md`
- **Integration Patterns**: `.claude/agents/claudio/extended_context/command-analysis/integration-patterns.md`
- **Sub-agent Coordination**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/subagent-invocation-patterns.md`
- **Discovery Workflows**: `.claude/agents/claudio/extended_context/workflow/discovery/overview.md`

## Critical Execution Patterns

### Task Invocation
```
Task with subagent_type: "agent-name" - pass arguments
```

### Parallel Execution
```
Run multiple Task invocations in a SINGLE message
```

### TodoWrite Integration
```
Use TodoWrite to start Phase N - Phase Name
[Task execution steps]
Use TodoWrite to complete Phase N - Phase Name
```

### Naming Convention
**ALWAYS lowercase-hyphen**: `agent-name`, `command-name` (NOT `agent_name`)

## System Architecture

### Commands → Agents → Extended Context
- `/claudio:discovery` → `discovery-agent` → `extended_context/workflow/discovery/`
- `/claudio:prd` → `prd-agent` → `extended_context/workflow/prd/`
- `/claudio:plan` → `plan-agent` → `extended_context/workflow/planning/`
- `/claudio:task` → `task-agent` → `extended_context/workflow/task/`
- `/claudio:claudio` → `claudio-coordinator-agent` → Multiple contexts
- `/claudio:research` → `research-specialist` → `extended_context/research/`
- `/claudio:code-quality` → `code-quality-analyzer` → `extended_context/development/quality/`
- `/claudio:security-review` → `security-review-coordinator` → Security contexts
- `/claudio:test` → `project-test-runner` → Testing contexts

### Extended Context Structure
- `extended_context/workflow/` - Core workflow contexts
- `extended_context/development/` - Development contexts
- `extended_context/infrastructure/` - System contexts
- `extended_context/documentation/` - Documentation contexts
- `extended_context/research/` - Research contexts

## Component Classification

### System vs User Component Filtering

**Installation Rule**: Check frontmatter `system: claudio-system` field to distinguish between system maintenance components and user project components.

**Component Categories:**
- **System components**: Tagged with `system: claudio-system` - used for Claudio framework maintenance, excluded from user installations
- **User components**: No system tag - designed for user projects, included in standard installations

**Filtering Logic** (for installation agents):
```markdown
1. Read component file frontmatter using Read tool
2. Check for `system: claudio-system` field presence
3. If system tag present, skip during user installations (component is for Claudio system maintenance)
4. If no system tag, include in user installations (component is for user projects)
5. Apply filtering during `/claudio:install` operations to prevent system component leakage
```

**System Component Examples:**
- `install-path-validator-agent.md` - Internal validation for Claudio installations
- `upgrade-*-agent.md` - Claudio system upgrade components
- Framework test and validation agents

**User Component Examples:**
- `discovery-agent.md` - Project analysis for user codebases
- `prd-agent.md` - Requirements generation for user projects
- `task-agent.md` - Task breakdown for user development

## Model Assignments

### Agent Model Distribution
Total agents: 77+ across the Claudio framework
- **Haiku**: Simple validation, file operations, basic path checking
- **Sonnet 4**: Complex reasoning, analysis, specialized domain expertise  
- **Opus 4.1**: Multi-agent coordination, workflow orchestration

**Model Selection Criteria:**
- **Haiku**: Used for focused, single-purpose operations with minimal complexity
- **Sonnet 4**: Used for domain-specific analysis requiring reasoning and context understanding
- **Opus 4.1**: Used for agents that coordinate multiple sub-agents or manage complex workflows

### Model Assignment Implementation
```yaml
---
name: agent-name
model: haiku    # or sonnet, or opus
---
```

## Command Development Standards

**For complete templates with examples, see**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/command-development-template.md`

### Mandatory Pattern
```markdown
---
description: "Command purpose"
argument-hint: "[input]"
---

I am a [purpose] that [description]. My task is to:

1. Setup todo tracking for workflow
2. Invoke specialized agents using parallel Task calls with proper argument extraction
3. Read and validate outputs using actual tool execution
4. Create comprehensive report based on validated data

## Anti-Fabrication Requirements
- Base all outputs on actual tool execution and file analysis
- Execute Read, Glob, or validation tools before making claims
- Mark uncertain information as "requires analysis" or "needs validation"
- Use factual language without superlatives or unsubstantiated performance claims
- Never provide time estimates without actual measurement

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "agent1" - pass the [argument_type] argument [value] for [purpose]
- Task with subagent_type: "agent2" - pass the [argument_type] argument [value] for [purpose]

Then read and validate actual outputs using tool execution, and create complete factual report.
```

### Required Elements
- **TodoWrite first**: Always setup todo tracking before Task calls
- **Argument passing**: Include proper argument extraction patterns for sub-agents
- **Parallel Task calls**: Multiple agents with specific custom arguments
- **Tool validation**: Use Read, Glob, or other tools to validate claims
- **Output validation**: Read and validate actual outputs, never assume
- **Factual reporting**: Base reports only on verified data and tool execution
- **Complete report**: Centralized result compilation with source attribution

## Anti-Patterns (NEVER USE)
- Coordinator agents that call other agents
- Sequential execution when parallel is possible
- Missing TodoWrite progress tracking
- Generic arguments or no argument passing without proper extraction patterns
- Assuming outputs without validation through tool execution
- Incorrect subagent_type references
- Inconsistent agent naming (must use lowercase-hyphen)
- **Anti-Fabrication Violations**:
  - Fabricating performance metrics or success percentages
  - Making unsubstantiated claims about system capabilities
  - Using superlative language ("excellent", "comprehensive", "advanced")
  - Providing time estimates without measurement or analysis
  - Claiming file existence without Read or Glob verification
  - Reporting test results without actual execution

## Critical Requirements

### File Validation (MANDATORY)
```markdown
Use Read or LS tools to validate file existence before referencing
If file does not exist, use research-specialist subagent to create required documentation
```


### Sub-Agent Invocation Patterns

**For detailed patterns and examples, see**: `.claude/agents/claudio/extended_context/meta/claude/commands/templates/subagent-invocation-patterns.md`

**Commands use Task tool pattern:**
```
Task with subagent_type: "target-agent" - pass arguments
```

**Sub-agents use natural language pattern:**
```
Use the target-agent-name subagent to [action] [context]
```

### Anti-Fabrication Rules
All agents MUST adhere to strict anti-fabrication requirements to ensure factual, measurable outputs.

**Core Principles:**
- Base all outputs on actual analysis of real project data using tool execution
- Execute Read, Glob, Bash, or other validation tools before making claims
- Mark uncertain information as "requires analysis", "needs validation", or "requires investigation"
- Use precise, factual language without superlatives or unsubstantiated performance claims
- Execute tests before marking tasks complete and report actual results
- Validate integration recommendations through actual framework detection using tool analysis

**Prohibited Language and Claims:**
- **Superlatives**: Avoid "excellent", "comprehensive", "advanced", "optimal", "perfect"
- **Unsubstantiated Metrics**: Never fabricate percentages, success rates, or performance numbers
- **Assumed Capabilities**: Don't claim features exist without tool verification
- **Generic Claims**: Replace vague statements with specific, measurable observations
- **Fabricated Testing**: Never report test results without actual execution

**Time and Effort Estimation Rule:**
- Never provide time estimates, effort estimates, or completion timelines without actual measurement or analysis
- If estimates are requested, execute tools to analyze scope (e.g., count files, measure complexity, assess dependencies) before providing data-backed estimates
- When estimates cannot be measured, explicitly state "timeline requires analysis of [specific factors]"
- Avoid fabricated scheduling language like "15 minutes", "2 hours", "quick task" without factual basis

**Validation Requirements:**
- **File Claims**: Use Read or Glob tools before claiming files exist or contain specific content
- **System Integration**: Use Bash or appropriate tools to verify system capabilities
- **Framework Detection**: Execute actual detection logic before claiming framework presence
- **Test Results**: Only report test outcomes after actual execution with tool verification
- **Performance Claims**: Base any performance statements on actual measurement or analysis

## Workflow Dependencies

### Sequential vs Parallel Execution Rules
**Sequential Prerequisites** (must complete before others):
- Discovery analysis must complete before PRD creation
- PRD must complete before planning
- Planning must complete before task breakdown

**Parallel Execution** (after prerequisites):
- Documentation generation, security analysis, and code quality can run in parallel
- Multiple analysis agents can execute simultaneously when dependencies are met

**Reference**: `.claude/agents/claudio/extended_context/command-analysis/integration-patterns.md`

## System Reliability Requirements

### Error Handling Pattern
**When extended_context is missing:**
- Provide graceful degradation 
- Use research-specialist subagent fallback for missing documentation
- Never assume files exist without verification

### Extended Context Integration
**Template Loading**: Templates are loaded on-demand only when:
- Creating new commands with `/claudio:new-command`
- Creating new agents with `/claudio:newprompt`
- Installing system components with `/claudio:install`
- Research agents creating missing context

**Memory Efficiency**: Templates are not loaded during normal command execution

## Changelog Maintenance

**When working on Claudio system**, check for `changelog/YYYY-MM-DD.md` and update for changes to:
- Agent contexts (`extended_context/` directory)
- Commands (`.claude/commands/` directory)
- System documentation (`README.md`, `CLAUDE.md`, `docs/` directory)

**Reference**: `docs/changelog-management.md`

## TodoWrite Pattern Requirements

**For detailed templates with exact formatting, see**: `.claude/agents/claudio/extended_context/templates/`

### Template System Reference

**Template Locations:**
- `.claude/agents/claudio/extended_context/templates/` - Template library
- `.claude/agents/claudio/extended_context/templates/commands/` - Command development templates
- `.claude/agents/claudio/extended_context/templates/agents/` - Agent architecture templates
- `.claude/agents/claudio/extended_context/templates/workflows/` - Workflow integration examples
- `.claude/agents/claudio/extended_context/templates/integration/` - Agent coordination patterns
- `.claude/agents/claudio/extended_context/command-analysis/` - Integration patterns
- `.claude/agents/claudio/extended_context/agent-analysis/` - Architecture patterns

**Available Template Types:**
- **Command Templates**: `basic-command-template.md`, `orchestrator-command-template.md`, `parallel-execution-template.md`
- **Agent Templates**: `analysis-agent-template.md`, `orchestrator-agent-template.md`, `specialist-agent-template.md`
- **Integration Templates**: `command-agent-integration-examples.md`, `agent-coordination-examples.md`
- **Workflow Templates**: `discovery-workflow-examples.md`, `development-workflow-examples.md`

### Command and Agent Responsibilities

**Commands:**
- Parse user arguments before starting TodoWrite phases
- Use TodoWrite for primary workflow control loop
- Coordinate focused specialized agents
- Wrap all Task tool calls in TodoWrite phases
- NEVER reference non-existent subagents

**Agents:**
- Use TodoWrite for internal multi-step task management
- Remain focused and specialized in domain expertise
- Report completion through TodoWrite phase management
- Validate file existence before referencing documents
- Use research-specialist subagent to create missing extended_context
- NEVER reference non-existent sub-agents

## Extended Context Integration Patterns

### Pseudocode Migration Strategy
**All implementation examples must be moved to extended_context documents**

**Agent Documentation Pattern:**
```markdown
Generate outputs using patterns referenced in extended_context/[category]/[specific-templates.md]. 
Validate file existence before referencing extended_context documents using Read or LS tools. 
If template files do not exist, use research-specialist subagent to create required documentation.
```

**Extended Context Structure for Implementation Examples:**
- `extended_context/installation/` - Installation-related examples and bash commands
- `extended_context/testing/` - Test command templates and framework patterns  
- `extended_context/upgrade/` - Upgrade workflow examples and procedures
- `extended_context/generation/` - Generation templates and prompt patterns
- `extended_context/documentation/` - Documentation templates and structures


### Extended Context Content Standards
- **Natural Language Focus**: Agent documentation uses natural language only
- **Implementation Separation**: All code examples, templates, and pseudocode moved to extended_context
- **Reference Integrity**: Agents reference specific extended_context files with existence validation
- **Graceful Degradation**: Agents handle missing extended_context with research-specialist fallback

## Critical Sub-Agent Path Handling Protocol

### Universal Argument Extraction Requirement
ALL sub-agents invoked by commands MUST implement argument extraction logic for proper context isolation and path handling.

**Standard Argument Extraction Instructions** (Add to every sub-agent):
```markdown
## Argument Extraction Instructions

When the coordinator invokes you, look for the phrase "pass the [argument_name] argument" followed by a value in your task prompt. Extract this value and use it throughout your operations.

### Common Argument Patterns:

**Project Path Argument:**
If your prompt contains "pass the project_path argument test/claudio for [purpose]", then:
- Extract "test/claudio" as your working project path
- Read discovery from test/claudio/.claudio/docs/discovery.md
- Create files in test/claudio/.claude/ and test/claudio/.claudio/
- Work exclusively within the test/claudio directory structure

**Changes Description Argument:**
If your prompt contains "pass the changes-description argument 'added new features' for [purpose]", then:
- Extract "added new features" as your change description
- Use this description to determine what documentation sections need updates
- Focus updates on areas affected by these specific changes

**Status Reporting:** When you start working, display your extracted arguments in status messages:
- Format: "⏺ agent-name(Working with: [extracted_argument])"
- Example: "⏺ claude-md-updater-agent(Updating CLAUDE.md for: added new command patterns)"
```

### Command Invocation Patterns
Commands MUST use these exact patterns for all Task invocations:

**Project Path Pattern:**
```
Task with subagent_type: "agent-name" - pass the project_path argument [DYNAMIC_PATH] for [purpose]
```

**Changes Description Pattern:**
```
Task with subagent_type: "agent-name" - pass the changes-description argument '[DESCRIPTION]' for [purpose]
```

**Multiple Arguments Pattern:**
```
Task with subagent_type: "agent-name" - pass the project_path argument [PATH] and changes-description argument '[DESCRIPTION]' for [purpose]
```

### Argument Extraction Implementation
Sub-agents implement extraction using this pattern:
1. **Parse Task Prompt**: Look for "pass the [argument] argument [value]" phrases
2. **Extract Values**: Capture the value following the argument phrase
3. **Status Display**: Show extracted arguments in status messages
4. **Context Application**: Use extracted values throughout operations
5. **Path Validation**: Verify extracted paths exist before operations

### Why This Is Critical
- Sub-agents receive isolated context (clean slate) without command argument context
- They only see the Task prompt content, not the invoking command's full context
- Without extraction logic, agents default to working directory or system paths
- This causes contamination of main system files and incorrect installations
- Proper extraction ensures agents work within specified project boundaries
- Status reporting provides transparency of argument handling to coordinators