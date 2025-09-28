# Agent Architecture Patterns

## Overview

This document defines proven architectural patterns for Claude Code sub-agents. These patterns ensure consistency, maintainability, and optimal performance across different systems and use cases.

## Core Architectural Patterns

### 1. Single-Purpose Specialist Pattern

**Use Case:** Agents focused on one specific domain or capability.

**Structure:**
```yaml
---
name: security-scanner
description: "Specialized agent for identifying security vulnerabilities in code"
tools: [Read, Glob, Grep, WebFetch, Write]
model: sonnet
extended_context: security-knowledge, vulnerability-patterns
---
```

**Characteristics:**
- Clear, focused responsibility
- Deep expertise in specific domain
- Optimized tool set for specific tasks
- Rich domain-specific extended context

**Benefits:**
- High expertise and accuracy in domain
- Easy to test and validate
- Clear maintenance boundaries
- Optimized resource usage

**Best Practices:**
- Keep scope narrow and well-defined
- Include comprehensive domain knowledge
- Optimize tool selection for domain tasks
- Maintain rich extended context

**Example Implementation:**
```markdown
# Python Security Scanner Agent

## Domain Expertise
- Python-specific vulnerability patterns
- OWASP Top 10 for Python applications
- Dependency security analysis
- Code injection detection

## Tool Utilization
- Read: Analyze Python source files
- Glob: Find all Python files in project
- Grep: Search for vulnerability patterns
- WebFetch: Check vulnerability databases
- Write: Generate security reports

## Extended Context Integration
- security-knowledge/python-vulnerabilities/
- security-knowledge/best-practices/
- vulnerability-patterns/injection-patterns/
```

### 2. Workflow Orchestrator Pattern

**Use Case:** Agents that coordinate multiple tasks or other agents.

**Structure:**
```yaml
---
name: ci-cd-orchestrator
description: "Coordinates complete CI/CD pipeline execution with multiple stages"
tools: [Task, Bash, Read, Write, TodoWrite]
model: sonnet
extended_context: ci-cd-workflows, deployment-patterns
---
```

**Characteristics:**
- Manages complex multi-step processes
- Coordinates other agents and tools
- Handles error recovery and rollback
- Maintains process state and context

**Benefits:**
- Handles complex business workflows
- Provides centralized coordination
- Enables sophisticated error handling
- Supports process monitoring and reporting

**Implementation Pattern:**
```markdown
# CI/CD Orchestrator Implementation

## Workflow Stages
1. Source validation (code-validator agent)
2. Dependency analysis (dependency-analyzer agent)
3. Testing execution (test-runner agent)
4. Security scanning (security-scanner agent)
5. Build process (build-agent)
6. Deployment (deployment-agent)
7. Health verification (health-checker agent)

## Coordination Logic
- Sequential execution with checkpoints
- Parallel execution where safe
- Error handling with rollback capabilities
- Progress tracking and reporting
- State preservation across stages
```

### 3. Context-Aware Adapter Pattern

**Use Case:** Agents that adapt behavior based on project context or environment.

**Structure:**
```yaml
---
name: language-aware-formatter
description: "Code formatter that adapts to project language and style conventions"
tools: [Read, Glob, Bash, Write, Grep]
model: sonnet
extended_context: language-patterns, style-guides, formatting-rules
---
```

**Characteristics:**
- Detects project characteristics automatically
- Adapts behavior based on context
- Supports multiple scenarios within single agent
- Maintains consistent interface across contexts

**Context Detection Logic:**
```markdown
# Language Detection and Adaptation

## Detection Strategies
1. File Extension Analysis
   - .py files → Python formatting
   - .js/.ts files → JavaScript/TypeScript formatting
   - .java files → Java formatting

2. Configuration File Detection
   - package.json → Node.js project
   - requirements.txt → Python project
   - pom.xml → Maven Java project

3. Directory Structure Analysis
   - src/main/java → Java project structure
   - src/components → React project structure

## Adaptation Mechanisms
- Load language-specific formatting rules
- Apply project-specific style guides
- Use appropriate formatting tools
- Generate language-appropriate reports
```

### 4. Resource-Optimized Processor Pattern

**Use Case:** Agents handling large datasets or resource-intensive operations.

**Structure:**
```yaml
---
name: large-codebase-analyzer
description: "Efficiently analyzes large codebases with incremental processing"
tools: [Read, Glob, Bash, Write, TodoWrite]
model: sonnet
extended_context: optimization-strategies, processing-patterns
---
```

**Characteristics:**
- Implements incremental processing
- Manages memory and resource usage
- Provides progress tracking
- Supports resumable operations

**Optimization Strategies:**
```markdown
# Resource Optimization Implementation

## Incremental Processing
1. File Discovery and Batching
   - Discover all files to process
   - Group into manageable batches (50-100 files)
   - Process batches sequentially

2. Memory Management
   - Process files individually within batches
   - Clear intermediate results after batch completion
   - Use streaming for large file processing

3. Progress Tracking
   - Maintain completion state
   - Provide progress indicators
   - Enable resume from interruption

## Scalability Features
- Configurable batch sizes
- Memory usage monitoring
- Timeout handling for large files
- Parallel processing where safe
```

### 5. Multi-Model Collaboration Pattern

**Use Case:** Agents that leverage different models for different aspects of work.

**Structure:**
```yaml
---
name: comprehensive-code-reviewer
description: "Provides multi-perspective code review using specialized models"
tools: [Task, Read, Glob, Write]
model: sonnet  # Primary model
extended_context: review-methodologies, quality-standards
---
```

