# Claudio System Documentation

Claudio is a comprehensive project analysis and planning system that transforms any codebase into an organized, trackable development process. This system orchestrates discovery, requirements, planning, and task organization through specialized AI agents.

## Documentation Structure

### Core Documentation
- **[Usage Guide](docs/usage-guide.md)** - Complete command reference, workflow examples, and practical usage patterns
- **[System Architecture](docs/system-architecture.md)** - Extended context structure, agent integration, and technical implementation details
- **[Specialized Features](docs/specialized-features.md)** - Research system, Claude SDK capabilities, and advanced features
- **[Best Practices](docs/best-practices.md)** - Development workflows, context management, and integration guidance
- **[Changelog Management](docs/changelog-management.md)** - Maintenance protocol and update procedures

### Quick Reference
Essential information you need right now:

**🚨 CRITICAL: ALL agent names use lowercase-hyphen format:** `agent-name`

**🚀 PERFORMANCE: Use sub-agent chaining when possible:** `First use the X subagent to..., then use the Y subagent to...`

**🔧 INTEGRATION: Subagents MUST use Claude Code natural language pattern:** `Use the agent-name subagent to [action]`

**⚠️ CRITICAL: NEVER use Task tool patterns for sub-agent invocation** - use natural language following Claude Code standards

## Command Development Standards

### **🔥 MANDATORY: Working Agent Invocation Pattern**

**ALL new commands MUST follow this proven pattern for direct agent coordination:**

```markdown
---
description: "Command description with clear purpose"
argument-hint: "[input]"
---

I am a [command purpose] that [brief description]. My task is to:

1. Setup todo tracking for the workflow
2. Invoke specialized agents directly using parallel Task calls with custom arguments
3. Read and validate outputs from [expected output files]
4. Create a comprehensive [validation/summary] report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "agent1" - pass the input-value argument for processing
- Task with subagent_type: "agent2" - pass the input-value argument for processing
- Task with subagent_type: "agent3" - pass the input-value argument for processing

Then read outputs from [output files], validate them, and create comprehensive report.

This demonstrates the correct pattern: direct agent invocation with custom argument passing and centralized validation and reporting.
```

### **🔥 MANDATORY: Explicit Parallel Task Pattern**

**ALL commands MUST use this exact TodoWrite and parallel Task pattern:**

```markdown
## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "agent1" - pass the input-value argument for processing
- Task with subagent_type: "agent2" - pass the input-value argument for processing

Then read outputs, validate them, and create comprehensive report.
```

**✅ REQUIRED Elements:**
- **TodoWrite first**: Always setup todo tracking before Task calls
- **"make parallel Task calls"**: Explicit parallel execution statement
- **Multiple Task calls**: List each agent with custom arguments
- **Custom arguments**: Pass meaningful context to each agent
- **Output validation**: Read and validate actual outputs
- **Comprehensive report**: Centralized result compilation

### **⚡ Performance Requirements**
- **Parallel Execution**: Run as many Task calls as possible in parallel
- **TodoWrite Tracking**: ALWAYS use TodoWrite for progress management
- **Direct Invocation**: NO coordinator agents - commands coordinate directly
- **Custom Arguments**: Pass meaningful arguments to each sub-agent
- **Output Validation**: Read and validate actual outputs from sub-agents

### **🚨 Anti-Patterns (NEVER USE)**
- ❌ Coordinator agents that call other agents
- ❌ Sequential execution when parallel is possible
- ❌ Missing TodoWrite progress tracking
- ❌ Generic arguments or no argument passing
- ❌ Assuming outputs without validation
- ❌ File operations without proper termination checks
- ❌ Incomplete error handling and recovery mechanisms
- ❌ Missing system vs user component classification
- ❌ Incorrect subagent_type references that don't match actual agent files
- ❌ Inconsistent agent naming (must use lowercase-hyphen format)

### **✅ Proven Examples**
- **`/claudio:update-docs`**: Uses 3 parallel agents (readme-updater, claude-md-updater, changelog-updater)
- **`/claudio:discovery`**: Enhanced parallel system with 5 specialized analyzers + consolidation
- **`/claudio:claudio`**: Direct coordination without coordinator complexity (20+ conditional agents)
- **`/claudio:upgrade`**: Uses 7 parallel agents with direct coordination and batched execution (corrected from previous 6-agent reference)
- **`/claudio:install`**: Uses 14 agents with direct coordination and mixed parallel/sequential execution
- **`/claudio:security-review`**: Direct coordination with 1 agent using internal coordination
- **`/claudio:new-command`**: Direct coordination with 3 parallel agents
- **`/claudio:newprompt`**: Direct coordination with 3 parallel agents
- **`/claudio:implement`**: Direct coordination with 1 agent
- **Pattern Success**: Fast, reliable, clear completion signaling with validated outputs and accurate agent references

