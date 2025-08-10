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

**🚨 CRITICAL: ALL agent names use lowercase-hyphen format:** `claudio:agent-name subagent`

**🚀 PERFORMANCE: Use parallel Task invocations when possible:** `Run multiple Task invocations in a SINGLE message`

**🔧 INTEGRATION: Subagents MUST use Task tool pattern:** `Use Task tool with subagent_type: "agent-name" to [action]`

**⚠️ CRITICAL: NEVER wrap Task tool invocations in bash code blocks** - causes execution failures

## Core Components

### Commands
- **`/claudio:research`**: Create research documentation with overview and troubleshooting guides
- **`/claudio:discovery`**: Analyze project structure and capabilities
- **`/claudio:documentation`**: Create project documentation
- **`/claudio:prd`**: Generate Product Requirements Documents
- **`/claudio:plan`**: Create implementation plans
- **`/claudio:task`**: Break down plans into executable tasks
- **`/claudio:claudio`**: Complete project analysis workflow
- **`/claudio:upgrade`**: Parallel upgrade system using 6 specialized subagents for improved performance
- **`/claudio:claude-sdk`**: Analyze and improve Claude Code implementations

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
/claudio:discovery ./my-project        # Analyze project structure
/claudio:research backend nodejs       # Create research docs in .claudio/research/backend/nodejs/
/claudio:prd feature user-auth         # Create requirements
/claudio:plan feature user-auth "4w"   # Plan implementation
```

### Complete Project Analysis
```bash
/claudio:claudio ../my-project
# Creates complete .claudio/ folder with analysis, requirements, plans, and tasks
```

### System Upgrade and Cleanup
```bash
/claudio:upgrade ./my-project           # High-performance parallel upgrade with 6 specialized subagents
/claudio:upgrade --check               # Preview upgrade changes without applying
/claudio:upgrade --force               # Force complete re-installation with full re-discovery
```

**Parallel Architecture**: The upgrade system uses 6 specialized subagents with parallel execution for improved performance:
- **Discovery Analyzer**: Installation analysis and compatibility assessment
- **Legacy Cleaner**: Phase 0 deprecated pattern cleanup with user content protection
- **Template Analyzer**: Localization planning and conflict detection  
- **Backup Manager**: Backup creation and rollback script generation
- **Component Localizer**: Project-specific template application and test command coordination
- **Installation Validator**: Integrity verification and completion reporting

**Performance Optimization**: Parallel batch execution (Phase 2: template analysis + backup creation, Phase 3: localization + validation) provides improved efficiency while maintaining safety guarantees.

### Claude Code Development
```bash
/claudio:claude-sdk command_name        # Analyze specific Claude Code command and its subagents
/claudio:claude-sdk --cross-system      # Compare implementations across systems
```

**Sequential Analysis**: The Claude SDK architect analyzes one command at a time, evaluating the command structure first, then each individual subagent separately to prevent system overload and ensure focused analysis.

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
- **Team Collaboration**: Shared context enables consistent development approach
- **Project Management**: Progress tracking provides visibility into development status
- **Quality Assurance**: Task contexts include testing and review requirements

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

### **ALWAYS Use Task Tool for Subagent Commands**

**🔧 Critical Integration Pattern**: When subagents need to invoke other commands, they MUST use the Task tool pattern:

```
Use Task tool with subagent_type: "target-agent-name" to [action] [context]
```

**⚠️ CRITICAL**: Task tool invocations must be plain text, NEVER wrapped in bash code blocks:

**✅ CORRECT:**
```
Use Task tool with subagent_type: "research-specialist" to research topic from URL
```

**❌ WRONG (causes bash execution failures):**
```bash
Use Task tool with subagent_type: "research-specialist" to research topic from URL
```

### Why This Pattern is Required

- **Proper Tool Usage**: Subagents cannot execute slash commands directly
- **System Reliability**: Prevents bash execution failures and tool errors
- **Workflow Integration**: Maintains proper agent coordination and data flow
- **Error Prevention**: Eliminates invalid command invocation attempts

### Command Invocation Examples

**✅ CORRECT - Task Tool Pattern:**
```markdown
Use the Task tool with subagent_type: "research-specialist" to research workflow task patterns from https://www.atlassian.com/agile/project-management to create the required context documentation
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

1. **Agent Creation**: Use Task tool pattern in all agent contexts
2. **Localization**: Update existing agents to use Task tool pattern
3. **Context References**: Replace command references with Task tool invocations
4. **Validation**: Test all agent integrations use proper Task tool syntax

**[→ See Task tool implementation examples in System Architecture](docs/system-architecture.md)**

## Graceful Context Handling

The Claudio system handles missing extended context gracefully:
- **Resilient Operation**: Agents continue functioning when extended context is incomplete
- **Self-Healing**: Missing context triggers research creation via research-specialist subagent using Task tool pattern
- **User Guidance**: Clear instructions for creating missing documentation with authoritative sources
- **Memory Efficient**: No continuous searching for non-existent files prevents memory leaks

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

**Requirements for all agents and commands:**
- Base all outputs on actual analysis of real project data
- Execute tools and report their actual results
- Mark uncertain information as "requires analysis" or "needs investigation"
- Use precise, factual language without unnecessary adjectives
- Clearly distinguish between templates/examples and real project data
- Report actual file contents, not assumed or fabricated content
- Execute tests before marking tasks complete
- Use actual tool outputs for quality and security assessments

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

### **CRITICAL: Task Tool Pattern for Subagent Commands**

**ALWAYS use Task tool pattern when subagents invoke other commands:**

**✅ REQUIRED Pattern:**
```
Use Task tool with subagent_type: "target-agent" to [action] [context]
```

**❌ FORBIDDEN Pattern:**
```
suggest using `/claudio:command-name` to [action]
```

**This pattern ensures:**
- ✅ Proper tool usage and system reliability
- ✅ Correct agent coordination and data flow
- ✅ Prevention of bash execution errors
- ✅ Maintainable subagent integration

**🚨 MANDATORY for all new subagents and localization processes**

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