# Claudio System Architecture

[← Back to Main Documentation](../CLAUDE.md)

## Purpose
This document provides technical implementation details, extended context structure, agent integration mechanisms, and architectural patterns. Use this when you need to understand how Claudio works internally or when extending the system.

## Extended Context Structure

### Overview
Claudio uses an organized extended context system located in `extended_context/` directories that provide specialized knowledge and operational guidance to AI agents.

### Directory Organization
```
.claude/agents/claudio/extended_context/
├── workflow/                    # Core workflow contexts
│   ├── discovery/
│   │   ├── overview.md         # Project discovery and analysis context
│   │   └── troubleshooting.md  # Common discovery issues and solutions
│   ├── prd/
│   │   ├── overview.md         # Requirements documentation context
│   │   └── troubleshooting.md  # PRD creation guidance
│   ├── planning/
│   │   ├── overview.md         # Implementation planning context
│   │   └── troubleshooting.md  # Planning best practices
│   └── task/
│       ├── overview.md         # Task breakdown context
│       └── troubleshooting.md  # Task management guidance
├── development/                 # Development-specific contexts
│   ├── code_quality/
│   │   ├── overview.md         # Code quality analysis context
│   │   └── troubleshooting.md  # Quality improvement strategies
│   ├── testing/
│   │   ├── overview.md         # Test generation context
│   │   └── troubleshooting.md  # Testing strategies
│   └── design/
│       ├── overview.md         # Design analysis context
│       └── troubleshooting.md  # Design improvement guidance
├── infrastructure/             # System infrastructure contexts
│   ├── installation/
│   │   ├── overview.md         # Installation process context
│   │   └── troubleshooting.md  # Installation issue resolution
│   └── upgrade/
│       ├── overview.md         # Upgrade orchestration context
│       └── troubleshooting.md  # Upgrade issue resolution
├── documentation/              # Documentation contexts
│   ├── overview.md             # Documentation generation context
│   └── troubleshooting.md      # Documentation best practices
├── research/                   # Research contexts
│   ├── overview.md             # Research methodology context
│   └── troubleshooting.md      # Research quality guidance
├── command-analysis/           # Claude SDK command analysis
│   ├── best-practices.md       # Command design patterns
│   ├── evaluation-framework.md # Command quality assessment
│   ├── integration-patterns.md # Command-agent integration
│   └── troubleshooting.md      # Command implementation issues
└── agent-analysis/             # Claude SDK agent analysis
    ├── architecture-patterns.md # Agent design patterns
    ├── context-integration.md   # Extended context best practices
    ├── evaluation-framework.md  # Agent quality assessment
    └── troubleshooting.md       # Agent implementation issues
```

### Context File Types

#### `overview.md` Files
- **Purpose**: Provide comprehensive domain knowledge and operational guidance
- **Content**: Core concepts, methodologies, best practices, examples
- **Usage**: Primary reference for agents in specific domains

#### `troubleshooting.md` Files  
- **Purpose**: Address common issues and provide resolution strategies
- **Content**: Known problems, diagnostic steps, solutions, prevention
- **Usage**: Error handling and quality improvement guidance

#### Specialized Files (Claude SDK)
- **`best-practices.md`**: Established patterns and standards
- **`evaluation-framework.md`**: Quality assessment criteria and methods
- **`integration-patterns.md`**: Connection and coordination strategies
- **`architecture-patterns.md`**: Structural design principles

## Agent Integration

### Agent Types and Responsibilities

#### Coordination Agents
- **`claudio_coordinator_agent`**: Master orchestration for complete workflows
- **`install-full-workflow-agent`**: Complete installation with project-aware CLAUDE.md generation
- **`upgrade-orchestrator-agent`**: Lightweight coordinator for 6 specialized upgrade subagents with parallel execution

#### Workflow Agents
- **`discovery_agent`**: Project analysis and technology assessment
- **`prd_agent`**: Requirements documentation creation
- **`plan_agent`**: Implementation planning with time estimates
- **`task_agent`**: Task breakdown and context creation
- **`implement_agent`**: Implementation execution and coordination

#### Analysis Agents  
- **`code-quality-analyzer`**: Code quality assessment and improvement
- **`design-analyzer`**: Design system evaluation and optimization
- **`research-specialist`**: Topic research and expert prompt generation

#### Claude SDK Agents
- **`claudio-claude-sdk-architect`**: Claude Code implementation orchestration with sequential analysis (one command at a time)
- **`claudio-claude-commands-analyst`**: Command structure and integration quality evaluation
- **`claudio-claude-subagents-analyst`**: Individual agent architecture assessment (one agent per task)

#### System Agents
- **`install-system-installer`**: File operations and directory management
- **`install-validator`**: Installation verification and reporting
- **`upgrade-component-localizer`**: Component re-localization with CLAUDE.md update capability
- **`workflow-validator`**: Document quality validation
- **`discovery-validator`**: Discovery analysis validation

### Agent Communication Patterns

#### Context References
Agents dynamically reference extended context based on installation location with graceful failure handling:
```markdown
## Extended Context Reference:
Reference context locations based on installation:
- Check if `./.claude/agents/claudio/extended_context/<category>/overview.md` exists first
- If not found, reference `~/.claude/agents/claudio/extended_context/<category>/overview.md`
- **If neither exists**: Report that extended context is missing and suggest using `/claudio:research <category> <topic> <URL>` to create the required context documentation
- Use whichever location is available for context guidance
```

#### Graceful Degradation
When extended context is missing, agents:
- **Continue Operation**: Function with built-in knowledge without failing
- **Provide Guidance**: Offer specific research commands to create missing context
- **Prevent Memory Leaks**: Stop searching for non-existent files immediately
- **Self-Healing**: Guide users to populate missing resources with authoritative sources

