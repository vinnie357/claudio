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

Use Task tool with subagent_type: "{PROJECT_SLUG}-test-gemini" for Gemini integration and AI-powered test analysis.

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

## Gemini Prompt Template:

The generated command will use this pattern for Gemini integration:

```bash
gemini -y -p "You are analyzing a {PROJECT_TYPE} project using {TEST_FRAMEWORK}. 
You are in READ-ONLY mode and can execute the test suite using `{TEST_COMMAND}`. 
Use {RELEVANT_MCPS} where applicable (Playwright for e2e, etc.). 

Project Context: {PROJECT_CONTEXT}
Test Failure Context: {FAILURE_CONTEXT}
User Request: {USER_INPUT}

You ONLY respond with prompts to the Claude sub-agent that called you. 
Provide:
1. Issue analysis with specific failure categorization
2. Task list for addressing identified problems  
3. Specific recommendations for test improvements

Do NOT provide code directly. Provide analysis and task descriptions ONLY."
```

This template ensures generated test-g commands provide powerful AI-enhanced testing capabilities while maintaining safety and integration with the Claudio workflow system.