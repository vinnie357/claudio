# Claudio Commands → Subagents Tree Map

**System Marker**: `system: claudio-system`  
**Total Commands**: 23  
**Total Agents**: 78  
**Last Updated**: 2025-08-24  

## Command Architecture Overview

```
Claudio Command System (23 Commands)
├── Core Workflow Commands (5)
│   ├── /claudio:claudio → Direct coordination (no coordinator)
│   │   ├── discovery-agent (sequential)
│   │   ├── prd-agent (parallel)
│   │   ├── plan-agent (parallel)
│   │   ├── task-agent (parallel) 
│   │   ├── claudio-structure-creator-agent (sequential)
│   │   └── [Total: 5 subagents with parallel execution]
│   │
│   ├── /claudio:discovery → discovery-agent [LEAF]
│   ├── /claudio:prd → prd-agent [LEAF]
│   ├── /claudio:plan → plan-agent [LEAF]  
│   └── /claudio:task → task-agent [LEAF]
│
├── Installation & Management (3)
│   ├── /claudio:install → Direct coordination (no coordinator)
│   │   ├── install-path-validator-agent (sequential)
│   │   ├── install-directory-creator-agent (sequential)
│   │   ├── discovery-structure-analyzer (parallel)
│   │   ├── discovery-tech-analyzer (parallel)
│   │   ├── discovery-architecture-analyzer (parallel)
│   │   ├── discovery-integration-analyzer (parallel)
│   │   ├── discovery-consolidator (sequential)
│   │   ├── install-commands-localizer-agent (parallel)
│   │   ├── test-command-generator (parallel)
│   │   ├── install-agents-localizer-agent (sequential)
│   │   ├── install-extended-context-generator-agent (sequential)
│   │   ├── claude-md-generator-agent (sequential)
│   │   ├── user-readme-generator-agent (sequential)
│   │   └── install-validator (sequential)
│   │   └── [Total: 14 subagents with mixed parallel/sequential execution]
│   │
│   ├── /claudio:install-commands → install-commands-coordinator-agent
│   │   ├── install-commands-only-agent (streamlined installation)
│   │   └── [Total: 1 subagent, fast commands-only pattern]
│   │
│   └── /claudio:upgrade → Direct coordination (no coordinator)
│       ├── upgrade-discovery-analyzer (sequential)
│       ├── upgrade-legacy-cleaner (sequential)
│       ├── upgrade-template-analyzer (parallel)
│       ├── upgrade-backup-manager (parallel)
│       ├── upgrade-component-localizer (parallel)
│       ├── claude-md-generator-agent (parallel)
│       └── upgrade-installation-validator (sequential)
│       └── [Total: 7 subagents in parallel batches]
│
├── Analysis & Quality (3)
│   ├── /claudio:code-quality → code-quality-analyzer [LEAF]
│   ├── /claudio:security-review → Direct coordination (no coordinator)
│   │   └── security-review-coordinator (parallel)
│   │   └── [Total: 1 subagent with internal coordination]
│   │
│   └── /claudio:design → design-analyzer [LEAF]
│
├── Development Tools (7)
│   ├── /claudio:documentation → documentation-coordinator  
│   │   ├── documentation-readme-creator
│   │   ├── documentation-user-guide-creator
│   │   ├── documentation-developer-guide-creator
│   │   └── documentation-api-creator
│   │   └── [Total: 4 subagents in parallel]
│   │
│   ├── /claudio:update-docs → Direct coordination (no coordinator)
│   │   ├── readme-updater-agent (parallel)
│   │   ├── claude-md-updater-agent (parallel)
│   │   └── changelog-updater-agent (parallel)
│   │   └── [Total: 3 subagents in parallel]
│   │
│   ├── /claudio:test → project-test-runner [LEAF]
│   ├── /claudio:research → research-specialist [LEAF]
│   ├── /claudio:phoenix-dev → phoenix-dev-executor [LEAF]
│   ├── /claudio:generate-test-commands → test-command-generator [LEAF]
│   └── /claudio:test-review → test-review [LEAF]
│
└── System & SDK (5)  
    ├── /claudio:claude-sdk → claudio-claude-sdk-architect
    │   ├── claudio-claude-commands-analyst (parallel)
    │   └── claudio-claude-subagents-analyst (parallel)  
    │   └── [Total: 2 subagents in parallel]
    │
    ├── /claudio:new-command → Direct coordination (no coordinator)
    │   ├── research-specialist (parallel)
    │   ├── new-command-generator (parallel)
    │   └── new-command-validator (parallel)
    │   └── [Total: 3 subagents in parallel]
    │
    ├── /claudio:newprompt → Direct coordination (no coordinator)
    │   ├── newprompt-agent-creator (parallel)
    │   ├── newprompt-command-creator (parallel)
    │   └── newprompt-integration-planner (parallel)
    │   └── [Total: 3 subagents in parallel]
    │
    ├── /claudio:implement → Direct coordination (no coordinator)
    │   └── implement-agent (parallel)
    │   └── [Total: 1 subagent]
    │
    └── /claudio:gcms → git-commit-message [LEAF]
```

