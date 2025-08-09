# Agent Evaluation Framework

## Overview

This framework provides comprehensive criteria and methodologies for evaluating Claude Code sub-agents across different systems. It ensures thorough analysis of agent architecture, capabilities, performance, and integration quality.

## Evaluation Dimensions

### 1. Agent Architecture Assessment

**Configuration Quality Analysis:**
- YAML frontmatter completeness and accuracy (0-5 scale)
- Tool assignment appropriateness (0-5 scale)
- Model selection optimization (0-5 scale)
- Extended context integration quality (0-5 scale)

**Architectural Soundness:**
- Single responsibility adherence
- Tool-capability alignment
- Resource efficiency
- Scalability considerations

**Scoring Criteria:**
- **5 - Excellent**: Optimal architecture with best practices
- **4 - Good**: Well-designed with minor optimization opportunities
- **3 - Adequate**: Functional but has improvement areas
- **2 - Poor**: Significant architectural issues
- **1 - Critical**: Major problems affecting functionality

### 2. Capability Assessment

**Model Selection Analysis:**
- Model assignment appropriateness for task complexity (0-5 scale)
- Cost-performance optimization assessment (0-5 scale)
- Model capability alignment with agent requirements (0-5 scale)
- Model selection rationale and documentation quality (0-5 scale)

**Tool Usage Evaluation:**
- Tool selection appropriateness for agent purpose
- Tool combination effectiveness
- Missing tool identification
- Unused tool impact assessment

**Functional Scope Analysis:**
- Capability completeness for stated purpose
- Functional boundary clarity
- Task complexity handling
- Edge case coverage

**Performance Characteristics:**
- Execution efficiency
- Resource utilization
- Response time consistency
- Error handling robustness

### 3. Extended Context Integration

**Context Structure Assessment:**
- Extended context organization quality
- Documentation completeness
- Accessibility and discoverability
- Maintenance efficiency

**Context Utilization Analysis:**
- Agent context access patterns
- Context dependency mapping
- Information retrieval efficiency
- Context update mechanisms

### 4. Coordination and Integration Quality

**Inter-Agent Communication:**
- Context sharing mechanisms
- Parameter passing efficiency
- State synchronization quality
- Conflict resolution capabilities

**Command Integration:**
- Command-agent relationship clarity
- Parameter mapping accuracy
- Workflow coordination effectiveness
- Error propagation handling

## Analysis Methodology

### Phase 1: Configuration Analysis

1. **Structure Validation**
   - Parse agent configuration files
   - Validate YAML syntax and completeness
   - Check required field presence
   - Assess optional field utilization

2. **Tool Assignment Review**
   - Map tools to agent capabilities
   - Identify tool redundancy or gaps
   - Assess tool permission levels
   - Evaluate security implications

3. **Model Selection Analysis**
   - Assess task complexity requirements and model appropriateness
   - Evaluate cost-performance optimization for agent workload
   - Verify model capabilities align with agent requirements
   - Check model selection documentation and rationale
   - Validate model access permissions and availability

### Phase 2: Functional Assessment

1. **Capability Mapping**
   ```markdown
   Agent: security-scanner
   Stated Purpose: "Scan for security vulnerabilities"
   Required Capabilities:
   - File system scanning
   - Vulnerability database access
   - Report generation
   - Pattern matching
   
   Tool Analysis:
   ✅ Read, Glob, Grep - File scanning capabilities
   ✅ WebFetch - Vulnerability database access  
   ✅ Write - Report generation
   ❌ Missing: Bash for system-level security checks
   
   Model Analysis:
   Current Model: Sonnet
   Task Complexity: High (8/10) - Complex pattern matching and threat analysis
   Model Appropriateness: ✅ Appropriate - Complex security analysis requires advanced reasoning
   Cost-Performance: ✅ Optimized - High-complexity task justifies Sonnet model costs
   Alternative Assessment: Claude standard would be insufficient for nuanced vulnerability analysis
   ```

2. **Performance Testing**
   - Execute agent with standard test cases
   - Measure response times and resource usage
   - Test error handling scenarios
   - Evaluate output quality consistency

### Phase 3: Integration Evaluation

1. **Extended Context Assessment**
   ```bash
   # Analyze context structure
   find ~/.claude/agents/claudio/extended_context -name "*.md" -type f
   
   # Check context accessibility
   grep -r "extended_context:" ~/.claude/agents/
   
   # Validate context references
   grep -r "\.\.\/" ~/.claude/agents/claudio/extended_context/
   ```

2. **Command Relationship Analysis**
   - Map agent to commanding sources
   - Assess parameter passing quality
   - Test workflow integration
   - Evaluate error handling chains

### Phase 4: Cross-System Comparison

1. **Architectural Pattern Analysis**
   - Compare similar agents across systems
   - Identify architectural best practices
   - Assess consistency patterns
   - Document variation rationales

2. **Performance Benchmarking**
   - Execute standardized test suites
   - Compare resource utilization
   - Assess scalability characteristics
   - Identify optimization opportunities

## Quality Metrics

### Architecture Quality Score (AQS)

