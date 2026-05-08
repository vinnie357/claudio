#!/bin/bash
# claudio-ci-test.sh - Comprehensive Claudio workflow testing

set -e  # Exit on any error

echo "🚀 Starting Claudio CI Test Suite"
echo "=================================="

# Prerequisites Check
echo "🔍 Checking prerequisites..."

# Check if Claude CLI is installed
if ! command -v claude &> /dev/null; then
    echo "❌ Claude CLI is not installed. Please install it first:"
    echo "   npm install -g @anthropic-ai/claude-cli"
    echo "   or visit: https://github.com/anthropics/claude-cli"
    exit 1
fi

echo "✅ Claude CLI found: $(claude --version)"

# Check authentication
echo "🔐 Verifying authentication..."
if [ -z "$ANTHROPIC_API_KEY" ] && [ ! -f "$HOME/.config/claude/config.json" ]; then
    echo "❌ No authentication found. Please either:"
    echo "   1. Set ANTHROPIC_API_KEY environment variable, or"
    echo "   2. Run 'claude auth' to authenticate interactively"
    echo ""
    echo "   For GitHub Actions, add ANTHROPIC_API_KEY as a secret"
    exit 1
fi

# Test authentication with a simple command
if ! claude -p "Hello" --timeout 10 &> /dev/null; then
    echo "❌ Authentication test failed. Please check your API key or run 'claude auth'"
    exit 1
fi

echo "✅ Authentication verified"
echo "=================================="

# Test 1: Commands-Only Installation
echo "📦 Test 1: Commands-Only Installation"
cd test/install-commands
claude -p "/claudio:install commands" --dangerously-skip-permissions --allow-dangerously-skip-permissions
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
claude -p "/claudio:discovery" --dangerously-skip-permissions --allow-dangerously-skip-permissions
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
claude -p "/claudio:discovery" --dangerously-skip-permissions --allow-dangerously-skip-permissions
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
claude -p "/claudio:upgrade" --dangerously-skip-permissions --allow-dangerously-skip-permissions
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
claude -p "/claudio:install" --dangerously-skip-permissions --allow-dangerously-skip-permissions
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