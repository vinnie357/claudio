---
description: "Upgrade existing Claudio installations with changelog tracking and rollback support"
argument-hint: "[target_path] [options]"
---

Upgrade existing Claudio installations through intelligent project localization with comprehensive change tracking, backup management, and rollback capabilities. This command safely updates Claudio components by re-localizing them based on current project discovery while preserving user customizations and providing complete version history.

Use the claudio:upgrade-orchestrator subagent to coordinate safe upgrade operations with project discovery, localization, and backup management.

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
# Analyze and upgrade current directory installation with localization
/claudio:upgrade

# Upgrade specific project installation with localization
/claudio:upgrade /path/to/project

# Alternative flag syntax for custom path
/claudio:upgrade --path /custom/path
```
Performs comprehensive project discovery, re-localizes all components based on current codebase, and updates with complete backup and changelog generation.

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
# Update only command files with localization (current directory)
/claudio:upgrade --commands

# Update only agent files with localization in specific project
/claudio:upgrade /path/to/project --agents

# Update only prompt contexts with localization
/claudio:upgrade --prompts
```
Target specific component types for focused localized updates while maintaining dependencies and project-specific integration.

### Force Update
```bash
# Force complete refresh with re-discovery and re-localization
/claudio:upgrade --force

# Force update specific project with full re-localization
/claudio:upgrade /path/to/project --force

# Alternative flag syntax
/claudio:upgrade --force --path /custom/path
```
Override change detection, re-run project discovery, and perform complete localized installation refresh, useful for corrupted installations or significant project changes.

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
- `--commands`: Update command files only with localization
- `--agents`: Update agent files only with localization
- `--prompts`: Update prompt contexts only with localization
- `--force`: Force complete refresh with re-discovery and re-localization
- `--force-discovery`: Re-run project discovery even if current
- `--preserve-contexts`: Keep existing task/phase contexts during upgrade
- `--localize-only`: Only update localization without system upgrades
- `--path <path>`: Alternative syntax for specifying installation path
- `--rollback <timestamp>`: Rollback to specified version
- `--list-versions`: Show available versions for rollback
- `--changelog <timestamp>`: Display changelog for specific version
- `--status`: Show current installation status and version
- `--history`: Display complete upgrade history
- `--validate`: Validate current installation integrity

## Integration Points:
- **Input Sources**: Current `.claude/` installation structure, latest Claudio version templates, project discovery outputs
- **Output Targets**: Localized installation files, backup archives, changelogs, rollback scripts
- **Coordination**: Works with discovery, install-coordinator, and localization patterns
- **Safety**: Comprehensive backup and validation before any modifications
- **Discovery Integration**: Automatic project analysis and component customization

## Localized Upgrade Process:
1. **Discovery Analysis**: Run or validate project discovery to understand current codebase
2. **Installation Detection**: Detect installation mode and catalog current structure
3. **Localization Planning**: Compare current localized components with latest templates
4. **Backup**: Create timestamped backup in `.claude/.upgrades/backups/`
5. **Re-localization**: Generate new project-specific components based on discovery
6. **Integration**: Merge updates while preserving existing project contexts
7. **Validation**: Verify upgrade success and project-specific functionality
8. **Reporting**: Provide completion summary with localization details

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