---
description: "Upgrade existing Claudio installations with changelog tracking and rollback support"
argument-hint: "[options]"
---

Upgrade existing Claudio installations with comprehensive change tracking, backup management, and rollback capabilities. This command safely updates Claudio components while preserving user customizations and providing complete version history.

Use the claudio:upgrade-orchestrator subagent to coordinate safe upgrade operations with detailed change analysis and backup management.

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
# Analyze and upgrade entire installation
/claudio:upgrade

# Specify custom installation path
/claudio:upgrade --path /custom/path
```
Performs comprehensive analysis and updates all changed components with complete backup and changelog generation.

### Check Mode (Dry Run)
```bash
# Show what would be upgraded without making changes
/claudio:upgrade --check

# Check specific installation location
/claudio:upgrade --check --path ~/.claude
```
Analyzes current installation against latest version and displays detailed upgrade preview without applying changes.

### Selective Updates
```bash
# Update only command files
/claudio:upgrade --commands

# Update only agent files  
/claudio:upgrade --agents

# Update only prompt contexts
/claudio:upgrade --prompts
```
Target specific component types for focused updates while maintaining dependencies and integration.

### Force Update
```bash
# Force complete refresh regardless of detected changes
/claudio:upgrade --force

# Force update with custom installation detection
/claudio:upgrade --force --path /custom/path
```
Override change detection and perform complete installation refresh, useful for corrupted installations.

## Version Management:

### Rollback Operations
```bash
# List all available versions/timestamps
/claudio:upgrade --list-versions

# Rollback to specific version
/claudio:upgrade --rollback 2025-08-02_14-30-15

# Show changelog for specific version
/claudio:upgrade --changelog 2025-08-02_14-30-15
```

### History and Tracking
```bash
# Display current installation version and status
/claudio:upgrade --status

# Show detailed upgrade history
/claudio:upgrade --history

# Validate current installation integrity
/claudio:upgrade --validate
```

## Parameters:
- `--check`: Preview upgrade changes without applying (dry run mode)
- `--commands`: Update command files only
- `--agents`: Update agent files only  
- `--prompts`: Update prompt contexts only
- `--force`: Force complete refresh regardless of detected changes
- `--path <path>`: Specify custom installation path
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