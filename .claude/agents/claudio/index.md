# Claudio Commands → Subagents Tree Map

## Command Architecture Overview

```
Claudio Command System (20 Commands)
├── Core Workflow Commands (5)
│   ├── /claudio:claudio → claudio-coordinator-agent
│   │   ├── discovery-agent
│   │   ├── prd-agent  
│   │   ├── plan-agent
│   │   ├── task-agent
│   │   ├── documentation-coordinator → [4 sub-subagents]
│   │   ├── code-quality-analyzer
│   │   ├── test-command-generator
│   │   ├── security-review-coordinator → [3 sub-subagents]
│   │   ├── design-analyzer
│   │   ├── research-specialist
│   │   ├── claudio-structure-creator-agent
│   │   ├── claudio-claude-sdk-architect → [2 sub-subagents] (optional)
│   │   ├── workflow-validator
│   │   └── [Total: 15+ subagents in parallel batches]
│   │
│   ├── /claudio:discovery → discovery-agent [LEAF]
│   ├── /claudio:prd → prd-agent [LEAF]
│   ├── /claudio:plan → plan-agent [LEAF]  
│   └── /claudio:task → task-agent [LEAF]
│
├── Installation & Management (2)
│   ├── /claudio:install → install-full-workflow-agent
│   │   ├── discovery-agent (immediate execution)
│   │   ├── install-system-installer (generates localized components)
│   │   └── initial workflow structure creation
│   │   └── [Total: 2 subagents, direct execution pattern]
│   │
│   └── /claudio:upgrade → upgrade-orchestrator-agent
│       ├── upgrade-discovery-analyzer
│       ├── upgrade-legacy-cleaner
│       ├── upgrade-template-analyzer (parallel)
│       ├── upgrade-backup-manager (parallel)
│       ├── upgrade-component-localizer (parallel)
│       └── upgrade-installation-validator (parallel)
│       └── [Total: 6 subagents in parallel batches]
│
├── Analysis & Quality (3)
│   ├── /claudio:code-quality → code-quality-analyzer [LEAF]
│   ├── /claudio:security-review → security-review-coordinator
│   │   ├── vulnerability-assessment-specialist
│   │   ├── security-architecture-analyst  
│   │   ├── security-threat-modeler
│   │   └── security-diagram-generator
│   │   └── [Total: 4 subagents]
│   │
│   └── /claudio:design → design-analyzer [LEAF]
│
├── Development Tools (5)
│   ├── /claudio:documentation → documentation-coordinator  
│   │   ├── documentation-readme-creator
│   │   ├── documentation-user-guide-creator
│   │   ├── documentation-developer-guide-creator
│   │   └── documentation-api-creator
│   │   └── [Total: 4 subagents in parallel]
│   │
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
    ├── /claudio:new-command → new-command-generator [LEAF]
    ├── /claudio:newprompt → newprompt-coordinator
    │   ├── newprompt-agent-creator (parallel)
    │   ├── newprompt-command-creator (parallel)
    │   └── newprompt-integration-planner (parallel)
    │   └── [Total: 3 subagents in parallel]
    │
    ├── /claudio:implement → implement-agent [LEAF]
    └── /claudio:gcms → git-commit-message [LEAF]
```

## Installation Groupings

### Commands-Only Installation (/claudio:install commands)
**Installs Core System (45+ agents):**
- All 20 command files
- All required subagents for commands to function
- Discovery, workflow, documentation, and research agents
- Extended context: workflow/, development/, research/, documentation/

### Full Workflow Installation (/claudio:install)  
**Installs Complete System (45+ agents + workflow docs):**
- Everything from commands-only
- Plus: Complete .claudio/ workflow documents (discovery.md, prd.md, plan.md, etc.)
- Extended context: All categories as needed by installed agents

### Complete Analysis (/claudio:claudio)
**Uses Existing Installation + Orchestrates Full Workflow:**
- Requires existing Claudio installation
- Executes claudio-coordinator-agent → 15+ subagents in parallel batches
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

- **Total Commands**: 20
- **Leaf Commands** (single agent): 11  
- **Orchestrator Commands** (multiple agents): 9
- **Maximum Subagents**: 15+ (claudio-coordinator-agent)
- **Total Unique Agents**: 45+ across entire system
- **Extended Context Categories**: 7 (6 typically used)

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