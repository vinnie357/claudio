#!/bin/bash
# claudio-ci-test.sh - Comprehensive Claudio workflow testing

set -e  # Exit on any error

echo "🚀 Starting Claudio CI Test Suite"
echo "=================================="

# Test 1: Commands-Only Installation
echo "📦 Test 1: Commands-Only Installation"
cd test/install-commands
claudio:install commands
if [ -d ".claude/commands" ] && [ -d ".claude/agents" ]; then
    echo "✅ Commands-only installation successful"
else
    echo "❌ Commands-only installation failed"
    exit 1
fi
cd ../..

# Test 2: Simple Discovery (README-only project)
echo "🔍 Test 2: Simple Discovery Analysis"
cd test/discovery-readme
claudio:discovery
if [ -f "discovery/reports/fittracker_discovery.md" ]; then
    echo "✅ Simple discovery analysis successful"
else
    echo "❌ Simple discovery analysis failed"
    exit 1
fi
cd ../..

# Test 3: Complex Discovery (Code project)
echo "🔍 Test 3: Complex Discovery Analysis"
cd test/discovery-code
claudio:discovery
if [ -f "discovery/reports/weather_api_discovery.md" ]; then
    echo "✅ Complex discovery analysis successful"
else
    echo "❌ Complex discovery analysis failed"
    exit 1
fi
cd ../..

# Test 4: System Upgrade
echo "⬆️  Test 4: System Upgrade"
cd test/upgrade
claudio:upgrade
if [ -f ".claude/upgrade_changelog_$(date +%Y%m%d).md" ]; then
    echo "✅ System upgrade successful"
else
    echo "❌ System upgrade failed"
    exit 1
fi
cd ../..

# Test 5: Full System Installation (Most comprehensive)
echo "🏗️  Test 5: Full System Installation"
cd test/install
claudio:install
if [ -f ".claudio/summary.md" ] && [ -f ".claudio/discovery.md" ] && [ -f ".claudio/prd.md" ]; then
    echo "✅ Full system installation successful"
else
    echo "❌ Full system installation failed"
    exit 1
fi
cd ../..

echo "=================================="
echo "🎉 All Claudio workflow tests passed!"
echo "=================================="