**Components (weighted average):**
- Configuration Quality: 25%
- Tool Selection: 20%
- Model Optimization: 15%
- Extended Context Integration: 20%
- Documentation Quality: 20%

**Calculation:**
```
AQS = (Config×0.25) + (Tools×0.20) + (Model×0.15) + (Context×0.20) + (Docs×0.20)
```

### Capability Effectiveness Score (CES)

**Components:**
- Functional Completeness: 30%
- Performance Efficiency: 25%
- Error Handling: 20%
- Edge Case Coverage: 25%

### Integration Quality Score (IQS)

**Components:**
- Command Integration: 30%
- Inter-Agent Communication: 25%
- Context Utilization: 25%
- Workflow Coordination: 20%

### Overall Agent Quality Score

**Formula:**
```
Overall Score = (AQS×0.4) + (CES×0.35) + (IQS×0.25)
```

## Reporting Standards

### Individual Agent Analysis Report

```markdown
# Agent Analysis: [agent-name]

## Executive Summary
- Overall Score: X.X/5.0
- Architecture Quality: X.X/5.0
- Capability Effectiveness: X.X/5.0  
- Integration Quality: X.X/5.0

## Primary Strengths
1. [Specific strength with evidence]
2. [Specific strength with evidence]
3. [Specific strength with evidence]

## Key Improvement Areas
1. [Priority] [Specific issue and recommendation]
2. [Priority] [Specific issue and recommendation]
3. [Priority] [Specific issue and recommendation]

## Detailed Analysis

### Architecture Assessment (X.X/5.0)
[Detailed findings for each component]

### Capability Assessment (X.X/5.0)
[Functional analysis and performance metrics]

### Integration Assessment (X.X/5.0)
[Integration quality and coordination analysis]

## Recommendations

### High Priority
- [Specific actionable recommendation]
- [Specific actionable recommendation]

### Medium Priority
- [Specific actionable recommendation]
- [Specific actionable recommendation]

### Low Priority
- [Specific actionable recommendation]

## Implementation Guidance
[Specific steps to implement recommendations]
```

### System-Wide Agent Analysis

```markdown
# System Agent Analysis: [System Name]

## Overview
- Total Agents Analyzed: X
- Average Quality Score: X.X/5.0
- High-Performing Agents: X (XX%)
- Agents Requiring Attention: X (XX%)

## Architecture Patterns Analysis
### Best Practice Implementations
[Agents demonstrating excellent architectural patterns]

### Common Architecture Issues
[Recurring architectural problems across agents]

## Capability Distribution Analysis
### Tool Usage Patterns
[Analysis of tool assignment across agents]

### Functional Coverage Assessment
[Gaps and overlaps in agent capabilities]

## Integration Quality Overview
### Strong Integration Examples
[Agents with excellent command integration]

### Integration Improvement Opportunities
[Areas needing better integration]

## System-Level Recommendations

### Architectural Standardization
[Recommendations for consistent architecture]

### Capability Optimization
[Recommendations for better capability distribution]

### Integration Enhancement
[Recommendations for improved integration patterns]
```

### Cross-System Comparison Report

```markdown
# Cross-System Agent Analysis

## Systems Compared
[List of analyzed systems with basic statistics]

## Best Practice Identification

### Architectural Excellence
[Agents/patterns representing best practices]

### Innovation Examples
[Novel approaches worth replication]

### Integration Patterns
[Effective integration strategies]

## Standardization Opportunities

### Architecture Standardization
[Areas where consistency would benefit all systems]

### Tool Assignment Patterns
[Standardized tool assignment recommendations]

### Extended Context Frameworks
[Common context organization patterns]

## Migration and Improvement Roadmap

### High-Impact Improvements
[Changes that would significantly benefit multiple systems]

### System-Specific Optimizations
[Targeted improvements for individual systems]

### Long-term Evolution Strategy
[Strategic direction for agent architecture evolution]
```

## Quality Gates and Standards

### Minimum Acceptable Standards
- Overall Score: ≥ 3.0/5.0
- Architecture Quality: ≥ 2.5/5.0
- Critical functionality: Must be present and working
- Basic error handling: Must be implemented

### Excellence Benchmarks
- Overall Score: ≥ 4.5/5.0
- All dimensional scores: ≥ 4.0/5.0
- Best practice adherence: ≥ 90%
- Performance benchmarks: Top 10% of similar agents

### Red Flags (Immediate Attention Required)
- Security vulnerabilities in tool usage
- Missing critical error handling
- Broken extended context references
- Performance degradation > 50% from baseline

## Continuous Improvement Process

### Regular Assessment Schedule
- **Weekly**: Critical agent monitoring
- **Monthly**: High-usage agent detailed review
- **Quarterly**: Full system agent assessment
- **Semi-annually**: Cross-system comparison analysis
- **Annually**: Framework methodology review

### Performance Trend Analysis
- Track agent performance over time
- Identify degradation patterns
- Monitor improvement implementation success
- Benchmark against historical performance

### Feedback Integration Loop
- User experience feedback collection
- Performance metric analysis
- Best practice evolution tracking
- Framework refinement based on lessons learned

This framework ensures systematic, comprehensive evaluation of Claude Code agents while maintaining consistency across different systems and analysis sessions.