# Research Workflow Validation Test

This file contains validation prompts to test the research system document creation functionality after implementing the research-specialist agent fixes.

## Purpose

Validate that:
1. **Direct Command Usage**: `/claudio:research` creates documents in correct project locations
2. **Subagent Usage**: research-specialist creates documents in extended_context when used via Task tool
3. **Document Structure**: Both overview.md and troubleshooting.md files are created with proper templates
4. **Content Quality**: Research documents meet Claudio standards for depth and accuracy
5. **Context Detection**: Agent correctly identifies usage context (direct vs subagent)

## Test Environment Setup

The validation tests use the test infrastructure in `test/research/` which provides:

- **Test Scenarios**: Sample research requests for different contexts
- **Expected Outputs**: Reference examples of proper document structure
- **Project Structure**: Mock `.claudio/` directory for direct command testing
- **Validation Points**: Clear success criteria for each test case

## Validation Prompts

### Phase 1: Direct Command Document Creation

#### Test 1a: Basic Direct Command Usage
```
Navigate to the test/research/ directory and run the research command:

/claudio:research development nodejs-testing

Expected Results:
- Directory created: test/research/.claudio/research/development/nodejs-testing/
- Files created:
  - overview.md with proper template structure
  - troubleshooting.md with common issues and solutions
- Content relevant to Node.js testing best practices
- Complexity assessment included in overview.md
```

#### Test 1b: Complex Topic Direct Command
```
From test/research/ directory, test complex topic handling:

/claudio:research infrastructure microservices-orchestration --complexity=high

Expected Results:
- Directory: test/research/.claudio/research/infrastructure/microservices-orchestration/
- Files contain advanced analysis sections due to high complexity
- Multi-perspective analysis in overview.md
- Advanced edge cases in troubleshooting.md
- Integration consideration frameworks included
```

### Phase 2: Subagent Usage Document Creation

#### Test 2a: Basic Subagent Usage
```
From the main Claudio directory, test subagent context:

Use Task tool with subagent_type: "research-specialist" to research database optimization patterns for PostgreSQL applications with focus on query performance and indexing strategies

Expected Results:
- Directory created: .claude/agents/claudio/extended_context/development/postgresql-optimization/
- Files created in extended_context location (NOT in project .claudio/)
- Content specific to PostgreSQL optimization
- Proper template structure maintained
```

#### Test 2b: Research for Missing Extended Context
```
Test scenario where other agents need research for missing context:

Use Task tool with subagent_type: "research-specialist" to research Phoenix LiveView testing patterns from https://hexdocs.pm/phoenix_live_view/testing.html to create extended context for LiveView development workflows

Expected Results:
- Directory: .claude/agents/claudio/extended_context/frontend/phoenix-liveview-testing/
- Web research incorporated from provided URL
- Testing-specific content with practical examples
- Integration with broader Phoenix development context
```

### Phase 3: Context Detection Validation

#### Test 3a: Context Detection Accuracy
```
Test both contexts in sequence to verify proper detection:

1. First, from test/research/ directory:
   /claudio:research development react-hooks

2. Then, from main directory:
   Use Task tool with subagent_type: "research-specialist" to research React hooks patterns for state management

Expected Results:
- Test 1 creates files in: test/research/.claudio/research/development/react-hooks/
- Test 2 creates files in: .claude/agents/claudio/extended_context/development/react-hooks/
- No confusion between contexts
- Both sets of files exist independently
```

### Phase 4: Document Structure Validation

#### Test 4a: Overview.md Template Compliance
```
After running any research command, validate overview.md structure contains:

✅ Required Sections:
- # [Topic] Research Overview (proper title)
- ## Complexity Assessment (with score and mode)
- ## Executive Summary (2-3 paragraphs)
- ## Core Concepts (main topic areas)
- ## Best Practices (industry standards)
- ## Implementation Patterns (code examples)
- ## Tools and Technologies (relevant tools)
- ## Integration Considerations (system integration)
- ## Sources and References (authoritative links)

❌ Missing Elements Indicate Failure:
- Generic or placeholder content
- Missing complexity assessment
- No code examples or implementation guidance
- Lack of authoritative source references
```

#### Test 4b: Troubleshooting.md Template Compliance
```
Validate troubleshooting.md structure contains:

✅ Required Sections:
- # [Topic] Troubleshooting Guide (proper title)
- ## Common Issues and Solutions (3-5 issues minimum)
  - Each with Symptoms, Diagnosis, Solution, Prevention
- ## Advanced Troubleshooting (performance, integration, edge cases)
- ## Diagnostic Tools (tools and commands)
- ## When to Escalate (expert help criteria)

❌ Missing Elements Indicate Failure:
- Generic troubleshooting advice
- Fewer than 3 specific issues addressed
- Missing diagnostic tools or commands
- No escalation guidance
```