## Core Components

### **System vs User Component Classification**

Claudio uses the `system: claudio-system` frontmatter field to differentiate between internal system components and user-facing workflow components:

#### **System Components (Internal Use Only)**
Components marked with `system: claudio-system` are excluded from user installations and remain in the main Claudio directory for system operations:

**System Commands (5 components):**
- **`/claudio:install`**: System installation and setup coordination with direct coordination (14 agents)
- **`/claudio:upgrade`**: System upgrade and maintenance coordination with direct coordination (7 agents)  
- **`/claudio:test`**: System testing and validation workflows
- **`/claudio:install-commands`**: Commands-only installation coordination
- **`/claudio:generate-test-commands`**: Project-specific test command generation system

**System Agents (45+ components):**
- **Installation Agents**: `install-*` (path validation, directory creation, component localization)
- **Enhanced Discovery System**: `discovery-*` agents with parallel analysis capabilities:
  - `discovery-structure-analyzer`: Project organization and file pattern analysis with hierarchy mapping
  - `discovery-tech-analyzer`: Technology stack detection, framework identification, and dependency analysis
  - `discovery-architecture-analyzer`: Architecture patterns, design principles, and structural analysis
  - `discovery-integration-analyzer`: Integration assessment, API analysis, and MCP recommendations
  - `discovery-consolidator`: Analysis consolidation, report generation, and comprehensive summary creation
- **Documentation Agents**: `*-updater`, `claude-md-generator`, `readme-updater`, `changelog-updater`, `user-readme-generator` (parallel documentation maintenance with project-specific documentation generation)
- **Upgrade Agents**: `upgrade-*` (discovery analysis, backup management, template analysis, component localization, legacy cleanup, installation validation)
- **Validation Agents**: `*-validator`, `*-test` (system integrity, integration testing, workflow validation)
- **Command Generation**: `new-command-generator`, `test-command-generator` (dynamic command creation and project-specific test integration)
- **Internal Coordinators**: System-level workflow orchestration and validation

#### **User Components (Workflow Execution)**
Components without the system tag are installed to user projects and provide workflow functionality:

**User Commands (18 components):**
- **Core Workflow**: `/claudio:discovery`, `/claudio:prd`, `/claudio:plan`, `/claudio:task`, `/claudio:claudio`
- **Testing**: `/claudio:test`, `/claudio:test-g` (project-specific test commands generated during installation)
- **Analysis Tools**: `/claudio:code-quality`, `/claudio:security-review`, `/claudio:design`, `/claudio:test-review`
- **Documentation**: `/claudio:documentation`, `/claudio:research`, `/claudio:update-docs`
- **Development**: `/claudio:claude-sdk`, `/claudio:phoenix-dev`, `/claudio:implement`, `/claudio:newprompt`, `/claudio:new-command`
- **Specialized**: `/claudio:gcms` (Git commit message generation)

**User Agents (33+ components):**
- **Workflow Agents**: `discovery-agent`, `prd-agent`, `plan-agent`, `task-agent`, `claudio-coordinator-agent`
- **Analysis Agents**: `code-quality-analyzer`, `security-review-coordinator`, `design-analyzer`
- **Security Specialists**: `vulnerability-assessment-specialist`, `security-architecture-analyst`, `security-threat-modeler`, `security-diagram-generator`
- **Documentation Agents**: `documentation-coordinator`, `documentation-*-creator` (API, user guide, developer guide, README)
- **Generation Agents**: `research-specialist`, `claude-sdk-architect`, `git-commit-message`, `test-command-generator`
- **Development Agents**: `implement-agent`, `phoenix-dev-executor`, `test-review`

#### **Installation Filtering Logic**
The `install-system-installer` agent automatically filters components during installation:
```markdown
1. Read each component file's frontmatter
2. Check for `system: claudio-system` field
3. Skip system components during user installations
4. Continue with user components only
```

