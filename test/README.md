# Claudio Test Suite

This directory contains example projects specifically generated to test the complete range of Claudio workflows and commands. These are **not live projects** but carefully crafted test scenarios that represent different project types, complexity levels, and technology stacks.

## Test Projects Overview

### 1. `install/` - Full System Installation Test
**Purpose**: Tests the complete `claudio:install` command that installs the entire Claudio system with full workflow capabilities.

**Project Type**: E-commerce platform (ShopFlow)
- **Technology Stack**: Node.js microservices, PostgreSQL, MongoDB, Redis, Kubernetes
- **Complexity**: High - Multiple services, complex architecture, scalability requirements
- **Test Command**: `cd test/install && claudio:install`
- **Expected Output**: Complete `.claudio/` folder with discovery, PRD, implementation plan, and task breakdown

### 2. `install-commands/` - Commands-Only Installation Test
**Purpose**: Tests the `claudio:install commands` workflow that only installs Claudio commands and agents without the full analysis workflow.

**Project Type**: DevOps automation suite
- **Technology Stack**: Python/FastAPI, Kubernetes, Terraform, CI/CD pipelines
- **Complexity**: High - Infrastructure automation, multi-cloud deployment
- **Test Command**: `cd test/install-commands && claudio:install commands`
- **Expected Output**: `.claudio/commands/` and `.claudio/agents/` directories only

### 3. `upgrade/` - System Upgrade Test
**Purpose**: Tests the `claudio:upgrade` command on a project with an existing (outdated) Claudio installation.

**Project Type**: TaskFlow productivity app
- **Technology Stack**: React Native, Node.js, AI/ML services, cross-platform sync
- **Complexity**: Medium-High - AI integration, real-time sync, mobile development
- **Pre-existing State**: Legacy `.claudio/` installation with v2.2.1 components
- **Test Command**: `cd test/upgrade && claudio:upgrade`
- **Expected Output**: Upgraded `.claudio/` system with changelog, backup, and modern components

### 4. `discovery-readme/` - Simple Discovery Test
**Purpose**: Tests the `claudio:discovery` command on a project with minimal structure (README-only).

**Project Type**: FitTracker mobile health app
- **Technology Stack**: Native iOS/Android, health platform integrations
- **Complexity**: Medium - Mobile-first, health data integration, cross-platform
- **Test Command**: `cd test/discovery-readme && claudio:discovery`
- **Expected Output**: Discovery report with technology analysis and recommendations

### 5. `discovery-code/` - Complex Discovery Test
**Purpose**: Tests the `claudio:discovery` command on a project with actual code structure and dependencies.

**Project Type**: WeatherAPI service
- **Technology Stack**: Elixir/Phoenix, PostgreSQL, Redis, real-time WebSockets
- **Complexity**: Medium-High - Functional programming, OTP supervision, real-time data
- **Test Command**: `cd test/discovery-code && claudio:discovery`
- **Expected Output**: Comprehensive discovery analysis including code structure, dependencies, and architecture evaluation

## Continuous Integration Test Script

### CI Requirements

**Prerequisites**:
1. **Claude CLI Installation**: The test script requires the Claude CLI to be installed
   - Install: `npm install -g @anthropic-ai/claude-cli`
   - Or visit: https://github.com/anthropics/claude-cli

2. **Authentication**: One of the following is required:
   - `ANTHROPIC_API_KEY` environment variable (recommended for CI)
   - Authenticated Claude CLI session (`claude auth`)

3. **Permissions Flag**: All CI tests use the `--dangerously-skip-permissions` flag to avoid permission checks that can interfere with automated testing environments.

**Command Format**: `claude -p "/claudio:command" --dangerously-skip-permissions`

### Automated Test Sequence

The following script should be executed in order during CI/CD pipeline testing to validate all Claudio workflows:

```bash
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
    exit 1
fi

echo "✅ Claude CLI found: $(claude --version)"

# Check authentication
echo "🔐 Verifying authentication..."
if [ -z "$ANTHROPIC_API_KEY" ] && [ ! -f "$HOME/.config/claude/config.json" ]; then
    echo "❌ No authentication found. Please set ANTHROPIC_API_KEY or run 'claude auth'"
    exit 1
fi

# Test authentication
if ! claude -p "Hello" --timeout 10 &> /dev/null; then
    echo "❌ Authentication test failed. Please check your API key"
    exit 1
fi

echo "✅ Authentication verified"
echo "=================================="

# Test 1: Commands-Only Installation
echo "📦 Test 1: Commands-Only Installation"
cd test/install-commands
claude -p "/claudio:install commands" --dangerously-skip-permissions
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
claude -p "/claudio:discovery" --dangerously-skip-permissions
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
claude -p "/claudio:discovery" --dangerously-skip-permissions
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
claude -p "/claudio:upgrade" --dangerously-skip-permissions
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
claude -p "/claudio:install" --dangerously-skip-permissions
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
```