## Installation Groupings

### Commands-Only Installation (/claudio:install commands)
**Installs Core System (78 agents):**
- All 23 command files
- All required subagents for commands to function
- Discovery, workflow, documentation, and research agents
- Extended context: workflow/, development/, research/, documentation/

### Full Workflow Installation (/claudio:install)  
**Installs Complete System (78 agents + workflow docs):**
- Everything from commands-only
- Plus: Complete .claudio/ workflow documents (discovery.md, prd.md, plan.md, etc.)
- Extended context: All categories as needed by installed agents

### Complete Analysis (/claudio:claudio)
**Uses Existing Installation + Orchestrates Full Workflow:**
- Requires existing Claudio installation
- Direct coordination with 20+ subagents in conditional batches
- Creates complete .claudio/docs/ and phase structure

## Extended Context Requirements by Command Group

### Core Workflow Commands
- **Required**: workflow/ (discovery/, prd/, planning/, task/)
- **Optional**: development/, research/, documentation/

### Installation & Management  
- **Required**: infrastructure/ (installation/, upgrade/)
- **Conditional**: workflow/ (if doing full workflow)

### Analysis & Quality
- **Required**: development/ (code_quality/, design/)
- **Security**: May reference security patterns (not yet implemented)

### Development Tools
- **Required**: documentation/, research/
- **Testing**: development/testing/ 
- **Phoenix**: phoenix-dev/

### System & SDK
- **Required**: command-analysis/, agent-analysis/
- **Integration**: infrastructure/, workflow/

## Summary Statistics

- **Total Commands**: 23
- **Leaf Commands** (single agent): 12  
- **Multi-agent Commands** (multiple agents): 11
- **Maximum Subagents**: 14 (/claudio:install direct coordination) 
- **Total Unique Agents**: 78 across entire system
- **Extended Context Categories**: 7 (6 typically used)

## All System Agents (Alphabetical)

**System Marker**: `system: claudio-system`  
**Total**: 78 agents across all categories

### A-C
- **changelog-updater-agent** - Creates and maintains changelog files with version tracking
- **claude-commands-analyst** - Evaluates Claude Code slash commands across systems  
- **claude-md-updater-agent** - Maintains and updates CLAUDE.md project integration files
- **claude-sdk-architect** - Creates new Claude Code slash commands and sub-agents
- **claude-subagents-analyst** - Analyzes Claude Code sub-agents across systems
- **claudio-coordinator-agent** - *(Deprecated)* Orchestrates complete Claudio workflow  
- **claudio-install-commands-test** - Tests /claudio:install commands execution
- **claudio-install-test** - Tests /claudio:install full workflow execution
- **claudio-structure-creator-agent** - Finalizes .claudio directory structure and creates summary docs
- **claudio-test-suite** - Execute all 4 core Claudio workflow tests in parallel
- **claudio-upgrade-test** - Tests /claudio:upgrade complete workflow execution
- **code-quality-analyzer** - Analyzes code quality by running linters, formatters, static analysis
- **command-agent-integration-validator** - Validates command-agent relationships match index specs