This ensures users receive only workflow-relevant components while keeping system internals separate.

### Commands
- **`/claudio:research`**: Create research documentation with overview and troubleshooting guides
- **`/claudio:discovery`**: Analyze project structure and capabilities with enhanced parallel analysis system (5 specialized agents)
- **`/claudio:documentation`**: Create project documentation
- **`/claudio:prd`**: Generate Product Requirements Documents
- **`/claudio:plan`**: Create implementation plans
- **`/claudio:task`**: Break down plans into executable tasks
- **`/claudio:test`**: Execute project test suite with intelligent analysis and optional fixes
- **`/claudio:claudio`**: Complete project analysis workflow
- **`/claudio:update-docs`**: Update README, CLAUDE.md, and changelogs with parallel agent coordination
- **`/claudio:upgrade`**: Parallel upgrade system using 7 specialized subagents with direct coordination for improved performance
- **`/claudio:claude-sdk`**: Analyze and improve Claude Code implementations
- **`/claudio:gcms`**: Generate intelligent Git commit messages based on staged changes
- **`/claudio:newprompt`**: Create new command and agent prompts with integrated planning
- **`/claudio:new-command`**: Generate new Claudio commands with proper integration patterns

### Extended Context Structure
- **`extended_context/workflow/`**: Core workflow contexts (discovery, prd, planning, task)
- **`extended_context/development/`**: Development-specific contexts (code quality, testing, design)
- **`extended_context/infrastructure/`**: System contexts (installation, parallel upgrade architecture, specialized subagent coordination)
- **`extended_context/documentation/`**: Documentation generation contexts
- **`extended_context/research/`**: Research methodology contexts
- **`extended_context/command-analysis/`**: Claude SDK command evaluation
- **`extended_context/agent-analysis/`**: Claude SDK agent architecture

## Quick Start

### Individual Commands
```bash
/claudio:discovery ./my-project        # Comprehensive project analysis with parallel specialist agents
/claudio:research backend nodejs       # Create research docs in .claudio/research/backend/nodejs/
/claudio:prd feature user-auth         # Create requirements
/claudio:plan feature user-auth "4w"   # Plan implementation
/claudio:test                          # Execute project test suite with intelligent reporting
/claudio:test --fix                    # Run tests with automatic failure analysis and fixes
```

### Complete Project Analysis
```bash
/claudio:claudio ../my-project
# Creates complete .claudio/ folder with analysis, requirements, plans, and tasks
```

### System Installation with Project Integration
```bash
/claudio:install                        # Install with project-aware CLAUDE.md generation
/claudio:install /path/to/project       # Install at specific path with project documentation
/claudio:install commands               # Commands-only installation (streamlined)
```

**Installation Creates:**
- `.claude/` directory with localized commands and agents
- `.claudio/` directory with project workflow documents  
- **Project-specific CLAUDE.md with integration guidance** (generated based on discovery analysis, technology stack-aware workflows)
- **Project-specific README documentation** (generated by user-readme-generator agent based on discovery analysis and technology stack)
- **Project-specific test commands** (`/claudio:test`, `/claudio:test-g`) based on detected testing frameworks
- Comprehensive project discovery and technology analysis using parallel analysis system

### System Upgrade and Cleanup
```bash
/claudio:upgrade ./my-project           # Upgrade with CLAUDE.md refresh and capability updates
/claudio:upgrade --check               # Preview upgrade changes without applying
/claudio:upgrade --force               # Force complete re-installation with full re-discovery
```

**Parallel Architecture**: The upgrade system uses 7 specialized subagents with direct coordination and parallel execution for improved performance:
- **Discovery Analyzer**: Installation analysis and compatibility assessment
- **Legacy Cleaner**: Phase 0 deprecated pattern cleanup with user content protection
- **Template Analyzer**: Localization planning and conflict detection  
- **Backup Manager**: Backup creation and rollback script generation
- **Component Localizer**: Project-specific template application and test command coordination
- **Installation Validator**: Integrity verification and completion reporting

**Performance Optimization**: Parallel batch execution (Phase 2: template analysis + backup creation, Phase 3: localization + validation) provides improved efficiency while maintaining safety guarantees.

**Recent System Improvements**: Fixed 15+ subagent_type references in upgrade, install, and claudio commands to match actual agent files, ensuring reliable command execution with accurate agent mappings.

