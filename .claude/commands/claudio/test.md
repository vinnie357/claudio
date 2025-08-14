---
description: "Execute project test suite with intelligent analysis and optional fixes"
argument-hint: "[test_pattern] [--fix]"
allowed-tools: Bash(test:*), Bash(mix:*), Bash(npm:*), Bash(pytest:*), Bash(go:*)
system: claudio-system
---

Execute the project's test suite using project-specific testing configuration with intelligent analysis and optional fix capabilities.

## Command Behavior

**Intelligent Test Execution:**
1. **Check for generated project-specific test command** in `.claudio/commands/claudio/test.md`
2. **If project command exists**: Use the localized, sophisticated test runner
3. **If no project command**: Use the project-test-runner subagent for direct framework detection and execution

## Usage Patterns

**Basic Execution:**
- `/claudio:test` - Run all tests with intelligent reporting
- `/claudio:test [pattern]` - Run specific test files or patterns
- `/claudio:test --fix` - Run tests and attempt to fix failures

**Framework Detection:**
- **Elixir/Phoenix**: `mix test` with ExUnit reporting
- **Node.js**: `npm test` or `yarn test` with framework detection
- **Python**: `pytest` or `python -m pytest` with coverage
- **Go**: `go test` with package analysis
- **Ruby**: `rspec` or `rake test` with Rails integration
- **Other**: Intelligent detection based on project structure

## Test Command Execution

Use the project-test-runner subagent to:

1. **Detect if project-specific test command exists**
2. **If exists**: Execute the generated project-specific test workflow
3. **If missing**: Perform direct test framework detection and execution
4. **Provide intelligent reporting** with test results analysis
5. **Handle --fix flag** for failure analysis and repair attempts

The subagent will provide project-localized test execution with comprehensive reporting and fix capabilities regardless of whether sophisticated test commands have been generated during installation.

**Project-Specific Features:**
- Uses existing generated test commands when available
- Falls back to framework detection for immediate testing
- Maintains --fix flag functionality for both modes
- Provides intelligent test result analysis and reporting