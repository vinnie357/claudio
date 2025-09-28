# Claudio Install System - Extended Context and Templates

This document provides detailed templates, patterns, and guidance for the Claudio installation system with intelligent project localization. It serves as extended context for install sub-agents and contains reference information for localized installation operations.

## Installation System Overview

The Claudio install system deploys project-localized Claudio components to different target locations with flexible installation modes and comprehensive validation. Components are customized based on project discovery rather than directly copied. It uses a coordinator pattern with parallel sub-agent execution for efficient localized installation and validation.

## Installation Modes

### User Mode (`user`)
**Target Location**: `~/.claude/`
**Use Case**: System-wide installation for individual user
**Installation Method**: Direct copying of generic templates (no localization)
**Limitations**: Commands-only installation (no full workflow)
**Purpose**: Provides generic tools for initiating localization workflows on target projects

**Directory Structure**:
```
~/.claude/
├── commands/claudio/
│   ├── discovery.md
│   ├── prd.md
│   ├── plan.md
│   ├── task.md
│   ├── install.md
│   └── ...
├── agents/claudio/
│   ├── discovery-coordinator.md
│   ├── prd-agent.md
│   ├── install-coordinator.md
│   └── ...
└── agents/claudio/prompts/
    ├── discovery/
    ├── prd/
    ├── install/
    └── ...
```

### Project Mode (default)
**Target Location**: Current working directory `./.claude/`
**Use Case**: Project-specific installation
**Capabilities**: Full workflow or commands-only installation

**Directory Structure**:
```
.claude/
├── commands/claudio/
│   ├── claudio.md (full workflow only)
│   ├── discovery.md
│   ├── prd.md
│   └── ...
├── agents/claudio/
│   ├── claudio-coordinator.md (full workflow only)
│   ├── discovery-agent.md
│   └── ...
└── prompts/
    ├── claudio/ (full workflow only)
    ├── discovery/
    ├── prd/
    └── ...
```

### Path Mode (`/path/to/code`)
**Target Location**: User-specified path `<path>/.claude/`
**Use Case**: Installation to specific directory
**Capabilities**: Full workflow or commands-only installation

**Directory Structure**: Same as Project Mode but at specified path

## Installation Types

### Full Workflow Installation (`claudio`)
**Availability**: Project and Path modes only
**Components Installed**:
- All command files including master claudio.md (localized for project)
- All agent files including workflow coordinators (localized for project)
- Complete prompt library (localized for project context)
- Full Claudio development environment customized for project requirements

**Command Files**:
- claudio.md (master workflow orchestrator)
- discovery.md, prd.md, plan.md, task.md
- documentation.md, research.md, design.md
- code-quality.md, install.md

**Agent Files**:
- All coordinator agents (claudio-coordinator, discovery-coordinator, etc.)
- All specialized sub-agents
- Complete agent ecosystem

**Prompt Directories**:
- Complete prompt library with all contexts
- Extended documentation and templates
- Cross-referenced prompt files

### Commands-Only Installation (`commands`)
**Availability**: All modes (user, project, path)
**Components Installed**:
- **User Mode**: Generic template command files for cross-project use
- **Project/Path Modes**: Essential command files localized for specific project
- **User Mode**: Generic agent templates that can work with any project
- **Project/Path Modes**: Required agent files localized for project context
- **User Mode**: Generic prompt directories for universal applicability
- **Project/Path Modes**: Essential prompt directories customized for project requirements

**Command Files**:
- Core commands: discovery.md, prd.md, plan.md, task.md
- Utility commands: install.md, documentation.md
- No master claudio.md workflow

**Agent Files**:
- Essential agents for core commands
- Sub-agents required for functionality
- No full workflow coordinators

**Prompt Directories**:
- Command-specific prompts only
- Essential context documents
- Minimal prompt library

## Installation Patterns by Mode