### D-G  
- **design-analyzer** - Analyzes UX/UI design systems, evaluates design patterns
- **discovery-agent** - **CORE** Project analysis and technology discovery specialist
- **discovery-validator** - Validates discovery document quality and analysis depth
- **documentation-api-creator** - Creates comprehensive API reference documentation
- **documentation-coordinator** - Coordinates parallel documentation creation by specialized sub-agents
- **documentation-developer-guide-creator** - Creates comprehensive developer documentation  
- **documentation-readme-creator** - Creates comprehensive project README documentation
- **documentation-user-guide-creator** - Creates comprehensive user guides with tutorials
- **extended-context-content-validator** - Validates extended_context content quality and customization
- **extended-context-dependency-validator** - Validates agents have required extended_context categories
- **generate-test-commands-test** - Tests /claudio:generate-test-commands command execution
- **git-commit-message** - **LEAF** Generate conventional commit messages from git status

### I-N
- **implement-agent** - Executes implementation plans by coordinating task execution
- **install-commands-coordinator-agent** - **FAST** Orchestrates streamlined commands-only installation
- **install-commands-only-agent** - Handles commands-only installations with .claude/ directories
- **install-full-workflow-agent** - Handles complete full workflow installations
- **install-summary-agent** - Generates comprehensive installation summaries and guidance
- **install-system-installer** - Handles file copying and directory creation for system installations
- **install-user-templates-agent** - Handles user mode installations with generic templates
- **install-validation-coordinator** - Orchestrates comprehensive installation validation
- **install-validator** - Validates Claudio installation completeness and generates reports
- **installation-mode-validator** - Applies mode-specific validation criteria
- **new-command-generator** - Generate custom commands with sub-agents and extended context
- **new-command-validator** - Validates generated custom commands for structure and quality
- **newprompt-agent-creator** - Creates comprehensive agent prompts following Claudio conventions
- **newprompt-command-creator** - Creates command files following Claudio patterns  
- **newprompt-coordinator** - Coordinates creation of new agent prompts and commands
- **newprompt-integration-planner** - Plans workflow integration requirements for new agents

### O-R
- **orchestrator-integration-validator** - Validates complex agent hierarchies and parallel execution
- **phoenix-dev-executor** - **LEAF** Analyze and optimize Elixir Phoenix development workflows
- **plan-agent** - **CORE** Creates detailed implementation plans with phases and time estimates
- **prd-agent** - **CORE** Creates comprehensive Product Requirements Documents
- **project-test-runner** - **LEAF** Executes project test suites with intelligent framework detection
- **readme-updater-agent** - Updates and maintains project README files with current features
- **research-specialist** - **LEAF** Conduct comprehensive research and create expert agent prompts

### S-T
- **security-architecture-analyst** - System-level security design and architecture evaluation
- **security-diagram-generator** - Mermaid diagram creation specialist for security visualization
- **security-review-coordinator** - Coordinates comprehensive security review using STRIDE methodology
- **security-threat-modeler** - STRIDE-based threat identification and analysis specialist
- **task-agent** - **CORE** Breaks down implementation plans into specific executable tasks
- **test-command-generator** - **LEAF** Generates project-specific test commands with specialized agents
- **test-review** - **LEAF** Reviews testing suite tools and provides recommendations

