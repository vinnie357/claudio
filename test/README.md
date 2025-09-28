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

# Test 1: Commands-Only Installation (System Testing Agent)
echo "📦 Test 1: Commands-Only Installation (Agent-Tested)"
claude -p "Use the claudio:claudio-install-commands-test subagent to execute and validate the complete /claudio:install commands test/install-commands workflow" --dangerously-skip-permissions
if [ $? -eq 0 ]; then
    echo "✅ Commands-only installation testing successful"
else
    echo "❌ Commands-only installation testing failed"
    exit 1
fi

# Test 2: System Upgrade (System Testing Agent)
echo "⬆️  Test 2: System Upgrade (Agent-Tested)"
claude -p "Use the claudio:claudio-upgrade-test subagent to execute and validate the complete /claudio:upgrade test/upgrade workflow" --dangerously-skip-permissions
if [ $? -eq 0 ]; then
    echo "✅ System upgrade testing successful"
else
    echo "❌ System upgrade testing failed"
    exit 1
fi

# Test 3: Full System Installation (System Testing Agent)
echo "🏗️  Test 3: Full System Installation (Agent-Tested)"
claude -p "Use the claudio:claudio-install-test subagent to execute and validate the complete /claudio:install test/install workflow" --dangerously-skip-permissions
if [ $? -eq 0 ]; then
    echo "✅ Full system installation testing successful"
else
    echo "❌ Full system installation testing failed"
    exit 1
fi

# Test 4: Simple Discovery (README-only project)
echo "🔍 Test 4: Simple Discovery Analysis"
cd test/discovery-readme
claude -p "/claudio:discovery" --dangerously-skip-permissions
if [ -f "discovery/reports/fittracker_discovery.md" ]; then
    echo "✅ Simple discovery analysis successful"
else
    echo "❌ Simple discovery analysis failed"
    exit 1
fi
cd ../..

# Test 5: Complex Discovery (Code project)
echo "🔍 Test 5: Complex Discovery Analysis"
cd test/discovery-code
claude -p "/claudio:discovery" --dangerously-skip-permissions
if [ -f "discovery/reports/weather_api_discovery.md" ]; then
    echo "✅ Complex discovery analysis successful"
else
    echo "❌ Complex discovery analysis failed"
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
# Test commands-only installation (using system testing agent)
claude -p "Use the claudio:claudio-install-commands-test subagent to execute and validate the complete /claudio:install commands test/install-commands workflow" --dangerously-skip-permissions

# Test system upgrade workflow (using system testing agent) 
claude -p "Use the claudio:claudio-upgrade-test subagent to execute and validate the complete /claudio:upgrade test/upgrade workflow" --dangerously-skip-permissions

# Test full system installation (using system testing agent)
claude -p "Use the claudio:claudio-install-test subagent to execute and validate the complete /claudio:install test/install workflow" --dangerously-skip-permissions

# Test simple discovery
cd test/discovery-readme && claude -p "/claudio:discovery" --dangerously-skip-permissions

