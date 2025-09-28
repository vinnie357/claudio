# Claudio Generate Test Commands Test

This file contains validation prompts to test the `/claudio:generate-test-commands` command orchestration workflow in a new Claude Code session.

## Purpose

Validate that:
1. **Test Command Generation**: The test-command-generator agent properly analyzes project discovery and generates project-specific test commands
2. **Discovery Analysis Integration**: Project discovery analysis drives the generation of localized test commands tailored to project's testing framework
3. **Framework Detection**: Automatic detection of Elixir/Phoenix testing patterns and mix test integration
4. **Command Localization**: Generated `/claudio:test` and `/claudio:test-g` commands are customized for the target project
5. **Sub-agent Creation**: Test execution sub-agents are generated with project-specific testing knowledge
6. **Extended Context Generation**: Testing-related extended context is created based on project's testing patterns

## Sample Application

The validation tests use the WeatherAPI service located in `test/generate-test-commands/`. This application provides:

- **Technology Stack**: Elixir Phoenix Framework, OTP supervision trees, GenServer processes
- **Testing Framework**: ExUnit with comprehensive test coverage, property-based testing, load testing
- **Architecture**: High-performance weather API with real-time updates, WebSocket connections, caching layers
- **Features**: Complete weather data service with multiple provider integrations, climate analytics, RESTful and GraphQL APIs
- **Infrastructure**: Distributed Elixir systems with PostgreSQL, Redis, TimescaleDB for time-series data
- **Development Priorities**: Performance optimization, fault tolerance, concurrent processing, and comprehensive testing

This realistic Elixir Phoenix weather API allows thorough testing of Claudio's test command generation capabilities across Elixir testing patterns, mix test integration, concurrent testing, and performance testing workflows.

## Validation Prompt