#### Cross-Agent Coordination
- **Sequential Dependencies**: Discovery → PRD → Plan → Task workflow
- **Parallel Execution**: Multiple analysis agents working simultaneously
- **Context Sharing**: Agents pass structured data through standardized formats
- **Error Propagation**: Failures handled gracefully with rollback capabilities

## Data Flow Architecture

### Core Workflow Data Flow
```
1. Discovery Agent
   ├── Analyzes project structure and capabilities
   ├── Outputs: discovery.md with technology assessment
   └── References: extended_context/workflow/discovery/

2. PRD Agent  
   ├── Uses discovery.md as input
   ├── Outputs: prd.md with requirements specification
   └── References: extended_context/workflow/prd/

3. Plan Agent
   ├── Uses prd.md as input  
   ├── Outputs: plan.md with implementation strategy
   └── References: extended_context/workflow/planning/

4. Task Agent
   ├── Uses plan.md as input
   ├── Outputs: Phase directories with task contexts
   └── References: extended_context/workflow/task/

5. Implementation Agent
   ├── Uses task contexts as input
   ├── Outputs: Completed features and progress updates
   └── Coordinates with specialized agents as needed
```

### Claude SDK Analysis Flow
```
1. Claude SDK Architect (Sequential Analysis)
   ├── Analyzes ONE command at a time to prevent system overload
   ├── References: extended_context/command-analysis/ and agent-analysis/
   └── Orchestrates focused, sequential evaluation workflow

2. Command Analysis (Step 1)
   ├── Commands Analyst evaluates single target command
   ├── References: extended_context/command-analysis/
   └── Outputs: Command structure and integration assessment

3. Individual Subagent Analysis (Step 2)  
   ├── Separate task for EACH subagent referenced by command
   ├── Subagents Analyst evaluates one agent per task
   ├── References: extended_context/agent-analysis/
   └── Outputs: Individual agent architecture assessments

4. Synthesis (Step 3)
   ├── SDK Architect compiles command + all subagent analyses
   ├── Generates unified recommendations for the complete workflow
   └── Outputs: Focused improvement roadmap for single command system
```

**Key Improvement**: Sequential analysis prevents memory overload and recursive loops by focusing on one command and analyzing each of its subagents individually rather than attempting parallel analysis of multiple components.

## Installation Architecture

### Directory Structure Patterns

#### User Mode Installation (`~/.claude/`)
```
~/.claude/
├── commands/claudio/           # Generic command templates
├── agents/claudio/             # Generic agent templates (FLAT structure)
└── agents/claudio/extended_context/  # Generic contexts
```

#### Project Mode Installation (`./.claude/`)
```
./.claude/
├── commands/claudio/           # Project-localized commands
├── agents/claudio/             # Project-localized agents (FLAT structure)  
├── agents/claudio/extended_context/  # Project-specific contexts
└── [workflow outputs]          # Generated project analysis
```

### Component Localization

#### Template-Based Generation
- **User Mode**: Direct copying of generic templates
- **Project Mode**: Template customization based on discovery analysis
- **Localization**: Technology stack-specific adaptations

#### Project Documentation Generation
- **CLAUDE.md Creation**: Automatic generation of project-aware integration documentation
- **Technology-Specific Content**: Framework-specific commands and workflow guidance
- **Dynamic Examples**: Context-aware command examples based on detected stack
- **Team Onboarding**: Self-documenting projects with immediate productivity guidance

#### Extended Context Management
- **Hierarchical Organization**: Category-based directory structure
- **Content Specialization**: Project-specific context modifications
- **Cross-References**: Proper linking between related contexts

## Quality Assurance Architecture

### Validation Layers

#### Installation Validation
1. **Structural Validation**: Directory and file structure verification
2. **Content Validation**: File integrity and format compliance  
3. **Integration Validation**: Cross-reference and namespace verification
4. **Functional Validation**: Basic operation and context accessibility

#### Workflow Validation
1. **Document Quality**: Content completeness and accuracy assessment
2. **Cross-Reference Validation**: Link integrity and consistency
3. **Feasibility Assessment**: Plan and recommendation viability
4. **Integration Validation**: Document alignment and coherence

#### System Integration
1. **Agent Coordination**: Multi-agent workflow verification
2. **Context Management**: Extended context accessibility and relevance
3. **Error Handling**: Graceful failure and recovery mechanisms
4. **Performance Monitoring**: Efficiency and resource utilization

## Security and Permissions

### File System Security
- **Permission Validation**: Write access verification before operations
- **Sandbox Compliance**: Operations contained within designated directories
- **Path Validation**: Prevention of directory traversal attacks
- **Content Filtering**: Validation of file contents and formats

### Agent Security
- **Tool Restriction**: Agents limited to necessary tools only
- **Context Isolation**: Extended contexts properly scoped
- **Cross-Agent Communication**: Structured data exchange only
- **Resource Management**: CPU and memory usage monitoring

## Extensibility Patterns

### Adding New Agents
1. Create agent prompt file in `.claude/agents/claudio/`
2. Add corresponding extended context in appropriate category
3. Update coordination agents to include new agent
4. Add validation rules for new agent type

### Adding New Commands
1. Create command file in `.claude/commands/claudio/`
2. Ensure proper sub-agent references
3. Add usage examples to documentation
4. Update installation and validation processes

### Adding Extended Context
1. Organize by category and topic
2. Include overview.md and troubleshooting.md
3. Update agent references to new context
4. Validate context accessibility patterns

---

[← Back to Main Documentation](../CLAUDE.md) | [Usage Guide ←](usage-guide.md) | [→ Specialized Features](specialized-features.md)