---
description: "Run Phoenix LiveView test suite with intelligent ExUnit analysis and optional fixes"
argument-hint: "[test_pattern] [--fix]"
---

Run the TaskApp Phoenix LiveView test suite using ExUnit with intelligent summary and analysis.

**Test Framework**: ExUnit with Phoenix LiveView Test (ExUnit 1.14+)
**Test Runner**: `mix test`
**Coverage**: ExCoveralls with HTML reports
**Load Testing**: Concurrent process simulation with performance metrics
**Property Testing**: StreamData for edge case discovery

**Usage:**
- `/test` - Run all tests with comprehensive summary and performance metrics
- `/test [pattern]` - Run specific test pattern (file path or test name)
- `/test --load` - Run load tests with performance validation
- `/test --coverage` - Run tests with detailed coverage analysis
- `/test --watch` - Run tests in watch mode for development
- `/test --fix` - Run tests and create fix plan for failures

**Phoenix LiveView Specific Features:**
- **LiveView Testing**: Interactive component testing with real WebSocket connections
- **Concurrent Load Testing**: GenServer state management under high concurrency
- **Property-Based Testing**: StreamData integration for robust validation testing
- **Memory Stability Testing**: Long-running process memory leak detection
- **Real-time UI Testing**: LiveView event handling and state synchronization
- **API + LiveView Integration**: Hybrid REST/LiveView architecture testing

**Test Categories:**
- **Unit Tests**: Domain logic and pure functions (async: true)
- **Integration Tests**: GenServer state management and concurrency
- **LiveView Tests**: UI interactions, events, and real-time updates
- **Load Tests**: High-concurrency performance validation (@load_test tag)
- **Property Tests**: Edge case discovery with StreamData
- **API Tests**: REST endpoint validation with Phoenix.ConnTest

Use Task tool with subagent_type: "task-app-test-runner" to execute tests and analyze results.