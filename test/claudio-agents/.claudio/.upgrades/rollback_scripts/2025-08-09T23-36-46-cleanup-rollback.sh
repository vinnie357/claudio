#!/bin/bash
# Claudio Phase 0 Legacy Cleanup Rollback Script
# Generated: 2025-08-09T23:36:46Z

set -e

BACKUP_DIR="/Users/vinnie/github/claudio/test/claudio-agents/.claudio/.upgrades/backups/2025-08-09T23-36-46-legacy-cleanup"
TARGET_DIR="/Users/vinnie/github/claudio/test/claudio-agents"

echo "🔄 Rolling back Claudio Phase 0 legacy cleanup..."
echo "📁 Backup location: $BACKUP_DIR"
echo "🎯 Target location: $TARGET_DIR"

# Verify backup exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "❌ ERROR: Backup directory not found: $BACKUP_DIR"
    exit 1
fi

echo "⚠️  This will restore the dual installation structure (.claude + .claudio)"
echo "⚠️  All consolidation changes will be lost"
read -p "Continue? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Rollback cancelled"
    exit 1
fi

# Remove current consolidated structure
echo "🗑️  Removing current .claude directory..."
rm -rf "$TARGET_DIR/.claude"

echo "🗑️  Removing consolidated Phoenix customizations from .claudio..."
rm -f "$TARGET_DIR/.claudio/agents/claudio/phoenix-liveview-executor.md"
rm -f "$TARGET_DIR/.claudio/commands/claudio/phoenix-liveview.md"
rm -rf "$TARGET_DIR/.claudio/agents/claudio/extended_context/liveview-development"
rm -f "$TARGET_DIR/.claudio/settings.local.json"

# Restore original structures
echo "📦 Restoring original .claude installation..."
cp -R "$BACKUP_DIR/full-claude-installation" "$TARGET_DIR/.claude"

echo "📦 Restoring original .claudio installation..."
rm -rf "$TARGET_DIR/.claudio"
cp -R "$BACKUP_DIR/full-claudio-installation" "$TARGET_DIR/.claudio"

echo "✅ Rollback completed successfully!"
echo "🔍 Verifying restored structure..."

if [ -d "$TARGET_DIR/.claude" ] && [ -d "$TARGET_DIR/.claudio" ]; then
    echo "✅ Dual installation structure restored"
    echo "📁 .claude directory: $(ls -1 "$TARGET_DIR/.claude" | wc -l) items"
    echo "📁 .claudio directory: $(ls -1 "$TARGET_DIR/.claudio" | wc -l) items"
else
    echo "❌ ERROR: Rollback verification failed"
    exit 1
fi

echo "🎉 Rollback completed successfully!"
echo "💡 The original dual installation structure has been restored"