### Claude Code Development
```bash
/claudio:claude-sdk command_name        # Analyze specific Claude Code command and its subagents
/claudio:claude-sdk --cross-system      # Compare implementations across systems
```

**Sequential Analysis**: The Claude SDK architect analyzes one command at a time, evaluating the command structure first, then each individual subagent separately to prevent system overload and ensure focused analysis. The system includes specialized analysts for both command structures and subagent architectures.

### Enhanced Discovery System
```bash
/claudio:discovery ./my-project         # Comprehensive project analysis with parallel specialist agents
```

**Parallel Analysis Architecture**: The discovery system uses 5 specialized analysis agents running in parallel:
- **Structure Analyzer**: Project organization, file patterns, directory structure, hierarchy mapping, and build system analysis
- **Technology Analyzer**: Technology stack detection, framework identification, dependency analysis, and package management assessment
- **Architecture Analyzer**: Design patterns, architectural style, component relationships, and structural analysis
- **Integration Analyzer**: Tool integration opportunities, API analysis, MCP recommendations, development workflow compatibility, and CI/CD analysis
- **Consolidator**: Analysis integration, comprehensive report generation, and project classification

**Analysis Consolidation**: After parallel analysis completion, a consolidation agent combines all findings into a comprehensive discovery document with:
- **Executive Summary**: Technology stack overview and project classification
- **Localization Recommendations**: Optimal agent and command selections for the project
- **Integration Guidance**: Project-specific workflow and tool integration suggestions
- **Quality Assessment**: Analysis completeness and recommendation confidence levels

**Performance Benefits**: Parallel analysis provides 5x faster discovery compared to sequential analysis while maintaining comprehensive coverage and improved accuracy through specialized agent expertise.

### Testing System
```bash
/claudio:test                           # Execute project test suite with intelligent reporting
/claudio:test [pattern]                 # Run specific test files or patterns  
/claudio:test --fix                     # Run tests with automatic failure analysis and fixes
/claudio:test-g                         # Gemini-integrated testing with analysis and task generation
```

**Project-Specific Test Integration**: The testing system provides:
- **Framework Detection**: Automatic detection of testing frameworks (Jest, pytest, ExUnit, Go test, etc.)
- **Intelligent Reporting**: Comprehensive test result analysis and failure diagnosis
- **Fix Capabilities**: Automatic failure analysis and repair suggestions with `--fix` flag
- **Project-Specific Commands**: Generated test commands during installation based on discovery analysis
- **Fallback Execution**: Direct framework detection when project-specific commands aren't available

**Generated Test Commands**: During installation, project-specific test commands are created:
- **`/claudio:test`**: Project-tailored test execution with sophisticated reporting
- **`/claudio:test-g`**: Gemini-integrated testing for advanced analysis (requires gemini-cli)

### Research System
```bash
/claudio:research development react-testing  # Create research documentation
```

**Document Creation**: Research commands create structured documentation with:
- **Direct Usage**: Creates files in `.claudio/research/<category>/<topic>/`
  - `overview.md`: Topic analysis with best practices and implementation patterns  
  - `troubleshooting.md`: Common issues, solutions, diagnostic tools, and escalation guidance
- **Subagent Usage**: Creates extended context in `.claude/agents/claudio/extended_context/<category>/<topic>/`
- **Quality Standards**: Includes authoritative sources, practical examples, and complexity-appropriate analysis

**Research Features**:
- **Complexity Assessment**: Automatic evaluation (1-10 scale) with Think/Ultrathink modes for advanced topics
- **Thinking Modes**: Standard (4-5), Think (6-8), Ultrathink (9-10) with multi-perspective analysis
- **Manual Override**: `--complexity=high` forces advanced analysis mode
- **Context Detection**: Automatically determines direct vs subagent usage for proper file placement

### Documentation Generation System
```bash
/claudio:documentation ./my-project         # Generate comprehensive project documentation
/claudio:update-docs                        # Update all documentation with parallel agents
```

**Project-Specific Documentation**: The system generates tailored documentation based on discovery analysis:
- **User README Generation**: `user-readme-generator` agent creates project-specific README files with:
  - Technology stack-aware setup instructions
  - Framework-specific development guidance
  - Project architecture overview based on discovery analysis
  - Integration examples tailored to detected technologies
