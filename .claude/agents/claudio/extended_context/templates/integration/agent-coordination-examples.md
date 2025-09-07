# Agent Coordination Examples

This document provides comprehensive examples of how Claudio agents coordinate with each other using proven patterns for complex workflows.

## Sub-Agent Invocation Pattern

### Natural Language Sub-Agent Coordination
```markdown
**When Agents Need Other Agents (Recommended Pattern):**

```markdown
## Extended Context Integration

This agent integrates with extended context for security analysis patterns.

**Context Loading**: Only loads context when performing security analysis operations

**Graceful Degradation**: Functions without extended context, uses research-specialist subagent to create missing documentation when needed:

When security analysis context is missing:
- Use the research-specialist subagent to research security vulnerability patterns from authoritative sources like OWASP and NIST
- Create comprehensive security analysis context with threat detection patterns and remediation guidance
- Proceed with analysis using newly created context documentation
```

**Benefits:**
- Uses Claude Code's natural sub-agent invocation patterns
- Avoids deprecated Task tool patterns within agents
- Provides graceful fallback when extended context is missing
- Maintains system reliability through dynamic context creation
```

## Orchestrator-Agent Coordination Pattern

### Multi-Agent Workflow Coordination
```markdown
**Orchestrator Agent Implementation:**

```markdown
---
name: security-review-orchestrator
description: "Orchestrates comprehensive security review using STRIDE methodology with parallel specialized analysis"
tools: [Task, TodoWrite, Read, Write]
model: opus
---

You are the security-review-orchestrator agent that orchestrates comprehensive security reviews. Your role is to coordinate multiple specialized security agents and ensure complete security assessment coverage.

## Security Review Process:

### Phase 1: Security Analysis Preparation
Use TodoWrite to start Phase 1 - Security Analysis Preparation.

Analyze project scope and prepare security review parameters based on project discovery and architecture analysis.

Use TodoWrite to complete Phase 1 - Security Analysis Preparation.

### Phase 2: Parallel Security Analysis  
Use TodoWrite to start Phase 2 - Parallel Security Analysis.

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "vulnerability-assessment-specialist" - pass project path and analysis scope for vulnerability detection
- Task with subagent_type: "security-architecture-analyst" - pass architecture parameters for design security review  
- Task with subagent_type: "security-threat-modeler" - pass STRIDE methodology parameters for threat modeling
- Task with subagent_type: "security-diagram-generator" - pass diagram requirements for threat visualization

Use TodoWrite to complete Phase 2 - Parallel Security Analysis.

### Phase 3: Security Review Consolidation
Use TodoWrite to start Phase 3 - Security Review Consolidation.

Consolidate findings from all security agents into comprehensive assessment with prioritized remediation roadmap.

Use TodoWrite to complete Phase 3 - Security Review Consolidation.
```

**Coordination Characteristics:**
- Orchestrator manages workflow phases with TodoWrite tracking
- Parallel Task invocations for performance optimization  
- Individual specialist agents focus on domain expertise
- Results consolidated by orchestrator for unified output
```

## Discovery System Coordination

### Parallel Analysis Coordination
```markdown
**Discovery System Architecture:**

```markdown
## Enhanced Discovery Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

Use TodoWrite to start comprehensive project discovery.

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "discovery-structure-analyzer" - pass project path for directory organization and file pattern analysis
- Task with subagent_type: "discovery-tech-analyzer" - pass project path for technology stack detection and dependency analysis
- Task with subagent_type: "discovery-architecture-analyzer" - pass project path for design pattern and architectural analysis
- Task with subagent_type: "discovery-integration-analyzer" - pass project path for tool integration and MCP recommendations

Then read outputs from all analyzers, validate completeness, and use Task with subagent_type: "discovery-consolidator" to create unified discovery report.

Use TodoWrite to complete comprehensive project discovery.
```

**Coordination Benefits:**
- Specialized analyzers focus on specific discovery domains
- Parallel execution reduces total discovery time by 4x
- Consolidator ensures no duplication or gaps in final report
- Each analyzer operates independently with no dependencies
```

## Agent-to-Agent Communication Patterns

### Context Sharing Pattern
```markdown
**Shared Context Coordination:**

**Agent A (Analysis Agent):**
```markdown
## Analysis Results Storage

After completing analysis, store results in shared context:
- Write analysis findings to `.claudio/shared/analysis_results.json`
- Include timestamp, analysis scope, and key findings
- Provide structured data for other agents to consume
```

**Agent B (Report Generator):**
```markdown
## Shared Context Integration

When generating reports, integrate shared analysis results:
- Read analysis findings from `.claudio/shared/analysis_results.json`  
- Combine with own analysis for comprehensive reporting
- Include cross-references and integrated recommendations
```

**Benefits:**
- Avoids duplicate analysis across agents
- Enables data sharing without direct agent communication
- Maintains agent independence while enabling collaboration
```

### Sequential Workflow Pattern
```markdown
**Workflow Chain Coordination:**

**Phase 1 Agent (Discovery Agent):**
```markdown
## Workflow Output Preparation

