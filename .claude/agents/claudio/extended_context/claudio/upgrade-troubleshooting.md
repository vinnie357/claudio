# Upgrade Troubleshooting Guide

Comprehensive error recovery and diagnostic procedures for Claudio upgrade operations.

## Common Upgrade Failure Patterns

### Discovery Integration Failures

**Symptom**: Upgrade fails during project discovery phase
```
ERROR: Discovery process failed - unable to analyze project structure
```

**Diagnosis**:
- Check project accessibility and permissions
- Verify .git repository status if present
- Ensure sufficient disk space for analysis

**Resolution**:
```bash
# Force discovery refresh
/claudio:upgrade --force-discovery

# Alternative: Manual discovery first
/claudio:discovery . --force
# Then retry upgrade
/claudio:upgrade
```

### Localization Conflicts

**Symptom**: Template conflicts with existing customizations
```
ERROR: Cannot merge template changes with user modifications
```

**Diagnosis**:
- Review conflict files in upgrade logs
- Check for manual edits in agent/command files
- Verify backup integrity

**Resolution**:
```bash
# Preserve existing contexts during upgrade
/claudio:upgrade --preserve-contexts

# Manual resolution option
# 1. Backup current customizations
# 2. Force upgrade with --force
# 3. Reapply customizations manually
```

### Permission and Access Issues

**Symptom**: Cannot write to installation directory
```
ERROR: Permission denied writing to .claude/agents/
```

**Diagnosis**:
- Check file system permissions
- Verify directory ownership
- Ensure no locked files from other processes

**Resolution**:
```bash
# Check permissions
ls -la .claude/

# Fix permissions if needed
chmod -R u+w .claude/

# Alternative: Specify different path
/claudio:upgrade --path /alternative/path
```

### Partial Upgrade Recovery

**Symptom**: Upgrade interrupted mid-process
```
WARNING: Incomplete upgrade detected in .claude/.upgrades/
```

**Diagnosis**:
- Check for incomplete backup in `.claude/.upgrades/backups/`
- Verify rollback script existence
- Review upgrade logs for failure point

**Resolution**:
```bash
# List available rollback points
/claudio:upgrade --list-versions

# Rollback to last known good state
/claudio:upgrade --rollback <timestamp>

# Clean retry after rollback
/claudio:upgrade --force
```

## Sub-Agent Coordination Failures

### Test Command Generation Issues

**Symptom**: Test command generation fails during upgrade
```
ERROR: Failed to coordinate with test-command-generator
```

**Diagnosis**:
- Check Task tool availability
- Verify test-command-generator agent existence
- Review project discovery outputs for test framework detection

**Resolution**:
```bash
# Skip test command generation temporarily
/claudio:upgrade --localize-only

# Manual test command generation after upgrade
/claudio:generate-test-commands
```

**Prevention**: Ensure test-command-generator agent is available before upgrade

### Task Tool Coordination Timeouts

**Symptom**: Long-running sub-agent operations timeout
```
ERROR: Task coordination timeout - test-command-generator exceeded 10 minutes
```

**Diagnosis**:
- Check system resources (memory, CPU)
- Review project size and complexity
- Verify no hanging processes

**Resolution**:
```bash
# Increase timeout tolerance with force mode
/claudio:upgrade --force

# Alternative: Selective upgrade approach
/claudio:upgrade --commands
/claudio:upgrade --agents
/claudio:upgrade --prompts
```

## Backup and Rollback Issues

### Corrupted Backup Detection

**Symptom**: Backup validation fails
```
ERROR: Backup integrity check failed - SHA-256 mismatch
```

**Diagnosis**:
- Check disk space during backup creation
- Verify no concurrent file modifications
- Review backup creation logs

**Resolution**:
```bash
# Force new backup creation
/claudio:upgrade --force

# Manual backup verification
/claudio:upgrade --validate
```

### Rollback Script Execution Failures

**Symptom**: Automated rollback fails to execute
```
ERROR: Rollback script failed - permissions or file conflicts
```