- **CLAUDE.md Integration**: Technology-aware Claudio workflow integration guidance
- **Parallel Documentation Updates**: 3 specialized agents run in parallel:
  - `readme-updater`: Updates project README with latest capabilities
  - `claude-md-updater`: Maintains CLAUDE.md integration guidance
  - `changelog-updater`: Updates project changelog with system improvements

**Documentation Quality Standards**:
- **Discovery-Driven**: All documentation based on actual project analysis
- **Technology-Aware**: Framework-specific instructions and examples
- **Integration-Focused**: Clear Claudio workflow integration guidance
- **Validation-Based**: Generated content validated against project structure

## What "use claudio on ../my-project" means

When you say **"use claudio on ../my-project"**, you're requesting:

1. **Execute**: `/claudio:claudio ../my-project`
2. **Expected Result**: A complete `.claudio/` folder with organized structure inside `../my-project/`
3. **Deliverables**: 
   - **`.claudio/docs/`**: Discovery analysis, PRD requirements, implementation plan, executive summary
   - **`.claudio/phase1/, phase2/, etc.`**: Task breakdown with executable contexts
   - **`.claudio/status.md`**: Progress tracking and workflow status
   - **Documentation**: API docs, README, user guides (parallel generation)
   - **Quality analysis**: Security review, code quality assessment, design evaluation
   - **Validation**: Mandatory workflow quality validation ensuring all documents meet standards

This transforms your existing codebase into an organized, trackable development process with clear next steps and **validated quality assurance**.