After completing project discovery:
1. Generate comprehensive discovery report in `.claudio/discovery.md`
2. Create project context summary for subsequent workflow phases
3. Signal completion through TodoWrite status updates
```

**Phase 2 Agent (PRD Agent):**
```markdown
## Discovery Integration

When creating PRD:
1. Read project discovery from `.claudio/discovery.md`
2. Use discovery insights to inform requirements analysis
3. Reference discovery findings in PRD sections for consistency
4. Build upon discovered architecture and technology constraints
```

**Phase 3 Agent (Planning Agent):**
```markdown
## PRD and Discovery Integration  

When creating implementation plan:
1. Read requirements from `.claudio/prd.md`
2. Reference technical constraints from `.claudio/discovery.md`
3. Align planning recommendations with discovered architecture
4. Consider discovered tools and frameworks in implementation strategy
```

**Workflow Benefits:**
- Each agent builds upon previous phase outputs
- Maintains consistency across workflow phases
- Enables incremental refinement of project understanding
- Supports iterative development approach
```

## Error Coordination Patterns

### Graceful Failure Coordination
```markdown
**Multi-Agent Error Handling:**

**Orchestrator Error Management:**
```markdown
## Error Handling Strategy

When coordinating multiple agents:

1. **Partial Success Handling**:
   - Continue with successful agent results when some agents fail
   - Document which analyses completed successfully
   - Provide confidence levels for partial results

2. **Fallback Agent Coordination**:
   - Use backup agents when primary agents fail
   - Example: Use generic-analyzer when specialized-analyzer fails
   - Maintain service quality through agent redundancy

3. **Error Propagation Control**:
   - Prevent single agent failures from cascading
   - Isolate errors while preserving successful results
   - Provide clear error communication to users
```

**Agent-Level Error Coordination:**
```markdown
## Individual Agent Error Handling

When an agent encounters errors:

1. **Graceful Degradation**:
   - Complete available analysis even with partial failures
   - Document limitations clearly in output
   - Provide recommendations for manual completion

2. **Context Recovery**:
   - Use research-specialist subagent to create missing extended context
   - Provide fallback analysis when optimal context unavailable
   - Continue operation with reduced but functional capabilities
```
```

## Performance Coordination Patterns

### Parallel Execution Coordination
```markdown
**High-Performance Multi-Agent Pattern:**

**Critical Requirements for Parallel Coordination:**

1. **Single Message Pattern**:
   ```markdown
   **🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
   - Task with subagent_type: "agent-1" - pass specific parameters
   - Task with subagent_type: "agent-2" - pass specific parameters  
   - Task with subagent_type: "agent-3" - pass specific parameters
   ```

2. **Independent Operation**:
   - Each agent operates on non-overlapping data or tasks
   - No dependencies between parallel agents
   - Results can be processed independently

3. **Resource Management**:
   - Distribute file access across agents to minimize contention
   - Optimize memory usage across parallel operations
   - Handle timeout scenarios gracefully

4. **Result Aggregation**:
   - Collect all parallel results before processing
   - Handle partial results when some agents timeout or fail
   - Synthesize results into coherent final output
```

### Load Distribution Pattern
```markdown
**Large Dataset Coordination:**

**When Processing Large Projects (1000+ files):**

```markdown
## Distributed Analysis Pattern

For large codebase analysis:

1. **Data Partitioning**:
   - Divide project files into logical partitions (by directory, file type, etc.)
   - Assign each partition to specialized agent for focused analysis
   - Ensure no file overlap between agent assignments

2. **Parallel Processing**:
   - Task with subagent_type: "analyzer-1" - pass partition 1 (src/components/) for analysis
   - Task with subagent_type: "analyzer-2" - pass partition 2 (src/utils/) for analysis
   - Task with subagent_type: "analyzer-3" - pass partition 3 (tests/) for analysis

3. **Result Consolidation**:
   - Aggregate results from all partition analyses
   - Identify cross-partition patterns and dependencies
   - Generate unified analysis with complete project coverage
```

**Benefits:**
- Scales to very large projects through work distribution
- Maintains analysis quality through focused agent expertise
- Reduces individual agent memory and processing requirements
```

## Quality Assurance Coordination

### Multi-Perspective Validation Pattern
```markdown
**Cross-Validation Coordination:**

**Primary Analysis Agent:**
```markdown
## Analysis with Validation Request

After completing primary analysis:
1. Generate detailed findings and recommendations
2. Request validation from peer review agent for quality assurance
3. Store analysis results for validation agent access
```

**Validation Agent Coordination:**
```markdown
## Peer Review Validation

For analysis validation:
1. Read primary analysis results from shared location
2. Perform independent validation of key findings
3. Identify discrepancies or areas requiring clarification  
4. Generate validation report with confidence assessment
```

**Synthesis Coordination:**
```markdown
## Result Integration

Final result synthesis:
1. Combine primary analysis with validation feedback
2. Resolve discrepancies through additional analysis if needed
3. Generate final report with confidence levels and validation status
4. Provide clear indication of analysis quality and reliability
```
```

These coordination patterns enable sophisticated multi-agent workflows while maintaining system reliability, performance, and quality assurance across complex Claudio operations.