### Phase 5: Content Quality Assessment

#### Test 5a: Research Depth and Accuracy
```
Evaluate research quality by examining any generated research:

Content Quality Checklist:
✅ Technical Accuracy: Information is current and correct
✅ Practical Examples: Code samples and real-world usage
✅ Authoritative Sources: Links to official documentation
✅ Implementation Focus: Actionable guidance rather than theory
✅ Context Awareness: Relevant to specified category/topic
✅ Complexity Appropriate: Depth matches complexity assessment

Quality Indicators:
- Specific tool versions and compatibility information
- Real code examples with explanation
- Current best practices (not outdated approaches)
- Integration with related technologies
- Performance and security considerations
```

#### Test 5b: Troubleshooting Practicality
```
Assess troubleshooting content usefulness:

Practicality Checklist:
✅ Specific Symptoms: Observable behaviors, not vague descriptions
✅ Diagnostic Steps: Clear identification procedures
✅ Step-by-Step Solutions: Actionable resolution steps
✅ Prevention Guidance: How to avoid issues in future
✅ Tool-Specific: Commands and tools for diagnosis
✅ Escalation Criteria: Clear signs when to seek expert help

Problem Coverage:
- Common beginner issues
- Intermediate integration problems  
- Advanced performance issues
- Edge cases and unusual scenarios
```

## Success Criteria

### ✅ **All Tests Must Pass:**

#### Document Creation Success
- Both overview.md and troubleshooting.md created for every research request
- Files created in correct locations based on usage context
- Directory structure properly created as needed
- No errors during file creation process

#### Template Structure Compliance
- All required sections present in both file types
- Proper markdown formatting and hierarchy
- Complexity assessment documented accurately
- Template structure consistent across different topics

#### Content Quality Standards
- Information is accurate and current (2025 standards)
- Practical examples and implementation guidance included
- Authoritative sources referenced throughout
- Topic-specific content (not generic templates)
- Appropriate depth based on complexity assessment

#### Context Detection Accuracy
- Direct command usage creates files in project `.claudio/research/`
- Subagent usage creates files in system `extended_context/`
- No confusion between usage contexts
- Proper directory structure in both contexts

### ❌ **Failure Indicators:**

#### Document Creation Failures
- Only one file created (missing overview.md OR troubleshooting.md)
- Files created in wrong location for usage context
- Directory creation failures or permission errors
- Research command only returns summaries without file creation

#### Template Structure Issues
- Missing required sections in either file type
- Poor markdown formatting or broken structure
- Generic placeholders instead of actual content
- Inconsistent template application across topics

#### Content Quality Problems
- Outdated or inaccurate technical information
- Lack of practical examples or implementation guidance
- Missing or invalid source references
- Content too generic (not topic-specific)
- Complexity assessment not reflected in content depth

#### Context Detection Problems
- Files created in wrong location for usage context
- Direct commands creating files in extended_context
- Subagent usage creating files in project directories
- Mixed contexts causing file creation in multiple locations

## Troubleshooting Test Failures

### If Document Creation Fails:
1. Check research-specialist.md agent file for proper Write tool usage
2. Verify directory creation logic and path construction
3. Ensure usage context detection works correctly
4. Test file permissions in both target locations

### If Template Structure Issues:
1. Review template definitions in research-specialist.md
2. Check that both overview.md and troubleshooting.md templates are applied
3. Verify section headers and markdown formatting
4. Ensure complexity-based content variations work correctly

### If Content Quality Problems:
1. Test with known topics where accuracy can be verified
2. Check if web search and research capabilities are functioning
3. Verify source reference functionality
4. Review complexity assessment logic

### If Context Detection Issues:
1. Test from different directory locations
2. Check working directory detection logic
3. Verify `.claudio/` and `.claude/` directory detection
4. Review path construction for both contexts

## Post-Test Actions

### If All Tests Pass:
- Research workflow document creation is functioning correctly
- Update documentation to reflect working behavior
- Research system is ready for production use
- Consider adding more advanced research scenarios

### If Tests Fail:
- Identify specific failure points from test results
- Update research-specialist agent based on failures
- Rerun specific failing test cases
- Document any limitations or known issues

## Implementation Notes

This validation should be run after implementing all research workflow fixes, as the research-specialist agent behavior is loaded at session start and changes require a new session to take effect.