### User Mode - Direct Template Copying
- **Template Source**: `.claude/commands/*.md`, `.claude/agents/*.md`, `prompts/*/`
- **Target**: `~/.claude/commands/claudio/*.md`, `~/.claude/agents/claudio/*.md`, `~/.claude/agents/claudio/prompts/*/`
- **Method**: Direct copying of generic templates
- **Purpose**: Provides tools that can initiate localization workflows on any target project
- **Namespace**: Commands reference agents as `claudio:<agent-name>`

### Project/Path Mode - Localized Component Generation
- **Template Source**: `.claude/commands/*.md`, `.claude/agents/*.md`, `prompts/*/`
- **Target**: `<install-location>/.claude/commands/claudio/*.md`, `<install-location>/.claude/agents/claudio/*.md`, `<install-location>/.claude/agents/claudio/prompts/*/`
- **Method**: Project-specific component generation based on discovery analysis
- **Localization**: Commands, agents, and prompts customized for project technology stack, architecture, and requirements
- **Namespace**: Commands reference agents as `claudio:<agent-name>` with project-specific enhancements

## Dynamic Prompt Location Logic

Installed agents must include logic to reference prompts in location-appropriate paths:

### Template for Dynamic Prompt References
```markdown
## Extended Context Reference:
Reference prompt locations based on installation context:
- Check if `./.claude/agents/claudio/prompts/<prompt>/<prompt>.md` exists first
- If not found, reference `~/.claude/agents/claudio/prompts/<prompt>/<prompt>.md`
- Use whichever location is available
```

### Implementation Example
```markdown
## Discovery Process Reference:
When performing discovery analysis, reference:
1. Primary location: `./.claude/agents/claudio/prompts/discovery/claude.md`
2. Fallback location: `~/.claude/agents/claudio/prompts/discovery/discovery.md`
3. Use the first available location for extended context
```

## Mode-Specific Installation Process Templates

### Pre-Installation Checklist
```markdown
## Installation Checklist
- [ ] Parse installation parameters (mode, type, path)
- [ ] Conditional Discovery Analysis:
  - [ ] **Project/Path Modes**: Run or validate project discovery for localization
  - [ ] **User Mode**: Skip discovery (no project context)
- [ ] **Project/Path Modes**: Analyze project structure and technology stack
- [ ] Validate target directory permissions
- [ ] Check available disk space
- [ ] Identify any existing installations
- [ ] Confirm installation parameters with user
```

### Directory Creation Template
```bash
# User mode directories
mkdir -p ~/.claude/commands/claudio
mkdir -p ~/.claude/agents/claudio
mkdir -p ~/.claude/agents/claudio/prompts

# Project/Path mode directories
mkdir -p <target>/.claude/commands/claudio
mkdir -p <target>/.claude/agents/claudio
mkdir -p <target>/.claude/prompts
```

### Mode-Specific Component Operations
```bash
# User Mode Operations
# Direct copying of generic templates
cp source/.claude/commands/*.md ~/.claude/commands/claudio/
cp source/.claude/agents/*.md ~/.claude/agents/claudio/
cp -r source/prompts/* ~/.claude/agents/claudio/prompts/

# Project/Path Mode Operations
# Generate localized components based on project discovery
generate_localized_commands(project_discovery, templates) -> <target>/.claude/commands/claudio/
generate_localized_agents(project_discovery, templates) -> <target>/.claude/agents/claudio/
generate_localized_prompts(project_discovery, templates) -> <target>/.claude/agents/claudio/prompts/
```

## Validation Templates

### Mode-Specific Component Validation Checklist
```markdown
## Component Validation Checklist
- [ ] All required directories exist
- [ ] All expected components are present
- [ ] Components are readable and properly formatted
- [ ] **Project/Path Modes**: Project-specific customizations are correctly applied
- [ ] **User Mode**: Generic templates are properly copied
- [ ] Namespace references are correct
- [ ] Prompt location references are valid
- [ ] **Project/Path Modes**: Discovery-based localization is accurate
- [ ] **User Mode**: Templates are ready for cross-project use
- [ ] **Project/Path Modes**: Components reflect project context and requirements
- [ ] **User Mode**: Components can initiate localization on target projects
```

