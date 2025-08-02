# Claudio Install System - Extended Context and Templates

This document provides detailed templates, patterns, and guidance for the Claudio installation system. It serves as extended context for install sub-agents and contains reference information for installation operations.

## Installation System Overview

The Claudio install system deploys Claudio components to different target locations with flexible installation modes and comprehensive validation. It uses a coordinator pattern with parallel sub-agent execution for efficient installation and validation.

## Installation Modes

### User Mode (`user`)
**Target Location**: `~/.claude/`
**Use Case**: System-wide installation for individual user
**Limitations**: Commands-only installation (no full workflow)

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
- All command files including master claudio.md
- All agent files including workflow coordinators
- Complete prompt library
- Full Claudio development environment

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
- Essential command files only
- Required agent files for commands
- Essential prompt directories

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

## File Placement Patterns

### Command Files
- **Source**: `.claude/commands/*.md`
- **Target**: `<install-location>/.claude/commands/claudio/*.md`
- **Namespace**: Commands reference agents as `claudio:<agent-name>`

### Agent Files
- **Source**: `.claude/agents/*.md`
- **Target**: `<install-location>/.claude/agents/claudio/*.md`
- **Namespace**: Agents maintain claudio namespace references

### Prompt Files
- **Source**: `prompts/*/`
- **User Mode Target**: `~/.claude/agents/claudio/prompts/*/`
- **Project/Path Target**: `<install-location>/.claude/agents/claudio/prompts/*/`

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

## Installation Process Templates

### Pre-Installation Checklist
```markdown
## Installation Checklist
- [ ] Parse installation parameters (mode, type, path)
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

### File Copy Operations
```bash
# Copy commands with namespace organization
cp source/.claude/commands/*.md <target>/.claude/commands/claudio/

# Copy agents with namespace organization
cp source/.claude/agents/*.md <target>/.claude/agents/claudio/

# Copy prompts to appropriate location
# User mode:
cp -r source/prompts/* <target>/.claude/agents/claudio/prompts/
# Project/Path mode:
cp -r source/prompts/* <target>/.claude/agents/claudio/prompts/
```

## Validation Templates

### File Validation Checklist
```markdown
## File Validation Checklist
- [ ] All required directories exist
- [ ] All expected files are present
- [ ] Files are readable and non-empty
- [ ] File formats match expected patterns
- [ ] Namespace references are correct
- [ ] Prompt location references are valid
```

### Integration Validation Tests
```markdown
## Integration Tests
- [ ] Commands can reference their agents
- [ ] Agents can find their prompt contexts
- [ ] Cross-agent references work correctly
- [ ] Dynamic prompt location logic functions
- [ ] Installation is ready for use
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
- Commands: [count] files installed to commands/claudio/
- Agents: [count] files installed to agents/claudio/
- Prompts: [count] directories installed to [prompts location]

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