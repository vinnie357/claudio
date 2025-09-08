# Test-G Command Template (Gemini Integration)

This template is used by test-command-generator to create project-specific `/claudio:test-g` commands with Gemini AI integration.

## Template Structure:

```markdown
---
description: "Run {PROJECT_TYPE} tests with Gemini AI analysis and task generation"
argument-hint: "[test_pattern] [--fix]"
---

**REQUIRES: gemini-cli and Gemini API access**

Run {PROJECT_NAME} test suite with Gemini AI analysis for comprehensive issue identification and task generation.

**Gemini Integration**: Read-only analysis mode with explicit task generation
**Test Framework**: {TEST_FRAMEWORK} ({VERSION})
**AI Analysis**: Enhanced failure analysis and solution suggestions
**Test Runner**: `{TEST_COMMAND}`

**Usage:**
- `/test-g` - Run tests with Gemini AI analysis
- `/test-g [pattern]` - AI analysis of specific test pattern (e.g., `/test-g auth`)
- `/test-g --fix` - Generate AI-powered fix tasks and attempt implementation

**Gemini Capabilities:**
- **Failure Analysis**: AI-powered test failure diagnosis
- **Solution Generation**: Specific fix recommendations  
- **Test Improvement**: Suggestions for better test coverage
- **Pattern Recognition**: Identify recurring issues and anti-patterns

**AI Context Provided to Gemini:**
- Project type: {PROJECT_TYPE}
- Test framework: {TEST_FRAMEWORK}
- Project structure and patterns
- Historical test patterns and common issues
- {FRAMEWORK_SPECIFIC_CONTEXT}

**Safety Features:**
- **Read-Only Mode**: Gemini cannot modify code directly
- **Task Generation Only**: Provides analysis and task lists only
- **Claude Integration**: All changes go through Claude sub-agent review
- **User Approval**: --fix flag requires confirmation before applying changes

Use Bash tool with direct gemini command for AI-powered test analysis:

```bash
gemini -y -p "You are a test analysis specialist analyzing a {PROJECT_TYPE} project using {TEST_FRAMEWORK}.

WORKFLOW:
1. Execute the test suite using: {TEST_COMMAND}
2. Analyze all test failures and output
3. Provide actionable analysis to Claude

PROJECT CONTEXT: {PROJECT_CONTEXT}
CURRENT TEST FAILURES: [Will be populated with actual test output]
USER REQUEST: $user_input

YOUR TASK: After running tests, provide a structured response for Claude to act on.

RESPONSE FORMAT (exactly as shown):
=== GEMINI TEST ANALYSIS ===

## Test Execution Summary
- Total Tests: [number]
- Passed: [number] 
- Failed: [number]
- Test Framework: {TEST_FRAMEWORK}

## Failure Analysis
[For each failure, provide:]
### [Test File/Suite Name]
**Error Type**: [Syntax Error|Assertion Failure|Timeout|Setup Issue|etc.]
**Root Cause**: [Specific technical reason]
**Impact Level**: [Critical|High|Medium|Low]
**Fix Priority**: [number 1-5]

## Action Plan for Claude
[Provide specific tasks in priority order:]

### Priority 1 Tasks
1. **[Specific task]**: [Detailed description of what Claude should do]
2. **[Specific task]**: [Detailed description of what Claude should do]

### Priority 2 Tasks
[Continue with lower priority items]

## Claude Implementation Notes
**Files to modify**: [List specific files]
**Commands to verify**: [Test commands to validate fixes]
**Potential risks**: [Any concerns about the fixes]

## Test Improvements Recommended
1. **Coverage gaps**: [Areas needing more tests]
2. **Test patterns**: [Better patterns to adopt]
3. **Framework optimization**: [Configuration improvements]

=== GEMINI WORK COMPLETE - CLAUDE CONTINUE ===

This marker indicates Gemini analysis is finished and Claude should proceed with implementing the recommended actions."
```

**Reference**: Uses `.claude/agents/claudio/extended_context/development/testing/claude.md` for project-specific testing context and Gemini integration patterns.

**Prerequisites Check:**
- gemini-cli installed and configured
- Gemini API access enabled
- Project discovery analysis completed
```

## Replacement Variables:

- `{PROJECT_TYPE}`: React, Node.js, Python, etc.
- `{PROJECT_NAME}`: Actual project name from discovery
- `{TEST_FRAMEWORK}`: Jest, pytest, RSpec, etc.
- `{VERSION}`: Framework version if detected
- `{TEST_COMMAND}`: npm test, pytest, etc.
- `{PROJECT_SLUG}`: Sanitized project name for agent naming
- `{FRAMEWORK_SPECIFIC_CONTEXT}`: Framework-specific AI context

## Framework-Specific Gemini Context:

### JavaScript/React
```markdown
**AI Context Provided to Gemini:**
- React component testing patterns and best practices
- Jest/React Testing Library integration nuances
- Common React testing anti-patterns and solutions
- Async testing strategies for hooks and effects
- Snapshot testing maintenance and updates
```

### Python
```markdown
**AI Context Provided to Gemini:**
- Pytest fixture patterns and dependency injection
- Python mock and patching best practices
- Async testing with asyncio and pytest-asyncio
- Parametrized testing optimization strategies
- Common Python testing pitfalls and solutions
```

### Node.js API
```markdown
**AI Context Provided to Gemini:**
- Express/API testing with Supertest patterns
- Database testing and transaction management
- Authentication and authorization testing strategies
- WebSocket and real-time testing approaches
- Integration testing with external services
```

## Enhanced Gemini Prompt Template:

The generated command will use this enhanced pattern for Gemini-Claude integration:

```bash
gemini -y -p "You are a test analysis specialist for a {PROJECT_TYPE} project using {TEST_FRAMEWORK}.

INTEGRATION PROTOCOL:
1. Run tests using: {TEST_COMMAND}
2. Analyze all failures and issues
3. Generate structured response for Claude to implement
4. End with GEMINI WORK COMPLETE marker

CONTEXT:
- Project: {PROJECT_NAME} ({PROJECT_TYPE})
- Test Framework: {TEST_FRAMEWORK}
- Request: {USER_INPUT}
- Use MCPs: {RELEVANT_MCPS}

OUTPUT REQUIREMENTS:
- Structured analysis with exact format shown in template
- Specific file paths and line numbers where possible
- Prioritized action items for Claude implementation
- Clear success criteria for each fix
- Must end with: '=== GEMINI WORK COMPLETE - CLAUDE CONTINUE ==='

CLAUDE HANDOFF:
After Gemini completes analysis, Claude will:
1. Parse the structured response
2. Implement Priority 1 tasks first
3. Validate fixes using recommended test commands
4. Report completion status to user

Execute tests now and provide structured analysis."
```

This template ensures generated test-g commands provide powerful AI-enhanced testing capabilities while maintaining safety and integration with the Claudio workflow system.