**Diagnosis**:
- Check rollback script permissions
- Verify target files are not locked
- Review rollback script contents

**Resolution**:
```bash
# Manual rollback execution
chmod +x .claude/.upgrades/rollback_scripts/<timestamp>.sh
./.claude/.upgrades/rollback_scripts/<timestamp>.sh

# Verify rollback success
/claudio:upgrade --validate
```

## Extended Context Issues

### Missing Context Files

**Symptom**: Extended context files not found during upgrade
```
WARNING: Expected context file not found - graceful degradation active
```

**Diagnosis**:
- Check extended_context directory structure
- Verify context file paths in agent references
- Review installation completeness

**Resolution**:
```bash
# Force complete installation refresh
/claudio:upgrade --force

# Alternative: Manual context creation
# Research and create missing context using Task tool:
# Task tool with subagent_type: "research-specialist" to research infrastructure upgrade troubleshooting patterns
```

### Context Version Mismatches

**Symptom**: Extended context incompatible with current agent version
```
WARNING: Context version mismatch - some features may not work correctly
```

**Diagnosis**:
- Compare context modification dates
- Review context content structure
- Check for manual context edits

**Resolution**:
```bash
# Force context refresh
/claudio:upgrade --force

# Preserve custom contexts if needed
/claudio:upgrade --preserve-contexts
```

## Diagnostic Commands

### Installation Health Check
```bash
# Comprehensive installation validation
/claudio:upgrade --validate

# Installation status and version information
/claudio:upgrade --status

# Complete upgrade history
/claudio:upgrade --history
```

### File System Diagnostics
```bash
# Check disk space
df -h .

# Check permissions
ls -la .claude/

# Verify directory structure
find .claude -type d -name "extended_context"
```

### Process Diagnostics
```bash
# Check for hanging processes
ps aux | grep claudio

# Check system resources
top -l 1 | grep -E "(CPU|PhysMem)"
```

## Recovery Procedures

### Clean Installation Recovery

When all else fails, perform a clean installation with context preservation:

1. **Backup Current State**:
```bash
# Create manual backup
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)
```

2. **Clean Installation**:
```bash
# Remove current installation
rm -rf .claude

# Fresh installation with discovery
/claudio:install
```

3. **Context Recovery**:
```bash
# Selectively restore important contexts
cp -r .claude.backup.*/contexts/ .claude/contexts/ 2>/dev/null || true
```

### Emergency Rollback

For critical system recovery:

1. **Immediate Rollback**:
```bash
# Find most recent backup
ls -la .claude/.upgrades/backups/

# Execute rollback
/claudio:upgrade --rollback <most_recent_timestamp>
```

2. **Validation**:
```bash
# Verify system functionality
/claudio:upgrade --validate

# Test basic operations
/claudio:discovery . --check
```

## Prevention Best Practices

### Pre-Upgrade Validation
- Always run `/claudio:upgrade --check` before actual upgrade
- Ensure sufficient disk space (at least 2x current installation size)
- Verify no running Claudio processes in other terminals
- Check for pending git changes that might interfere

### Upgrade Preparation
- Create manual backup: `cp -r .claude .claude.manual.backup`
- Document any customizations for recovery reference
- Ensure stable network connection for any remote operations
- Schedule upgrades during low-activity periods

### Post-Upgrade Verification
- Run comprehensive validation: `/claudio:upgrade --validate`
- Test primary workflows: discovery, planning, task creation
- Verify custom contexts and configurations preserved
- Check upgrade history: `/claudio:upgrade --history`

## Error Code Reference

- **E001**: Discovery process failure
- **E002**: Permission/access denied  
- **E003**: Backup creation failure
- **E004**: Localization conflict
- **E005**: Sub-agent coordination timeout
- **E006**: Rollback execution failure
- **E007**: Extended context missing/corrupted
- **E008**: Partial upgrade state detected
- **E009**: Task tool coordination failure
- **E010**: Validation failure post-upgrade

Each error code includes specific diagnostic and recovery procedures in the upgrade logs located at `.claude/.upgrades/logs/`.