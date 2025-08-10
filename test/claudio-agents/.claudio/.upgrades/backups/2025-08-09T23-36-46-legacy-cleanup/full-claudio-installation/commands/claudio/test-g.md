---
description: "Run Phoenix LiveView tests with Gemini AI analysis and task generation"
argument-hint: "[test_pattern] [--fix]"
---

**REQUIRES: gemini-cli and Gemini API access**

Run TaskApp Phoenix LiveView test suite with Gemini AI analysis for comprehensive issue identification and task generation.

**Gemini Integration**: Read-only analysis mode with explicit task generation for Phoenix LiveView patterns
**Test Framework**: ExUnit with Phoenix LiveView Test and concurrent process testing
**Enhanced Analysis**: AI-powered failure analysis with Elixir/OTP and Phoenix LiveView expertise

**Phoenix LiveView AI Analysis Features:**
- **LiveView Pattern Analysis**: Gemini AI evaluation of LiveView component architecture and event handling
- **Concurrency Issue Detection**: AI-powered analysis of GenServer race conditions and process bottlenecks
- **Performance Optimization**: Intelligent suggestions for Phoenix LiveView performance improvements
- **Property Test Enhancement**: AI-generated property test cases using StreamData patterns
- **Load Test Analysis**: Gemini AI interpretation of performance metrics and bottleneck identification
- **Real-time Architecture Review**: AI analysis of WebSocket communication patterns and state management

**Usage:**
- `/test-g` - Run full test suite with Gemini AI comprehensive analysis
- `/test-g [pattern]` - AI analysis of specific test pattern with targeted recommendations
- `/test-g --load` - Run load tests with AI-powered performance analysis and optimization suggestions
- `/test-g --fix` - Generate AI-powered fix tasks and attempt implementation with Phoenix LiveView best practices

**Specialized Analysis:**
- **Elixir/OTP Patterns**: GenServer supervision trees, fault tolerance, and process communication
- **Phoenix LiveView Architecture**: Component lifecycle, mount/update patterns, and real-time state management  
- **Test Strategy Optimization**: ExUnit async patterns, test data factories with ExMachina, and concurrent testing
- **Performance Bottlenecks**: Memory usage analysis, process spawning patterns, and WebSocket optimization

Use Task tool with subagent_type: "task-app-test-gemini" for Gemini AI-powered test analysis and solution generation.