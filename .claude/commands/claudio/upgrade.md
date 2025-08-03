---
description: "Upgrade existing Claudio installations with changelog tracking and rollback support"
argument-hint: "[target_path] [options]"
---

Upgrade existing Claudio installations with comprehensive change tracking, backup management, and rollback capabilities. This command safely updates Claudio components while preserving user customizations and providing complete version history.

Use the claudio:upgrade-orchestrator subagent to coordinate safe upgrade operations with detailed change analysis and backup management.

**Path Resolution**: Supports multiple ways to specify upgrade target:
- **Direct Path**: `/claudio:upgrade /path/to/project` (upgrades specified path)
- **Current Directory**: `/claudio:upgrade` (upgrades current working directory)
- **Flag Method**: `/claudio:upgrade --path /custom/path` (alternative syntax)

**Installation Detection**: Automatically detects Claudio installation mode and location:
- **User Mode**: `~/.claude/` (global user installation)
- **Project Mode**: `./.claude/` (current directory installation)  
- **Custom Path**: Specified path installation

**Safety Features**: 
- Timestamped backups before any changes
- Detailed changelogs for all modifications
- Automated rollback scripts for easy reversion
- File integrity validation throughout process

## Usage Modes:

### Full Upgrade (Default)
```bash
# Analyze and upgrade current directory installation
/claudio:upgrade

# Upgrade specific project installation
/claudio:upgrade /path/to/project

# Alternative flag syntax for custom path
/claudio:upgrade --path /custom/path
```
Performs comprehensive analysis and updates all changed components with complete backup and changelog generation.

### Check Mode (Dry Run)
```bash
# Show what would be upgraded in current directory
/claudio:upgrade --check

# Check specific project installation
/claudio:upgrade /path/to/project --check

# Alternative flag syntax
/claudio:upgrade --check --path ~/.claude
```
Analyzes current installation against latest version and displays detailed upgrade preview without applying changes.

### Selective Updates
```bash
# Update only command files (current directory)
/claudio:upgrade --commands

# Update only agent files in specific project
/claudio:upgrade /path/to/project --agents

# Update only prompt contexts
/claudio:upgrade --prompts
```
Target specific component types for focused updates while maintaining dependencies and integration.

### Force Update
```bash
# Force complete refresh of current directory
/claudio:upgrade --force

# Force update specific project
/claudio:upgrade /path/to/project --force

# Alternative flag syntax
/claudio:upgrade --force --path /custom/path
```
Override change detection and perform complete installation refresh, useful for corrupted installations.

## Version Management:

### Rollback Operations
```bash
# List all available versions for current directory
/claudio:upgrade --list-versions

# List versions for specific project
/claudio:upgrade /path/to/project --list-versions

# Rollback current directory to specific version
/claudio:upgrade --rollback 2025-08-02_14-30-15

# Rollback specific project to version
/claudio:upgrade /path/to/project --rollback 2025-08-02_14-30-15

# Show changelog for specific version
/claudio:upgrade --changelog 2025-08-02_14-30-15
```

### History and Tracking
```bash
# Display current directory installation status
/claudio:upgrade --status

# Check status of specific project
/claudio:upgrade /path/to/project --status

# Show detailed upgrade history
/claudio:upgrade --history

# Validate specific installation integrity
/claudio:upgrade /path/to/project --validate
```

## Parameters:
- `target_path`: Optional path to project directory (defaults to current directory)
- `--check`: Preview upgrade changes without applying (dry run mode)
- `--commands`: Update command files only
- `--agents`: Update agent files only  
- `--prompts`: Update prompt contexts only
- `--force`: Force complete refresh regardless of detected changes
- `--path <path>`: Alternative syntax for specifying installation path
- `--rollback <timestamp>`: Rollback to specified version
- `--list-versions`: Show available versions for rollback
- `--changelog <timestamp>`: Display changelog for specific version
- `--status`: Show current installation status and version
- `--history`: Display complete upgrade history
- `--validate`: Validate current installation integrity

## Integration Points:
- **Input Sources**: Current `.claude/` installation structure, latest Claudio version files
- **Output Targets**: Updated installation files, backup archives, changelogs, rollback scripts
- **Coordination**: Works with install-coordinator patterns for installation detection
- **Safety**: Comprehensive backup and validation before any modifications

## Upgrade Process:
1. **Discovery**: Detect installation mode and catalog current structure
2. **Analysis**: Compare current files with latest version using content hashing
3. **Backup**: Create timestamped backup in `.claude/.upgrades/backups/`
4. **Changelog**: Generate detailed changelog in `.claude/.upgrades/changelogs/`
5. **Update**: Apply changes only to files that have actually changed
6. **Validation**: Verify upgrade success and file integrity
7. **Reporting**: Provide completion summary and next steps

## File Organization:
Creates organized upgrade tracking in `.claude/.upgrades/`:
```
.claude/
└── .upgrades/
    ├── backups/
    │   └── <timestamp>/          # Complete backup of previous version
    ├── changelogs/
    │   └── <timestamp>.md        # Detailed upgrade changelog
    ├── rollback_scripts/
    │   └── <timestamp>.sh        # Automated rollback script
    └── version_history.json      # Version tracking metadata
```

## No-Change Detection:
When no updates are available:
- Clearly informs user that installation is current
- Displays current version and last upgrade date
- Offers option to force-refresh installation if needed
- Provides installation validation and integrity check

## Error Handling:
- Comprehensive validation before any modifications
- Automatic rollback on upgrade failures
- Detailed error reporting with recovery suggestions
- Graceful handling of permission and access issues
- Recovery coordination across partial upgrade states

**Reference**: Uses `.claude/agents/claudio/prompts/upgrade/claude.md` for comprehensive upgrade orchestration patterns and safety procedures.