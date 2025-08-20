---
description: "Upgrade existing Claudio installations with parallel coordination and project path support"
argument-hint: "[<path>]"
allowed-tools: Bash(mkdir:*), Bash(ls:*), Bash(find:*), Bash(test:*), Bash(pwd:*)
system: claudio-system
---

I am an upgrade system that coordinates comprehensive Claudio system upgrades with project discovery, parallel execution, and localized component updates. My task is to:

1. Setup todo tracking for upgrade workflow
2. Invoke specialized agents directly using parallel Task calls with project_path arguments
3. Read and validate upgrade outputs from target directory
4. Create comprehensive upgrade report

## Implementation

I will use TodoWrite to track progress, then make direct Task calls:

**Sequential Foundation** (Dependencies require order):
- Task with subagent_type: "upgrade-discovery-analyzer" - pass the project_path argument for installation analysis
- Task with subagent_type: "upgrade-legacy-cleaner" - pass the project_path argument for deprecated pattern cleanup

**Parallel Analysis & Backup** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "upgrade-template-analyzer" - pass the project_path argument for diff analysis
- Task with subagent_type: "upgrade-backup-manager" - pass the project_path argument for backup creation

**Parallel Component Update** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "upgrade-component-localizer" - pass the project_path argument for component re-localization
- Task with subagent_type: "claude-md-generator" - pass the project_path argument for CLAUDE.md refresh

**Sequential Completion**:
- Task with subagent_type: "upgrade-installation-validator" - pass the project_path argument for final validation

Then read outputs from upgrade results, validate system completeness, and create comprehensive upgrade report.

This demonstrates the correct pattern: direct agent invocation with parallel execution and centralized validation and reporting.

## Upgrade Modes

**Full System Upgrade with Project Path Support:**
- `/claudio:upgrade` - Upgrade current directory (`./`) with complete parallel workflow
- `/claudio:upgrade /path/to/project` - Upgrade specific project path with complete parallel workflow
- `/claudio:upgrade ../relative/path` - Upgrade relative path with complete parallel workflow

## Upgrade Process

**Sequential Foundation** (Dependencies require order):
1. **Installation Analysis**: Analyze current installation and compatibility
2. **Legacy Cleanup**: Clean deprecated patterns while preserving user content

**Parallel Analysis & Backup** (Run multiple Task invocations in SINGLE message):
3. **Template Analysis**: Compare current vs latest templates and plan localization
4. **Backup Creation**: Create timestamped backups and rollback scripts

**Parallel Component Update** (Run multiple Task invocations in SINGLE message):
5. **Component Localization**: Apply project-specific template updates and test command coordination
6. **CLAUDE.md Refresh**: Update project integration documentation

**Sequential Completion**:
7. **Upgrade Validation**: Verify complete functional system integrity

## Upgrade Creates

**Project Path Target Updates:**
- `{project_path}/.claude/` directory with updated commands, agents, and extended context
- `{project_path}/.claudio/.upgrades/` directory with backups and changelogs
- `{project_path}/CLAUDE.md` refreshed with latest integration guidance
- Project-specific re-localization based on current discovery analysis

**Path Resolution:**
- **No parameter**: Upgrade current directory (`./`)
- **With path**: Upgrade specified directory (supports `./`, `../path`, `/full/path`)
- **All operations**: Relative to provided project_path argument

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
4. **Backup**: Create timestamped backup in `.claudio/.upgrades/backups/`
5. **Re-localization**: Generate new project-specific components based on discovery
6. **Integration**: Merge updates while preserving existing project contexts
7. **Validation**: Verify upgrade success and project-specific functionality
8. **Reporting**: Provide completion summary with localization details

## File Organization:
Creates organized upgrade tracking in `.claudio/.upgrades/`:
```
.claudio/
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

**Reference**: Uses `.claude/agents/claudio/extended_context/infrastructure/upgrade/overview.md` for comprehensive upgrade orchestration patterns and safety procedures.