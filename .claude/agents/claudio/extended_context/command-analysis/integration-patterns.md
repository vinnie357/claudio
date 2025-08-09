# Command-Agent Integration Patterns

## Overview

This document defines proven patterns for integrating Claude Code slash commands with their corresponding agents. These patterns ensure reliable, maintainable, and efficient command execution across different systems.

## Core Integration Patterns

### 1. Direct Agent Delegation Pattern

**Use Case:** Simple commands that map directly to a single agent capability.

**Implementation:**
```markdown
---
description: "Generate security vulnerability report for the current project"
argument-hint: "[--format <json|html|pdf>]"
---

Analyze the current project for security vulnerabilities using the security-scanner agent.

Pass the following parameters:
- scan-scope: full-project
- output-format: ${format:-html}
- include-dependencies: true
```

**Benefits:**
- Simple and predictable
- Clear responsibility boundaries
- Easy to test and debug
- Minimal complexity

**Best For:**
- Single-purpose commands
- Straightforward agent capabilities
- Commands with clear input/output

### 2. Agent Orchestration Pattern

**Use Case:** Complex commands that require coordination between multiple agents.

**Implementation:**
```markdown
---
description: "Deploy application with full CI/CD pipeline execution"
argument-hint: "<environment> [--skip-tests] [--rollback-on-failure]"
---

Execute full deployment pipeline using multiple specialized agents:

1. Use build-agent to compile and package application
2. Use test-agent to run test suite (unless --skip-tests specified)
3. Use security-scanner to verify deployment security
4. Use deploy-agent to execute deployment to ${environment}
5. Use monitoring-agent to verify deployment health
6. If any step fails and --rollback-on-failure is set, use rollback-agent

Coordinate agents in sequence with proper error handling and context passing.
```

**Benefits:**
- Handles complex workflows
- Maintains separation of concerns
- Provides robust error handling
- Supports conditional execution

**Best For:**
- Multi-step processes
- Complex business workflows
- Commands requiring multiple expertise areas

### 3. Conditional Agent Selection Pattern

**Use Case:** Commands that need different agents based on context or parameters.

**Implementation:**
```markdown
---
description: "Analyze code quality using appropriate language-specific tools"
argument-hint: "[--language <auto|javascript|python|java>] [--strict]"
---

Analyze code quality using the appropriate language-specific agent:

If --language is specified:
- Use ${language}-analyzer agent directly

If --language is auto or not specified:
1. Use language-detector agent to identify primary language
2. Based on detected language, use appropriate analyzer:
   - javascript-analyzer for JS/TS projects
   - python-analyzer for Python projects
   - java-analyzer for Java projects
   - generic-analyzer for other languages

Pass analysis parameters:
- strict-mode: ${strict:-false}
- include-style-checks: true
- generate-report: true
```

**Benefits:**
- Adaptive to different contexts
- Reduces user complexity
- Leverages specialized capabilities
- Maintains consistent interface

**Best For:**
- Context-dependent operations
- Multi-language support
- Environment-specific behaviors

### 4. Pipeline Pattern with Checkpoints

**Use Case:** Long-running processes that need progress tracking and recovery.

**Implementation:**
```markdown
---
description: "Execute comprehensive project analysis with progress tracking"
argument-hint: "[--resume-from <checkpoint>] [--save-checkpoints]"
---

Execute comprehensive analysis pipeline with checkpoint support:

Checkpoints:
1. "init" - Project structure analysis (structure-analyzer agent)
2. "dependencies" - Dependency analysis (dependency-analyzer agent)  
3. "security" - Security vulnerability scan (security-scanner agent)
4. "quality" - Code quality assessment (quality-analyzer agent)
5. "performance" - Performance analysis (performance-analyzer agent)
6. "report" - Generate final report (report-generator agent)

If --resume-from specified:
- Skip to specified checkpoint and continue
- Load previous results from checkpoint data

If --save-checkpoints enabled:
- Save state after each successful checkpoint
- Enable resume capability for failed runs

Each agent receives:
- Previous checkpoint results as context
- Current project state
- User-specified parameters
```

**Benefits:**
- Resilient to failures
- Supports long-running processes
- Provides progress visibility
- Enables selective re-execution

**Best For:**
- Long-running analyses
- Complex multi-stage processes
- Operations prone to interruption

## Parameter Passing Strategies

### 1. Direct Parameter Mapping

**Pattern:**
```markdown
Pass user parameters directly to agent:
- source-path: ${source-path}
- target-environment: ${environment}
- verbose: ${verbose:-false}
```

**When to Use:**
- Simple parameter structures
- One-to-one parameter mapping
- No parameter transformation needed

### 2. Parameter Transformation

**Pattern:**
```markdown
Transform parameters for agent compatibility:
- If ${format} is "simple", pass detailed-output: false
- If ${format} is "detailed", pass detailed-output: true, include-metrics: true
- Convert ${environment} to deployment-config based on environment mapping
```

**When to Use:**
- Agent expects different parameter format
- Need to combine multiple user inputs
- Legacy agent compatibility

### 3. Context-Aware Parameter Generation

**Pattern:**
```markdown
Generate parameters based on project context:

Detect project characteristics:
- If package.json exists, pass project-type: "node"
- If requirements.txt exists, pass project-type: "python"
- If pom.xml exists, pass project-type: "java"

Set analysis depth based on project size:
- If file count < 100, pass analysis-depth: "deep"
- If file count > 1000, pass analysis-depth: "shallow"
```