# Test complex discovery with code analysis
cd test/discovery-code && claude -p "/claudio:discovery" --dangerously-skip-permissions
```

### Validation Checks

Each test type validates specific outputs using dedicated system testing agents:

#### **System Testing Agent Validation** (Tests 1-3)
1. **Commands-Only Installation** (`claudio-install-commands-test`): 
   - Validates DevOps automation platform discovery and localization
   - Confirms `.claude/commands/` and `.claude/agents/` directories with 40+ components
   - Verifies NO `.claudio/` workflow documents (commands-only mode)
   - Tests parallel Task tool execution patterns

2. **System Upgrade** (`claudio-upgrade-test`):
   - Validates TaskFlow productivity app legacy cleanup and modernization
   - Confirms backup creation with rollback scripts and upgrade changelog
   - Verifies 6-subagent parallel coordination (discovery → cleanup → analysis+backup → localization+validation)
   - Tests performance improvements through parallel batch execution

3. **Full Installation** (`claudio-install-test`):
   - Validates ShopFlow e-commerce platform complete workflow orchestration
   - Confirms `.claude/` and `.claudio/` directories with full workflow documents
   - Verifies discovery → PRD → planning → task breakdown → installation
   - Tests comprehensive parallel coordination patterns

#### **Direct Command Validation** (Tests 4-5)
4. **Discovery Tests**: Check for discovery reports in `discovery/reports/`
5. **Complex Discovery**: Validate code analysis and technology stack identification

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

## Agent Orchestration Patterns

### Successful Task Tool Execution Patterns

**All Claudio orchestration agents MUST use proper Task tool invocation patterns for reliable parallel execution:**

#### ✅ **CORRECT Pattern (Executable)**
```markdown
Use Task tool with subagent_type: "agent-name" to [detailed task description with context]
```

#### ❌ **INCORRECT Pattern (Documentation-Style)**
```markdown
Use the claudio:agent-name subagent to [task description]
```

### Critical Parallel Execution Requirements

**For coordinator/orchestrator agents that manage multiple subagents:**

#### **Parallel Batch Execution Pattern**
```markdown
**CRITICAL**: Run multiple Task invocations in SINGLE message for optimal performance:

Use Task tool with subagent_type: "first-agent" to [task details]

Use Task tool with subagent_type: "second-agent" to [task details]  

Use Task tool with subagent_type: "third-agent" to [task details]
```

### Performance Benefits
- **3.2-3.4x performance improvement** over sequential execution
- **Resource optimization** through concurrent operations
- **Better user experience** with reduced waiting time
- **Error isolation** - individual failures don't block other operations

### Validation Criteria for Orchestration Agents
1. **Zero documentation-style patterns**: No `Use the claudio:agent-name subagent` instances
2. **Proper Task tool invocations**: All subagent coordination uses `Use Task tool with subagent_type`
3. **Parallel execution guidance**: Clear "Run multiple Task invocations in SINGLE message" instructions
4. **Error handling**: Graceful failure management across parallel operations

### Successfully Fixed Patterns
- ✅ **install-coordinator-agent**: Fixed 11 documentation patterns → 8 executable Task tool patterns
- ✅ **upgrade-orchestrator-agent**: Already using proper Task tool patterns (reference implementation)
- ✅ **All other coordinator agents**: Verified clean (no violations)

## Test Suite Architecture

### Test Type Distinctions

**Three distinct test workflows validate different orchestration patterns:**

#### 1. **Full Install Test** (`claudio_install_test.md`)
- **Command**: `/claudio:install test/install`
- **Orchestration**: Discovery → PRD → Planning → Tasks → Installation
- **Agent**: `claudio-install-test` 
- **Target**: `test/install/` (ShopFlow e-commerce platform)
- **Validates**: Complete workflow orchestration with parallel coordination

#### 2. **Commands Install Test** (`claudio_install_commands_test.md`)  
- **Command**: `/claudio:install commands test/install-commands`
- **Orchestration**: Discovery → Installation (no PRD/planning)
- **Agent**: `claudio-install-commands-test`
- **Target**: `test/install-commands/` (DevOps automation suite)
- **Validates**: Minimal workflow orchestration with commands-only installation

#### 3. **Upgrade Test** (`claudio_upgrade_test.md`)
- **Command**: `/claudio:upgrade test/upgrade`
- **Orchestration**: 6-subagent parallel coordination (discovery → legacy cleanup → template analysis + backup → localization + validation)
- **Agent**: `claudio-upgrade-test`
- **Target**: `test/upgrade/` (legacy Claudio installation)
- **Validates**: Complex parallel batch execution with safety features

## Important Notes

- **Generated Content**: All projects are artificially created test scenarios, not real applications
- **No External Dependencies**: Tests should run without requiring external API keys or services
- **Deterministic**: Test results should be consistent across different environments
- **Clean State**: Each test starts with a known, clean project state
- **Comprehensive Coverage**: Tests cover all major Claudio commands and workflows
- **Pattern Validation**: All tests verify proper Task tool execution patterns

This test suite ensures that all Claudio functionality works correctly across different project types and provides confidence in system reliability, feature completeness, and orchestration pattern compliance.