### Mode-Specific Integration Validation Tests
```markdown
## Integration Tests
- [ ] Commands can reference their agents (generic or localized)
- [ ] Agents can find their prompt contexts
- [ ] Cross-agent references work correctly
- [ ] Dynamic prompt location logic functions
- [ ] **Project/Path Modes**: Project-specific customizations integrate properly
- [ ] **User Mode**: Generic templates work across different project contexts
- [ ] **Project/Path Modes**: Discovery-based features work correctly
- [ ] **User Mode**: Commands can initiate localization workflows on target projects
- [ ] Installation is ready for intended use (project-specific or cross-project)
```

## Error Handling Patterns

### Common Installation Issues
1. **Permission Denied**
   - Check directory permissions
   - Guide user to set appropriate access
   - Suggest alternative installation locations

2. **Path Not Found**
   - Validate installation path exists
   - Create directories as needed
   - Handle invalid path specifications

3. **Disk Space Insufficient**
   - Check available space before installation
   - Provide space requirements
   - Suggest cleanup or alternative locations

4. **File Conflicts**
   - Detect existing installations
   - Offer backup/overwrite options
   - Handle partial installations gracefully

### Error Recovery Procedures
1. **Partial Installation Recovery**
   - Track successfully installed files
   - Complete remaining installations
   - Clean up on unrecoverable failures

2. **Permission Fix Procedures**
   - Provide specific chmod commands
   - Guide user through permission setting
   - Verify permissions before retrying

3. **Rollback Procedures**
   - Remove partially installed files
   - Restore original state if possible
   - Clean up created directories

## Installation Report Templates

### Success Report Template
```markdown
# Claudio Installation Complete ✓

## Installation Summary
- **Mode**: [user|project|path]
- **Type**: [full workflow|commands only]
- **Location**: [installation path]
- **Status**: SUCCESS

## Components Installed
- **Project/Path Modes**: [count] project-specific commands generated to commands/claudio/
- **User Mode**: [count] generic template commands copied to commands/claudio/
- **Project/Path Modes**: [count] localized agents generated to agents/claudio/
- **User Mode**: [count] generic agent templates copied to agents/claudio/
- **Project/Path Modes**: [count] customized prompt directories generated to [prompts location]
- **User Mode**: [count] generic prompt templates copied to [prompts location]

## System Ready
Your Claudio installation is complete and ready to use!

### Next Steps:
1. Test installation with: `/discovery`
2. Explore available commands in: [location]/commands/claudio/
3. Review system capabilities in installed documentation

### Usage Notes:
- Commands reference agents using claudio:<agent-name> syntax
- Prompt contexts are automatically resolved based on installation location
- All components follow Claudio namespace conventions
- **Project/Path Modes**: Components are customized for your specific project and technology stack
- **User Mode**: Generic templates enable localization workflows on target projects
- **Project/Path Modes**: Discovery-based features provide project-aware functionality
- **User Mode**: Commands will perform discovery and localization when executed on target projects
```

### Failure Report Template
```markdown
# Claudio Installation Failed ✗

## Installation Summary  
- **Mode**: [user|project|path]
- **Type**: [full workflow|commands only]
- **Location**: [attempted installation path]
- **Status**: FAILED

## Issues Encountered
[List specific errors and failures]

## Partially Installed Components
[List what was successfully installed, if any]

## Resolution Steps
1. [Specific steps to resolve issues]
2. [Alternative installation options]
3. [Contact information for additional help]

## Cleanup Required
[Instructions for cleaning up partial installation]
```

## Maintenance and Updates

### Update Procedures
- Check for newer Claudio components
- Backup existing installation before updates
- Apply updates while preserving local customizations
- Validate updated installation integrity

### Uninstall Procedures
- Remove all installed files and directories
- Clean up namespace references
- Restore original system state
- Confirm complete removal

This extended context provides comprehensive guidance for all aspects of Claudio system installation, validation, and maintenance. Reference these templates and patterns to ensure consistent, reliable installation operations.