**When to Use:**
- Context-dependent behavior needed
- Smart defaults required
- Optimization based on project characteristics

## Error Handling Integration Patterns

### 1. Graceful Degradation Pattern

**Implementation:**
```markdown
Execute analysis with fallback strategies:

Primary: Use specialized-analyzer agent
If specialized-analyzer fails:
  Fallback: Use generic-analyzer agent with reduced features
If generic-analyzer fails:
  Final fallback: Use basic-checker with minimal analysis

Report the level of analysis achieved to user.
```

**Benefits:**
- Always provides some result
- Transparent about limitations
- Maintains user confidence

### 2. Retry with Backoff Pattern

**Implementation:**
```markdown
Execute deployment with retry logic:

Attempt 1: Use deploy-agent with standard timeout
If timeout occurs:
  Attempt 2: Use deploy-agent with extended timeout
If still fails:
  Attempt 3: Use deploy-agent with maximum timeout and reduced concurrency

Between attempts:
- Wait 30s, then 60s, then 120s
- Check system health before retry
- Log retry attempts for debugging
```

**Benefits:**
- Handles transient failures
- Provides multiple recovery opportunities
- Maintains system stability

### 3. Compensating Actions Pattern

**Implementation:**
```markdown
Execute transaction with compensation:

1. Use backup-agent to create pre-deployment backup
2. Use deploy-agent to execute deployment
3. Use health-check-agent to verify deployment

If deployment fails:
- Use rollback-agent to restore previous state
- Use cleanup-agent to remove partial deployment artifacts
- Use notification-agent to alert relevant teams

If health check fails:
- Use rollback-agent with backup from step 1
- Use monitoring-agent to track rollback success
```

**Benefits:**
- Maintains system consistency
- Provides automatic recovery
- Reduces manual intervention

## Context Preservation Strategies

### 1. Session Context Pattern

**Implementation:**
```markdown
Maintain context across agent calls:

Initialize session context:
- user-id: Current user identifier
- project-root: Current project directory
- command-timestamp: Current timestamp
- user-preferences: Loaded user settings

Pass session context to each agent:
- All agents receive session context as base
- Each agent adds its results to session context
- Next agent receives updated context
```

**Benefits:**
- Consistent context across agents
- Enables context-aware decisions
- Supports audit trails

### 2. State Machine Pattern

**Implementation:**
```markdown
Manage complex state transitions:

States: [analyzing, building, testing, deploying, verifying, complete]

State transitions:
- analyzing -> building (analysis-agent completes successfully)
- building -> testing (build-agent completes successfully)  
- testing -> deploying (test-agent passes)
- deploying -> verifying (deploy-agent completes)
- verifying -> complete (health-check-agent passes)
- any -> error (any agent fails)

Each state has:
- Entry actions (what to do when entering state)
- Exit actions (what to do when leaving state)
- Valid transitions (which states can follow)
```

**Benefits:**
- Clear process flow
- Predictable behavior
- Easy to debug and monitor

## Performance Optimization Patterns

### 1. Parallel Agent Execution

**Pattern:**
```markdown
Execute independent analyses in parallel:

Launch simultaneously:
- security-scanner agent (analyze security)
- quality-checker agent (analyze code quality)  
- dependency-analyzer agent (analyze dependencies)

Wait for all agents to complete, then:
- Use report-generator agent to combine results
- Present unified report to user

Timeout handling:
- If any agent exceeds 5 minutes, continue with available results
- Mark slow agents in final report
```

**Benefits:**
- Faster overall execution
- Better resource utilization
- Improved user experience

### 2. Incremental Processing Pattern

**Pattern:**
```markdown
Process large datasets incrementally:

1. Use file-scanner agent to identify files to process
2. Group files into batches of 50
3. For each batch:
   - Use appropriate-analyzer agent to process batch
   - Collect and store intermediate results
   - Update progress indicator
4. Use result-aggregator agent to combine all batch results
5. Generate final report
```

**Benefits:**
- Handles large projects efficiently
- Provides progress feedback
- Enables early termination if needed

## Integration Testing Patterns

### 1. Mock Agent Pattern

**For Testing:**
```markdown
# Test command with mock agents
Use mock-security-scanner instead of security-scanner:
- Returns predefined security report
- Simulates various security issues
- Tests command's response to different scenarios

Use mock-deploy-agent instead of deploy-agent:
- Simulates deployment without actual deployment
- Tests error handling and rollback scenarios
- Validates parameter passing accuracy
```

### 2. Integration Validation Pattern

**For Production Readiness:**
```markdown
Validate command-agent integration:

1. Parameter compatibility check:
   - Verify all command parameters map to agent capabilities
   - Test with various parameter combinations
   - Validate error handling for invalid parameters

2. Context preservation verification:
   - Ensure context flows correctly between agents
   - Verify no data loss during agent transitions
   - Test context recovery after agent failures

3. End-to-end workflow testing:
   - Execute complete workflows with real agents
   - Verify expected outcomes
   - Test error scenarios and recovery
```

These integration patterns provide a foundation for building robust, maintainable command-agent relationships that work reliably across different Claude Code systems.