**Characteristics:**
- Uses multiple models via Task tool
- Combines different analytical perspectives
- Provides comprehensive analysis
- Maintains consistent output format

**Implementation Approach:**
```markdown
# Multi-Model Code Review

## Model Utilization Strategy
1. Primary Analysis (Sonnet)
   - Code structure and architecture review
   - Best practice compliance checking
   - Security vulnerability identification

2. Specialized Analysis (via Task tool)
   - Performance analysis specialist
   - Documentation quality specialist  
   - Testing coverage specialist

## Result Synthesis
- Combine perspectives into unified review
- Prioritize findings by impact and confidence
- Provide actionable recommendations
- Generate summary with key insights
```

## Extended Context Architecture Patterns

### 1. Hierarchical Knowledge Structure

**Pattern:**
```
extended_context/
├── domain-knowledge/
│   ├── core-concepts/
│   ├── best-practices/
│   └── common-patterns/
├── troubleshooting/
│   ├── common-issues/
│   └── resolution-guides/
└── reference-materials/
    ├── documentation-links/
    └── tool-specifications/
```

**Benefits:**
- Logical organization of information
- Easy navigation and discovery
- Clear separation of concerns
- Scalable knowledge management

### 2. Cross-Referenced Context Network

**Pattern:**
```markdown
# In security-patterns.md
Related contexts:
- ../coding-standards/security-practices.md
- ../vulnerability-databases/known-issues.md
- ../../troubleshooting/security-issues.md

# Cross-references enable:
- Related information discovery
- Comprehensive knowledge access
- Contextual learning paths
```

### 3. Layered Context Architecture

**Layers:**
1. **Core Layer**: Fundamental concepts and principles
2. **Domain Layer**: Specific knowledge areas
3. **Application Layer**: Practical implementation guides
4. **Troubleshooting Layer**: Problem resolution information

## Tool Assignment Patterns

### 1. Capability-Matched Tool Sets

**Pattern:**
```yaml
# Analysis-focused agent
tools: [Read, Glob, Grep, Write]  # Information gathering and reporting

# Orchestration-focused agent  
tools: [Task, Bash, TodoWrite]    # Process coordination and execution

# Development-focused agent
tools: [Read, Edit, MultiEdit, Bash, Write]  # Code modification and testing
```

### 2. Progressive Tool Access

**Pattern:**
```yaml
# Basic capability agent
tools: [Read, Write]

# Enhanced capability agent (includes basic + additional)
tools: [Read, Write, Glob, Grep]

# Full capability agent (includes all previous + advanced)
tools: [Read, Write, Glob, Grep, Bash, Task, Edit, MultiEdit]
```

### 3. Domain-Specific Tool Optimization

**Examples:**
```yaml
# Web-focused agent
tools: [WebFetch, Read, Write, Bash]

# File management agent
tools: [Read, Write, Edit, MultiEdit, LS, Glob]

# System administration agent
tools: [Bash, Read, Write, LS]
```

## Communication and Coordination Patterns

### 1. Message Passing Pattern

**Implementation:**
```markdown
# Agent A passes structured data to Agent B
Context passed to next agent:
- operation-id: unique identifier
- previous-results: structured output
- user-context: original user request
- environment-state: current system state
```

### 2. Shared Context Pattern

**Implementation:**
```markdown
# Multiple agents access shared extended context
Shared context location: ~/.claude/agents/claudio/extended_context/shared/
- project-state.md: Current project analysis
- user-preferences.md: User configuration
- session-context.md: Current session information
```

### 3. Event-Driven Coordination Pattern

**Implementation:**
```markdown
# Agents respond to events in workflow
Event Types:
- analysis-complete: Triggers report generation
- error-detected: Triggers error handling agent
- user-input-required: Triggers user interaction agent
```

## Quality Assurance Patterns

### 1. Self-Validation Pattern

**Implementation:**
```markdown
# Agent validates its own output before completion
Validation steps:
1. Check output format compliance
2. Verify required information present  
3. Validate against known constraints
4. Perform consistency checks
```

### 2. Peer Review Pattern

**Implementation:**
```markdown
# Multiple agents review each other's work
Review workflow:
1. Primary agent completes analysis
2. Review agent validates analysis quality
3. Synthesis agent combines perspectives
4. Final output generated with confidence scores
```

### 3. Continuous Improvement Pattern

**Implementation:**
```markdown
# Agent learns from feedback and improves over time
Improvement mechanisms:
- Track user satisfaction with outputs
- Monitor correction frequency
- Analyze performance metrics
- Update extended context based on learnings
```

## Anti-Patterns to Avoid

### 1. Monolithic Agent Anti-Pattern

**Problem:** Single agent trying to handle too many responsibilities.

**Solution:** Split into focused specialist agents with clear boundaries.

### 2. Tool Overload Anti-Pattern

**Problem:** Agent assigned too many tools, creating security and performance risks.

**Solution:** Assign minimal tool set needed for agent's specific purpose.

### 3. Context Redundancy Anti-Pattern

**Problem:** Multiple agents maintaining duplicate information in extended context.

**Solution:** Create shared context areas and reference them appropriately.

### 4. Coordination Chaos Anti-Pattern

**Problem:** Agents communicating without clear protocols or structure.

**Solution:** Implement structured communication patterns and coordination protocols.

These architectural patterns provide a foundation for building robust, maintainable, and efficient agent systems that work reliably across different Claude Code environments.