### Individual Test Commands

For manual testing or debugging specific workflows:

```bash
# Test commands-only installation
cd test/install-commands && claude -p "/claudio:install commands" --dangerously-skip-permissions

# Test simple discovery
cd test/discovery-readme && claude -p "/claudio:discovery" --dangerously-skip-permissions

# Test complex discovery with code analysis
cd test/discovery-code && claude -p "/claudio:discovery" --dangerously-skip-permissions

# Test system upgrade workflow
cd test/upgrade && claude -p "/claudio:upgrade" --dangerously-skip-permissions

# Test full system installation
cd test/install && claude -p "/claudio:install" --dangerously-skip-permissions
```

### Validation Checks

Each test should validate specific outputs:

1. **Commands Installation**: Verify `.claude/commands/` and `.claude/agents/` directories exist
2. **Discovery Tests**: Check for discovery reports in `discovery/reports/` 
3. **Upgrade Test**: Confirm upgrade changelog and backup files are created
4. **Full Installation**: Validate complete `.claudio/` structure with all required files

## Test Project Characteristics

### Diversity Coverage
- **Languages**: JavaScript/Node.js, Python, Elixir, Swift/Kotlin
- **Architectures**: Microservices, monolithic, functional, OOP
- **Domains**: E-commerce, DevOps, productivity, health, weather services
- **Complexity Levels**: Simple (README-only) to complex (multi-service systems)

### Technology Stack Coverage
- **Databases**: PostgreSQL, MongoDB, Redis, TimescaleDB
- **Frameworks**: Phoenix, Express.js, FastAPI, React Native
- **Infrastructure**: Kubernetes, Docker, Terraform, AWS/Azure/GCP
- **Patterns**: Event-driven, real-time, AI/ML integration, mobile-first

### Testing Scenarios
- **Fresh Installation**: Clean projects without existing Claudio setup
- **Legacy Upgrade**: Projects with outdated Claudio installations
- **Minimal Projects**: README-only projects for basic analysis
- **Complex Projects**: Multi-file projects with dependencies and configuration
- **Different Installation Modes**: Full system vs. commands-only installation

## Usage in Development

### Local Testing
```bash
# Run individual test
./test/claudio-ci-test.sh

# Test specific workflow (with permissions flag for CI compatibility)
cd test/discovery-code && claude -p "/claudio:discovery" --dangerously-skip-permissions
```

### CI/CD Integration

#### GitHub Actions Setup

```yaml
name: Claudio Workflow Tests

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test-claudio:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '18'
        
    - name: Install Claude CLI
      run: npm install -g @anthropic-ai/claude-cli
      
    - name: Test Claudio Workflows
      env:
        ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
      run: |
        chmod +x test/claudio-ci-test.sh
        ./test/claudio-ci-test.sh
```

#### Required GitHub Secrets

To run the tests in GitHub Actions, add the following secret to your repository:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Name: `ANTHROPIC_API_KEY`
4. Value: Your Anthropic API key from https://console.anthropic.com/

#### Local Testing with Environment Variables

```bash
# Set your API key (replace with your actual key)
export ANTHROPIC_API_KEY="sk-ant-..."

# Run the test suite
./test/claudio-ci-test.sh
```

### Debugging Failed Tests
1. Check command output for specific error messages
2. Verify expected output files are created in correct locations
3. Examine `.claudio/` structure matches expected patterns
4. Review discovery reports for completeness and accuracy

## Important Notes

- **Generated Content**: All projects are artificially created test scenarios, not real applications
- **No External Dependencies**: Tests should run without requiring external API keys or services
- **Deterministic**: Test results should be consistent across different environments
- **Clean State**: Each test starts with a known, clean project state
- **Comprehensive Coverage**: Tests cover all major Claudio commands and workflows

This test suite ensures that all Claudio functionality works correctly across different project types and provides confidence in system reliability and feature completeness.