**[→ See workflow examples in Usage Guide](docs/usage-guide.md#claudio-workflow)**

## System Integration

The Claudio system integrates with existing development practices:
- **Version Control**: All `.claudio/` content can be committed to git
- **Self-Documenting Projects**: Each project maintains its own Claudio integration guide (CLAUDE.md) and README documentation generated based on discovery analysis and technology stack
- **Technology-Specific Guidance**: Framework-specific commands and workflows tailored to your stack, including project-specific test commands
- **Parallel Analysis**: Enhanced discovery system provides comprehensive project understanding in optimal time
- **Team Onboarding**: Project-aware documentation for immediate productivity with technology-specific examples and auto-generated README guidance
- **Team Collaboration**: Shared context enables consistent development approach with project-tailored workflows and comprehensive documentation
- **Project Management**: Progress tracking provides visibility into development status
- **Quality Assurance**: Task contexts include testing and review requirements with automated test execution capabilities

**[→ Learn more about integration in Best Practices](docs/best-practices.md#integration-with-development-workflow)**

## Workflow Execution Patterns

### **Sequential vs Parallel Execution**

**🚀 Critical Performance Pattern**: Use parallel execution when possible, but respect workflow dependencies:

```
Run multiple Task invocations in a SINGLE message
```

### Workflow Dependencies

#### **Phase 1: Sequential (Foundation)**
Some workflows are prerequisites and MUST run sequentially:
- **Discovery**: Must complete before other analyses (provides project context)
- **PRD Creation**: Requires discovery findings as input
- **Planning**: Depends on PRD requirements

#### **Phase 2+: Parallel Batches**
After discovery foundation, the claudio-coordinator-agent executes in optimized parallel batches:

**✅ CORRECT - Core Workflow Batch (Parallel):**
```
Run multiple Task invocations in a SINGLE message:
- Task with prd-agent using discovery results
- Task with plan-agent for implementation planning  
- Task with task-agent for executable task breakdown
```

**✅ CORRECT - Documentation & Quality Batch (Parallel):**
```
Run multiple Task invocations in a SINGLE message:
- Task with documentation-coordinator for comprehensive docs
- Task with user-readme-generator for project-specific README documentation
- Task with code-quality-analyzer for quality assessment
- Task with test-command-generator for project-specific tests
```

**✅ CORRECT - Security & Analysis Batch (Parallel):**
```
Run multiple Task invocations in a SINGLE message:
- Task with security-review-coordinator for vulnerability analysis
- Task with design-analyzer for UI/UX evaluation
- Task with research-specialist for technology best practices
```

### Performance Benefits

- **Sequential Prerequisites**: Ensures correct data dependencies
- **Parallel Batches**: 3-4x faster than sequential execution
- **Optimal Resource Use**: Claude Code parallel processing capabilities
- **Reduced Wait Times**: Simultaneous agent execution where dependencies allow

**[→ See parallel execution examples in Usage Guide](docs/usage-guide.md)**

## Subagent Command Invocation Pattern

### **ALWAYS Use Claude Code Natural Language for Subagent Commands**

**🔧 Critical Integration Pattern**: When subagents need to invoke other commands, they MUST use the Claude Code natural language pattern:

```
Use the target-agent-name subagent to [action] [context]
```

**⚠️ CRITICAL**: Sub-agent invocations must use natural language, NEVER Task tool patterns:

**✅ CORRECT:**
```
Use the research-specialist subagent to research topic from URL
```

**❌ WRONG (outdated Task tool pattern):**
```
Use Task tool with subagent_type: "research-specialist" to research topic from URL
```

### Why This Pattern is Required

- **Claude Code Standards**: Follows native sub-agent invocation patterns
- **System Reliability**: Uses Claude's built-in sub-agent coordination
- **Natural Language**: More intuitive and maintainable than tool patterns
- **Performance**: Better integration with Claude Code's agent system

### Command Invocation Examples

**✅ CORRECT - Natural Language Pattern:**
```markdown
Use the research-specialist subagent to research workflow task patterns from https://www.atlassian.com/agile/project-management to create the required context documentation
```

**❌ INCORRECT - Direct Command References:**
```markdown
suggest using `/claudio:research workflow task https://www.atlassian.com/agile/project-management` to create the required context documentation
```

### When Subagents Need Other Commands

- **Missing Context**: Research creation via research-specialist
- **Additional Analysis**: Quality assessment via code-quality-analyzer  
- **Documentation Generation**: Doc creation via documentation-coordinator
- **Security Review**: Vulnerability analysis via security-review-coordinator

### Implementation Requirements

**🚨 MANDATORY**: All new subagents and localized subagents MUST follow this pattern:

1. **Agent Creation**: Use natural language sub-agent patterns in all agent contexts
2. **Localization**: Update existing agents to use Claude Code sub-agent patterns
3. **Context References**: Replace Task tool references with natural language invocations
4. **Validation**: Test all agent integrations use proper Claude Code syntax

**[→ See sub-agent implementation examples in System Architecture](docs/system-architecture.md)**

## System Reliability and Error Handling

### **Graceful Context Handling**

The Claudio system handles missing extended context gracefully:
- **Resilient Operation**: Agents continue functioning when extended context is incomplete
- **Self-Healing**: Missing context triggers research creation via research-specialist subagent using natural language invocation pattern
- **User Guidance**: Clear instructions for creating missing documentation with authoritative sources
- **Memory Efficient**: No continuous searching for non-existent files prevents memory leaks

### **Enhanced Error Handling and File Management**

**File Operation Safety:**
- **File Termination Validation**: All file operations include proper termination checks and integrity validation
- **Error Recovery**: Comprehensive error detection, recovery mechanisms, and graceful handling of incomplete operations
- **Data Integrity**: Mandatory validation of file completeness and proper data termination before workflow progression
- **Cleanup Mechanisms**: Automatic cleanup of incomplete or corrupted files with rollback capabilities

**Robust Operation Patterns:**
- **Validation Chains**: Enhanced validation at each workflow stage with comprehensive completeness checks
- **Recovery Mechanisms**: Graceful handling of partial results, incomplete analysis, and system interruptions  
- **Status Verification**: Mandatory verification that all operations complete successfully before signaling completion
- **Safety Guarantees**: Multi-layer safety mechanisms prevent data loss and ensure system integrity

### **System Reliability Improvements**

**Recent Critical Fixes**:
- **Command→Agent Mapping Validation**: Fixed 15+ subagent_type references to match actual agent files
- **Agent Count Accuracy**: Corrected system statistics to reflect actual 78 agents (23 commands, 18 user + 5 system)
- **Index Synchronization**: Updated both agent and commands indexes with accurate component counts and mappings
- **Direct Coordination Migration**: Completed migration for 8 commands eliminating coordinator overhead
- **Agent Reference Consistency**: Ensured proper -agent suffixes and lowercase-hyphen naming throughout system

**Integration Pattern Enhancements**:
- **Proven Direct Coordination**: 8 commands now use direct coordination pattern for improved performance
- **Accurate Agent References**: All subagent_type references validated against actual implementation files
- **System Reliability**: Enhanced command execution reliability through proper agent mapping
- **Documentation Accuracy**: Technical documentation now matches actual system implementation

## Important Instructions

### **CRITICAL: Anti-Fabrication Policy**

**NEVER fabricate information, data, or results:**

- **NEVER fabricate timelines**: Use actual project data or state "timeline requires analysis"
- **NEVER fabricate security review contents**: Only report actual vulnerabilities found through tool execution
- **NEVER fabricate code quality metrics**: Base assessments on real linter/analyzer outputs
- **NEVER fabricate task status**: Tasks are only complete when tests pass and acceptance criteria are met
- **NEVER add superlatives to descriptions**: Avoid "comprehensive", "excellent", "amazing" - use factual language
- **NEVER create sample data as real data**: Clearly mark all examples, templates, and placeholders
- **NEVER assume test results**: Execute tests and report actual outcomes only
- **NEVER fabricate documentation quality**: Base README and documentation assessments on actual project analysis
- **NEVER assume integration capabilities**: Verify actual tool and framework compatibility through discovery analysis

**Requirements for all agents and commands:**
- Base all outputs on actual analysis of real project data
- Execute tools and report their actual results
- Mark uncertain information as "requires analysis" or "needs investigation"
- Use precise, factual language without unnecessary adjectives
- Clearly distinguish between templates/examples and real project data
- Report actual file contents, not assumed or fabricated content
- Execute tests before marking tasks complete
- Use actual tool outputs for quality and security assessments
- Generate documentation only after comprehensive discovery analysis
- Validate integration recommendations through actual framework detection

### **CRITICAL: Lowercase-Hyphen Naming Convention**

**ALWAYS use lowercase-hyphen naming for ALL Claudio system components:**

- **Agent Files**: `agent-name.md` (NOT `agent_name.md`)
- **Agent References**: `Task tool with subagent_type: "agent-name"` (NOT `claudio:agent_name`)
- **Command Files**: `command-name.md` (NOT `command_name.md`)
- **Documentation Files**: `user-guide.md`, `developer-guide.md` (NOT underscore variants)
- **Template Variables**: `{agent-name}`, `{command-name}` (NOT underscore variants)
- **Generated Components**: ALL generators must produce lowercase-hyphen naming

**This convention ensures:**
- ✅ Consistent agent invocation patterns across all workflows
- ✅ Successful agent validation tests 
- ✅ Reliable command-agent integration
- ✅ Zero naming conflicts in generated systems

### **CRITICAL: Sub-Agent Invocation Pattern Clarification**

**For COMMANDS invoking sub-agents, use Task tool pattern:**

**✅ COMMANDS use Task tool pattern:**
```
Task with subagent_type: "target-agent" - pass the input-value argument for processing
```

**For SUB-AGENTS invoking other sub-agents, use natural language:**

**✅ SUB-AGENTS use natural language pattern:**
```
Use the target-agent-name subagent to [action] [context]
```

**❌ FORBIDDEN Pattern (for both):**
```
suggest using `/claudio:command-name` to [action]
```

**This hybrid approach ensures:**
- ✅ Commands use proper Tool-based invocation for parallel execution
- ✅ Sub-agents use Claude Code's natural language sub-agent patterns
- ✅ Prevention of bash execution errors and tool conflicts
- ✅ Consistent system reliability across all coordination patterns

**🚨 MANDATORY for all new components and localization processes**

### **Changelog Maintenance**

**Always maintain the changelog** when working on the Claudio system. Check for `changelog/YYYY-MM-DD.md` file for today and update it with any changes made to:
- Agent contexts (`extended_context/` directory)
- Commands (`.claude/commands/` directory) 
- System documentation (`README.md`, `CLAUDE.md`, `docs/` directory)
- Project structure or new features

**[→ See complete changelog protocol](docs/changelog-management.md)**

## Getting Started

1. **New to Claudio?** Start with the [Usage Guide](docs/usage-guide.md) for practical examples
2. **Need technical details?** Check the [System Architecture](docs/system-architecture.md) documentation
3. **Want advanced features?** Explore [Specialized Features](docs/specialized-features.md) like Research and Claude SDK
4. **Optimizing workflows?** Review [Best Practices](docs/best-practices.md) for proven strategies
5. **Contributing changes?** Follow the [Changelog Management](docs/changelog-management.md) protocol

---

This system transforms ad-hoc development into systematic, trackable, and collaborative project execution.