```
Please test the Claudio generate test commands workflow by performing the following validation:

### 1. Generate Test Commands Execution Test
Test the complete `/claudio:generate-test-commands` command using the system testing agent:

**Agent Invocation**: "Use the generate-test-commands-test subagent to execute and validate the complete /claudio:generate-test-commands test/generate-test-commands workflow, including command execution, test-command-generator orchestration, and project-specific test command generation validation"

**Expected Behavior**:
a) **Command Execution**: Execute `claude --dangerously-skip-permissions -p "/claudio:generate-test-commands test/generate-test-commands"` successfully
b) **Discovery Analysis Requirement**: Should validate that discovery.md exists in target project before proceeding
c) **Project Analysis**: Should analyze WeatherAPI Phoenix project structure and testing patterns
d) **Framework Detection**: Should detect Elixir/Phoenix testing framework (ExUnit, mix test)
e) **Test Command Generation**: Should generate `/claudio:test` and `/claudio:test-g` commands customized for Elixir testing
f) **Sub-agent Creation**: Should create project-test-runner and related testing sub-agents
g) **Extended Context Creation**: Should generate testing-related extended context for Elixir patterns

### 2. Test Command Generator Orchestration Test
Verify the test-command-generator properly manages the test command generation workflow:

The test-command-generator should orchestrate the complete workflow through its internal process. This test validates that the single agent invocation above properly manages:

#### Phase 1: Discovery Analysis and Validation (Sequential)
a) **Discovery Document Validation**: Verify that discovery.md exists in test/generate-test-commands/ before proceeding

b) **Project Testing Analysis**: Analysis of WeatherAPI Phoenix project to understand:
   - Testing framework (ExUnit) and patterns
   - Test structure (test/ directory, test_helper.exs)
   - Mix test configuration and dependencies
   - Load testing capabilities (test/load_tests/)
   - Test coverage and quality requirements

#### Phase 2: Test Command Generation (Sequential)
c) **Framework-Specific Command Generation**: Generate `/claudio:test` command with:
   - Elixir/Phoenix-specific testing patterns
   - Mix test integration and intelligent summary
   - Optional --fix flag for test failures
   - Integration with ExUnit test runner

d) **Gemini Integration Command Generation**: Generate `/claudio:test-g` command with:
   - Read-only analysis capabilities
   - Task generation based on test results
   - Integration with gemini-cli for enhanced analysis
   - Elixir-specific test interpretation

#### Phase 3: Sub-agent and Context Generation (Parallel)
e) **Project Test Runner Creation**: Generate project-test-runner sub-agent with:
   - Elixir testing framework knowledge
   - Mix test command execution
   - Test result parsing and analysis
   - Fix capability integration

f) **Extended Context Generation**: Create testing-related extended context including:
   - Elixir testing best practices
   - ExUnit patterns and conventions
   - Phoenix testing strategies
   - Performance and load testing patterns

### 3. Generated Command Validation
After generation completion, verify the following commands are created in `test/generate-test-commands/`:

#### Required Generated Commands
- `test/generate-test-commands/.claude/commands/claudio/test.md` - Project-specific test execution command
- `test/generate-test-commands/.claude/commands/claudio/test-g.md` - Gemini-integrated testing command

#### Required Generated Sub-agents
- `test/generate-test-commands/.claude/agents/claudio/project-test-runner.md` - Project-specific test execution agent
- Any additional testing-related sub-agents based on project complexity

#### Required Extended Context
- `test/generate-test-commands/.claude/agents/claudio/extended_context/testing/` - Testing patterns and framework knowledge
- Context files should include Elixir/Phoenix-specific testing guidance

### 4. Command Content Validation
Verify that generated commands are properly customized for the WeatherAPI Phoenix project:

a) **Test Command Content (`test.md`)**:
   - Should reference mix test as primary test runner
   - Should include Elixir-specific test patterns
   - Should understand ExUnit test structure
   - Should include project-specific test directories (test/load_tests/, test/support/)
   - Should integrate with Phoenix testing utilities

b) **Test-G Command Content (`test-g.md`)**:
   - Should include gemini-cli integration
   - Should reference Elixir testing context
   - Should include read-only analysis capabilities
   - Should generate tasks based on Elixir testing patterns

c) **Project Test Runner Agent**:
   - Should include mix test execution logic
   - Should understand ExUnit test output parsing
   - Should include Elixir-specific error interpretation
   - Should integrate with Phoenix testing utilities

### 5. Framework Integration Testing
Test that generated commands properly integrate with Elixir testing framework:

a) **Mix Test Integration**:
   - Verify generated commands can execute mix test successfully
   - Test that test output is properly parsed and summarized
   - Ensure integration with ExUnit test runner

b) **Project Structure Understanding**:
   - Verify commands understand test/ directory structure
   - Test recognition of test_helper.exs configuration
   - Ensure proper handling of test/support/ utilities

c) **Elixir-Specific Features**:
   - Test integration with ExUnit.Case patterns
   - Verify understanding of Phoenix.ConnTest for web testing
   - Ensure proper handling of async test execution

### 6. Extended Context Validation
Verify that generated extended context is appropriate for Elixir testing:

a) **Testing Patterns Context**:
   - Should include ExUnit best practices
   - Should cover Phoenix testing strategies
   - Should include async testing patterns
   - Should reference Elixir testing libraries

b) **Framework-Specific Guidance**:
   - Should include mix test command variations
   - Should cover test coverage analysis (mix test --cover)
   - Should include property-based testing with StreamData
   - Should reference performance testing patterns

### 7. Installation Location Validation
Verify that generated commands are installed in correct locations:

a) **Command Installation**:
   - Commands should be in `test/generate-test-commands/.claude/commands/claudio/`
   - Should NOT be in main Claudio system directory
   - Should be project-specific, not generic templates

b) **Sub-agent Installation**:
   - Sub-agents should be in `test/generate-test-commands/.claude/agents/claudio/`
   - Should include project-specific testing knowledge
   - Should reference correct extended context locations

c) **Extended Context Installation**:
   - Context should be in `test/generate-test-commands/.claude/agents/claudio/extended_context/`
   - Should include testing-specific categories
   - Should contain Elixir/Phoenix testing guidance

## Expected Results

### ✅ **Success Criteria**:

#### Test Command Generation
- Test-command-generator successfully analyzes WeatherAPI Phoenix project
- Discovery analysis properly drives test command customization
- Generated commands are framework-specific for Elixir/Phoenix
- Sub-agents include project testing knowledge
- Extended context reflects Elixir testing patterns

#### Framework Detection and Integration
- Properly detects ExUnit testing framework
- Recognizes mix test as primary test runner
- Understands Phoenix testing utilities and patterns
- Integrates with existing test structure (test/, test_helper.exs)
- Recognizes load testing capabilities and patterns

#### Generated Command Quality
- `/claudio:test` command includes mix test integration
- `/claudio:test-g` command includes gemini-cli integration
- Project-test-runner agent understands ExUnit output
- Commands reference project-specific test directories
- All generated content is Elixir/Phoenix-specific

#### Installation and Localization
- Commands installed in correct project locations
- Sub-agents include project-specific testing guidance
- Extended context contains relevant Elixir testing knowledge
- All components work together as integrated testing system
- Generated system excludes generic testing patterns

### ❌ **Failure Indicators**:

#### Generation Failures
- Test-command-generator fails to analyze project discovery
- Commands generated with generic testing patterns instead of Elixir-specific
- Missing integration with mix test framework
- Sub-agents lack project testing knowledge
- Extended context contains generic instead of Elixir-specific guidance

#### Framework Detection Issues
- Fails to detect ExUnit testing framework
- Uses generic test runners instead of mix test
- Missing Phoenix testing utility integration
- Incorrect test structure understanding
- Generic testing patterns instead of Elixir-specific

#### Installation Problems
- Commands installed in wrong locations
- Sub-agents missing project-specific knowledge
- Extended context lacks Elixir testing guidance
- Integration between components broken
- Generated system doesn't function as cohesive testing solution

## Troubleshooting Guide

### If Generate Test Commands Fails:
1. Check that test/generate-test-commands/ directory exists and contains WeatherAPI project
2. Verify discovery.md exists in target project (required for command generation)
3. Ensure test-command-generator agent exists and is properly configured
4. Check command syntax: `claude --dangerously-skip-permissions -p "/claudio:generate-test-commands test/generate-test-commands"`

### If Discovery Analysis Fails:
1. Verify test/generate-test-commands/README.md exists with project description
2. Check that mix.exs contains project configuration
3. Ensure project structure is recognizable for discovery analysis
4. Confirm discovery analysis covers testing framework identification

### If Command Generation Fails:
1. Check test-command-generator agent exists and functions
2. Verify target project permissions allow file creation
3. Ensure all template files exist in source Claudio installation
4. Check that generation process completes without errors

### If Framework Detection Issues:
1. Verify mix.exs contains ExUnit test dependencies
2. Check that test/ directory structure is standard for Elixir projects
3. Ensure test_helper.exs exists and is properly configured
4. Confirm Phoenix dependencies are detected for web testing integration

## Post-Validation Actions

### Generate Test Report (Always)
**Generate test_report.md**: Create `test/generate-test-commands/test_report.md` with:
- Test execution status and timestamps
- Test command generation validation results
- Framework detection and integration validation details
- Generated command content quality assessment
- Sub-agent creation and extended context validation
- Installation location and localization verification
- Integration testing results and functionality verification
- Error details and failure analysis (if applicable)
- Critical issues identified and recommendations
- Overall test status (PASS/FAIL) with detailed breakdown

### If All Tests Pass:
- Document successful test command generation workflow completion
- Record framework detection accuracy for Elixir/Phoenix projects
- Validate generated testing system ready for project use
- Consider test command generation process verified and functional

### If Tests Fail:
- Identify specific failure points in command generation workflow
- Update test-command-generator patterns if needed
- Fix framework detection or command generation issues
- Retest specific failing components before complete revalidation

## Notes for Implementation

This validation should be run in a **new Claude Code session** after any changes to the test-command-generator agent or related test command generation components, as agents are only loaded at session start.

The test focuses on the **complete test command generation workflow** rather than individual component functionality, ensuring the entire test command system works as an integrated process for Elixir/Phoenix projects.
```

## Validation Execution

Run this validation by copying the validation prompt above into a new Claude Code session and executing the test command. Document results in the accompanying validation results file.