### U-W
- **upgrade-backup-manager** - Specializes in backup creation and version management for upgrades
- **upgrade-component-localizer** - Specializes in component re-localization execution for upgrades
- **upgrade-discovery-analyzer** - Analyzes project discovery and installation status for upgrades
- **upgrade-installation-validator** - Specializes in post-upgrade validation and reporting
- **upgrade-legacy-cleaner** - Specializes in Phase 0 legacy pattern cleanup for upgrades
- **upgrade-orchestrator-agent** - **FAST** Lightweight coordinator for Claudio upgrade operations
- **upgrade-template-analyzer** - Specializes in template comparison and localization planning
- **vulnerability-assessment-specialist** - Code and configuration security analysis specialist
- **workflow-validator** - **MANDATORY** Validates Claudio workflow document quality and completeness

### Agent Categories by Function

#### **Core Workflow Agents** (5) - Essential for project analysis
- discovery-agent, prd-agent, plan-agent, task-agent, claudio-structure-creator-agent

#### **Installation & Upgrade Agents** (12) - System management
- All install-* and upgrade-* agents

#### **Documentation Agents** (7) - Content generation
- All documentation-* agents, readme-updater-agent, claude-md-updater-agent, changelog-updater-agent

#### **Validation Agents** (8) - Quality assurance  
- All *-validator agents, discovery-validator, workflow-validator

#### **Testing Agents** (4) - Quality and testing
- All test-* agents, claudio-test-suite

#### **Security Agents** (4) - Security analysis
- All security-* agents, vulnerability-assessment-specialist

#### **System Integration Agents** (6) - Claude Code integration
- All claude-* agents (except claudio-coordinator-agent)

#### **Command Generation Agents** (6) - System expansion
- All new-*, newprompt-* agents

## Direct Coordination Pattern Migration

### **✅ Completed Migrations** (Fast, Reliable)
- **claudio** - Direct coordination, 20+ conditional agents
- **update-docs** - Direct coordination, 3 agents
- **install** - Direct coordination, 14 agents with mixed execution
- **upgrade** - Direct coordination, 7 agents in parallel batches
- **security-review** - Direct coordination, 1 agent with internal coordination
- **newprompt** - Direct coordination, 3 parallel agents
- **new-command** - Direct coordination, 3 parallel agents
- **implement** - Direct coordination, 1 agent

### **🔄 Remaining Coordinator Pattern** (Specialized)
- **documentation** → Uses documentation-coordinator (4 parallel sub-agents)
- **claude-sdk** - Uses claudio-claude-sdk-architect (sequential analysis)
- **install-commands** - Uses install-commands-coordinator-agent (streamlined)

### **✨ Direct Coordination Benefits**
- **Performance**: Eliminated coordinator overhead
- **Reliability**: Reduced coordination complexity
- **Clarity**: Direct command→agent relationships
- **Maintenance**: Simplified debugging and updates

## Dynamic Extended Context Logic

The install system now:
1. **Analyzes installed agents** for extended_context references
2. **Creates only needed categories** (typically 2-6 of 7 available)  
3. **Skips unused categories** to reduce installation bloat
4. **Validates agent-context alignment** during installation

This ensures extended_context creation matches actual subagent requirements rather than creating comprehensive directory structures regardless of usage.

## Agent Dependencies by Extended Context Category

### workflow/
- discovery-agent (workflow/discovery/)
- prd-agent (workflow/prd/)  
- plan-agent (workflow/planning/)
- task-agent (workflow/task/)
- claudio-coordinator-agent (workflow/)

### development/
- code-quality-analyzer (development/code_quality/)
- design-analyzer (development/design/)
- test-command-generator (development/testing/)
- project-test-runner (development/testing/)

### documentation/
- documentation-coordinator (documentation/)
- research-specialist (creates documentation/)

### research/
- research-specialist (research/)

### infrastructure/
- install-full-workflow-agent (infrastructure/installation/)
- upgrade-orchestrator-agent (infrastructure/upgrade/)

### command-analysis/
- claudio-claude-sdk-architect (command-analysis/)
- claudio-claude-commands-analyst (command-analysis/)

### agent-analysis/  
- claudio-claude-sdk-architect (agent-analysis/)
- claudio-claude-subagents-analyst (agent-analysis/)