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

## Core Components

### Commands
- **`/claudio:research`**: Generate specialized research on topics
- **`/claudio:discovery`**: Analyze project structure and capabilities
- **`/claudio:documentation`**: Create comprehensive project documentation
- **`/claudio:prd`**: Generate Product Requirements Documents
- **`/claudio:plan`**: Create detailed implementation plans
- **`/claudio:task`**: Break down plans into executable tasks
- **`/claudio:claudio`**: Complete project analysis workflow
- **`/claudio:upgrade`**: Safe upgrade of Claudio installations with legacy pattern cleanup
- **`/claudio:claude-sdk`**: Analyze and improve Claude Code implementations

### Extended Context Structure
- **`extended_context/workflow/`**: Core workflow contexts (discovery, prd, planning, task)
- **`extended_context/development/`**: Development-specific contexts (code quality, testing, design)
- **`extended_context/infrastructure/`**: System contexts (installation, upgrade, legacy pattern cleanup)
- **`extended_context/documentation/`**: Documentation generation contexts
- **`extended_context/research/`**: Research methodology contexts
- **`extended_context/command-analysis/`**: Claude SDK command evaluation
- **`extended_context/agent-analysis/`**: Claude SDK agent architecture

## Quick Start

### Individual Commands
```bash
/claudio:discovery ./my-project        # Analyze project structure
/claudio:research backend nodejs       # Research specific topics
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
/claudio:upgrade ./my-project           # Upgrade Claudio installation with legacy cleanup
/claudio:upgrade --check               # Preview upgrade changes without applying
/claudio:upgrade --force               # Force complete re-installation
```

**Phase 0 Cleanup**: The upgrade process includes automatic legacy pattern cleanup - removes deprecated `prompts/` structures, old `claudio-*-orchestrator.md` files, and updates naming conventions while preserving all user customizations and project content.

### Claude Code Development
```bash
/claudio:claude-sdk command_name        # Analyze specific Claude Code command and its subagents
/claudio:claude-sdk --cross-system      # Compare implementations across systems
```

**Sequential Analysis**: The Claude SDK architect analyzes one command at a time, evaluating the command structure first, then each individual subagent separately to prevent system overload and ensure focused analysis.

## What "use claudio on ../my-project" means

When you say **"use claudio on ../my-project"**, you're requesting:

1. **Execute**: `/claudio:claudio ../my-project`
2. **Expected Result**: A complete `.claudio/` folder with organized structure inside `../my-project/`
3. **Deliverables**: 
   - **`.claudio/docs/`**: Discovery analysis, PRD requirements, implementation plan, executive summary
   - **`.claudio/phase1/, phase2/, etc.`**: Task breakdown with executable contexts
   - **`.claudio/status.md`**: Progress tracking and workflow status
   - **Comprehensive documentation**: API docs, README, user guides (parallel generation)
   - **Quality analysis**: Security review, code quality assessment, design evaluation
   - **Validation**: Mandatory workflow quality validation ensuring all documents meet standards

This transforms your existing codebase into an organized, trackable development process with clear next steps and **validated quality assurance**.

**[→ See complete workflow examples in Usage Guide](docs/usage-guide.md#comprehensive-claudio-workflow)**

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
- **Self-Healing**: Missing context triggers helpful guidance using `/claudio:research category topic URL`
- **User Guidance**: Clear instructions for creating missing documentation with authoritative sources
- **Memory Efficient**: No continuous searching for non-existent files prevents memory leaks

## Important Instructions

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