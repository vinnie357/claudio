# Upgrade Command

## Command
`/claudio:upgrade`

## Purpose
High-performance parallel upgrade system using 6 specialized subagents for improved performance while preserving Phoenix LiveView customizations.

## Usage
```
/claudio:upgrade [path] [--check] [--force]
```

## Arguments
- `path`: Project directory to upgrade (defaults to current directory)
- `--check`: Preview upgrade changes without applying
- `--force`: Force complete re-installation with full re-discovery

## Agent Reference
Uses `claudio:upgrade-orchestrator-agent subagent` to coordinate the parallel upgrade process

## Parallel Architecture
The upgrade system uses 6 specialized subagents with parallel execution for improved performance:
- **Discovery Analyzer**: Installation analysis and compatibility assessment
- **Legacy Cleaner**: Phase 0 deprecated pattern cleanup with user content protection
- **Template Analyzer**: Localization planning and conflict detection
- **Backup Manager**: Comprehensive backup creation and rollback script generation
- **Component Localizer**: Project-specific template application and test command coordination
- **Installation Validator**: Integrity verification and completion reporting

## Performance Optimization
- **Sequential Prerequisites**: Ensures correct data dependencies
- **Parallel Batch Processing**: 3-4x faster than sequential execution (Phase 2: template analysis + backup creation, Phase 3: localization + validation)
- **Complete Safety Guarantees**: Comprehensive backup and rollback capabilities

## Phoenix LiveView Preservation
- **Component Customizations**: Preserves TaskAppWeb.CoreComponents and custom styling
- **Mix Workflow**: Maintains existing aliases and development automation
- **Testing Patterns**: Respects ExUnit infrastructure and coverage requirements
- **Quality Standards**: Preserves Credo and Dialyxir configuration