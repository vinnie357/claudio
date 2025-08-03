#!/bin/bash

# Claudio Installation Rollback Script
# Generated: August 3, 2025 08:47:08
# Target: /Users/vinnie/github/claudio/examples/web-app/.claudio
# Backup: 20250803_084708

set -e

CLAUDIO_DIR="/Users/vinnie/github/claudio/examples/web-app/.claudio"
BACKUP_DIR="$CLAUDIO_DIR/.upgrades/backups/20250803_084708"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "=== Claudio Installation Rollback ==="
echo "Timestamp: $TIMESTAMP"
echo "Backup Source: $BACKUP_DIR"
echo "Target: $CLAUDIO_DIR"
echo

# Verify backup exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "ERROR: Backup directory not found: $BACKUP_DIR"
    exit 1
fi

# Verify backup manifest
if [ ! -f "$BACKUP_DIR/backup_manifest.json" ]; then
    echo "ERROR: Backup manifest not found. Cannot verify backup integrity."
    exit 1
fi

echo "✅ Backup verification passed"

# Create rollback backup of current state
echo "📦 Creating rollback backup of current state..."
ROLLBACK_BACKUP_DIR="$CLAUDIO_DIR/.upgrades/backups/rollback_$TIMESTAMP"
mkdir -p "$ROLLBACK_BACKUP_DIR"

# Copy current state (excluding .upgrades to avoid recursion)
rsync -av --exclude='.upgrades' "$CLAUDIO_DIR/" "$ROLLBACK_BACKUP_DIR/"
echo "✅ Current state backed up to: $ROLLBACK_BACKUP_DIR"

# Remove added components
echo "🗑️  Removing components added during upgrade..."

# Remove commands directory (added during upgrade)
if [ -d "$CLAUDIO_DIR/commands" ]; then
    rm -rf "$CLAUDIO_DIR/commands"
    echo "   Removed: commands/"
fi

# Remove agents directory (added during upgrade)
if [ -d "$CLAUDIO_DIR/agents" ]; then
    rm -rf "$CLAUDIO_DIR/agents"
    echo "   Removed: agents/"
fi

# Remove settings file (added during upgrade)
if [ -f "$CLAUDIO_DIR/settings.local.json" ]; then
    rm "$CLAUDIO_DIR/settings.local.json"
    echo "   Removed: settings.local.json"
fi

echo "✅ Upgrade components removed"

# Restore original files from backup
echo "📁 Restoring original files from backup..."

# Restore discovery.md (was modified during upgrade)
if [ -f "$BACKUP_DIR/discovery.md" ]; then
    cp "$BACKUP_DIR/discovery.md" "$CLAUDIO_DIR/discovery.md"
    echo "   Restored: discovery.md"
fi

# Verify core files are intact (these should not have been modified)
CORE_FILES=("prd.md" "plan.md" "summary.md" "status.md")
for file in "${CORE_FILES[@]}"; do
    if [ -f "$CLAUDIO_DIR/$file" ] && [ -f "$BACKUP_DIR/$file" ]; then
        # Check if files are identical
        if ! cmp -s "$CLAUDIO_DIR/$file" "$BACKUP_DIR/$file"; then
            echo "⚠️  WARNING: $file differs from backup. Restoring from backup."
            cp "$BACKUP_DIR/$file" "$CLAUDIO_DIR/$file"
            echo "   Restored: $file"
        else
            echo "   Verified: $file (unchanged)"
        fi
    fi
done

echo "✅ File restoration completed"

# Verify phase directories are intact
PHASE_DIRS=("phase1" "phase2" "phase3" "shared" "design" "docs" "research")
for dir in "${PHASE_DIRS[@]}"; do
    if [ -d "$CLAUDIO_DIR/$dir" ]; then
        echo "   Verified: $dir/ (preserved)"
    else
        echo "⚠️  WARNING: $dir/ directory missing"
    fi
done

# Create rollback log
ROLLBACK_LOG="$CLAUDIO_DIR/.upgrades/changelogs/rollback_$TIMESTAMP.md"
cat > "$ROLLBACK_LOG" << EOF
# Claudio Installation Rollback Log
**Rollback Date**: $(date)  
**Original Upgrade**: 20250803_084708  
**Backup Source**: $BACKUP_DIR  
**Rollback Backup**: $ROLLBACK_BACKUP_DIR  

## Rollback Actions Completed
- ✅ Removed commands/ directory
- ✅ Removed agents/ directory  
- ✅ Removed settings.local.json
- ✅ Restored original discovery.md
- ✅ Verified core project files
- ✅ Verified phase directories

## Post-Rollback State
Installation reverted to workflow output mode:
- discovery.md (original June 18 version)
- prd.md (preserved)
- plan.md (preserved)
- summary.md (preserved)  
- status.md (preserved)
- All phase directories (preserved)
- All shared resources (preserved)

## Rollback Verification
Installation successfully rolled back to pre-upgrade state.
All original project context and planning preserved.
EOF

echo "✅ Rollback log created: $ROLLBACK_LOG"

# Final verification
echo
echo "=== Rollback Verification ==="
echo "Current .claudio directory contents:"
ls -la "$CLAUDIO_DIR"

echo
echo "✅ ROLLBACK COMPLETED SUCCESSFULLY"
echo
echo "Your Claudio installation has been restored to the pre-upgrade state."
echo "All original project context and planning has been preserved."
echo
echo "Rollback details logged to: $ROLLBACK_LOG"
echo "Your upgrade state was backed up to: $ROLLBACK_BACKUP_DIR"
echo
echo "You can re-run the upgrade at any time if needed."