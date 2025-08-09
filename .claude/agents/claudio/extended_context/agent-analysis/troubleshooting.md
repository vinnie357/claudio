# Agent Analysis Troubleshooting Guide

## Overview

This guide provides comprehensive solutions for issues encountered during agent analysis, evaluation, and optimization processes. It covers technical problems, evaluation challenges, and systematic debugging approaches.

## Common Agent Analysis Issues

### 1. Configuration Analysis Problems

**Issue:** Agent configuration files fail to parse or validate correctly.

**Symptoms:**
- YAML parsing errors during analysis
- Missing or invalid field detection
- Tool assignment validation failures
- Model selection inconsistencies

**Diagnosis Steps:**
1. **YAML Syntax Validation**
   ```bash
   # Check YAML syntax
   python -c "import yaml; yaml.safe_load(open('agent.md'))"
   
   # Or use online YAML validator
   cat agent.md | head -20  # Check frontmatter section
   ```

2. **Field Validation**
   ```bash
   # Check required fields
   grep -E "^(name|description|tools|model):" agent.md
   
   # Validate extended_context references
   grep "extended_context:" agent.md
   ```

3. **Model Selection Analysis**
   ```markdown
   # Review model selection criteria
   Current model: ${current_model}
   Agent complexity: ${complexity_score}
   Recommended model: ${recommended_model}
   
   Model Selection Issues:
   - Overqualified model for simple tasks (cost inefficiency)
   - Underqualified model for complex tasks (quality issues)
   - Missing model specification (defaults may be inappropriate)
   ```

**Solutions:**
```yaml
# Problem: Invalid YAML frontmatter
---
name: security-scanner
description: Scans for security issues  # Missing quotes around complex text
tools: [Read, Glob, Grep WebFetch, Write]  # Missing comma
model: sonnet
extended_context: security, patterns
---

# Solution: Properly formatted frontmatter
---
name: security-scanner
description: "Scans for security vulnerabilities in code"
tools: [Read, Glob, Grep, WebFetch, Write]
model: sonnet
extended_context: security, vulnerability-patterns
---
```

**Prevention:**
- Implement automated YAML validation in CI/CD
- Create agent configuration templates
- Use linting tools during development
- Regular configuration audits

### 2. Model Selection Evaluation Issues

**Issue:** Incorrect model assignment for agent capabilities and complexity.

**Symptoms:**
- Poor performance despite good architecture
- Excessive costs for simple operations
- Quality issues with complex analysis tasks
- Inconsistent model usage across similar agents

**Diagnosis Framework:**
```markdown
# Model Selection Assessment
Agent Complexity Analysis:
1. Task Complexity Score (1-10):
   - Simple pattern matching: 1-3
   - Multi-step analysis: 4-6  
   - Complex reasoning/synthesis: 7-10

2. Context Complexity Score (1-10):
   - Basic templates/checklists: 1-3
   - Structured methodologies: 4-6
   - Advanced frameworks: 7-10

3. Output Quality Requirements (1-10):
   - Basic reporting: 1-3
   - Structured analysis: 4-6
   - Expert-level insights: 7-10

Total Complexity Score = Average of three scores

Model Recommendations:
- Score 1-3: Claude standard (cost-effective)
- Score 4-6: Claude standard or Sonnet (based on quality requirements)
- Score 7-10: Sonnet (optimal reasoning capabilities)
```

**Solutions:**
```markdown
# Problem: Overqualified model
Agent: simple-file-counter
Current Model: Sonnet
Task: Count files in directory
Complexity Score: 2/10

Solution: Change to Claude standard model
- Maintains adequate functionality
- Reduces operational costs
- Appropriate for simple counting tasks

# Problem: Underqualified model  
Agent: security-vulnerability-analyzer
Current Model: Claude standard
Task: Complex security analysis with threat modeling
Complexity Score: 9/10

Solution: Upgrade to Sonnet model
- Better reasoning for complex security scenarios
- Improved threat analysis capabilities
- Enhanced pattern recognition for vulnerabilities
```

### 3. Extended Context Integration Problems

**Issue:** Agents cannot access or properly utilize extended context.

**Symptoms:**
- Context reference resolution failures
- Inconsistent knowledge application
- Missing domain expertise in outputs
- Context loading timeouts or errors

**Diagnosis Steps:**
1. **Context Accessibility Check**
   ```bash
   # Verify context files exist
   find ~/.claude/agents/claudio/extended_context -name "*.md" -type f
   
   # Check context references in agent
   grep -r "extended_context" ~/.claude/agents/
   
   # Validate context file contents
   ls -la ~/.claude/agents/claudio/extended_context/security/
   ```

2. **Reference Validation**
   ```bash
   # Check internal context references
   grep -r "\.\.\/" ~/.claude/agents/claudio/extended_context/
   
   # Validate reference paths
   find ~/.claude/agents/claudio/extended_context -name "*.md" -exec grep -l "broken-link" {} \;
   ```

**Solutions:**
```markdown
# Problem: Context reference mismatch
Agent Configuration:
extended_context: security-patterns, threat-analysis

Context Directory Structure:
extended_context/
├── security/           # Mismatch: expecting 'security-patterns'
└── threat-models/      # Mismatch: expecting 'threat-analysis'

Solution: Align references with actual structure
Option 1: Update agent configuration
extended_context: security, threat-models

Option 2: Restructure context directories
extended_context/
├── security-patterns/
└── threat-analysis/
```

### 4. Tool Assignment Validation Issues

**Issue:** Inappropriate tool assignments affecting agent functionality.

**Symptoms:**
- Agents failing to complete assigned tasks
- Security violations or permission errors
- Performance degradation
- Functionality gaps or redundancies

**Tool Assignment Analysis Framework:**
```markdown
# Tool Appropriateness Assessment
Agent: ${agent_name}
Primary Functions: ${functions_list}

Tool Analysis:
For each assigned tool:
1. Necessity Score (1-5): How essential is this tool?
2. Security Risk (1-5): What security risks does this introduce?
3. Usage Frequency (1-5): How often will this tool be used?
4. Alternative Options (1-5): Are there safer/better alternatives?

Tool Recommendations:
- High Necessity + Low Risk = Keep tool
- High Necessity + High Risk = Review security implications
- Low Necessity + High Risk = Remove tool
- Low Usage + Multiple Alternatives = Consider removal
```

**Common Tool Assignment Problems:**
```markdown
# Problem: Excessive tool permissions
Agent: simple-code-formatter
Assigned Tools: [Read, Write, Edit, MultiEdit, Bash, Task, WebFetch]
Actual Needs: [Read, Write, Edit]

Solution: Reduce to minimal required tools
Recommended Tools: [Read, Write, Edit]
Rationale: Formatting only needs file read/write capabilities

# Problem: Missing essential tools
Agent: comprehensive-security-scanner
Assigned Tools: [Read, Write]
Required Functions: File scanning, web lookups, report generation

Solution: Add necessary tools
Recommended Tools: [Read, Glob, Grep, WebFetch, Write]
Rationale: Security scanning requires file discovery and vulnerability database access
```

### 5. Performance Analysis Issues

**Issue:** Difficulty measuring or comparing agent performance.

**Solutions:**
```bash
# Performance Measurement Framework
# 1. Response Time Measurement
time claude-code /command-name test-parameters

# 2. Resource Usage Monitoring  
ps -o pid,ppid,%cpu,%mem,cmd -p $AGENT_PID

# 3. Memory Usage Tracking
/usr/bin/time -v claude-code /command-name test-parameters

# 4. Comparative Analysis
for agent in agent1 agent2 agent3; do
    echo "Testing $agent"
    time test-agent $agent
    echo "---"
done
```

## Cross-System Analysis Challenges

### 1. Architectural Inconsistencies

**Issue:** Different systems use incompatible architectural patterns.

**Solutions:**
- Create architectural mapping profiles
- Develop normalization frameworks
- Focus on functional equivalence rather than structural similarity
- Document architectural decision rationales

### 2. Context System Variations

**Issue:** Extended context systems organized differently across systems.

**Solutions:**
```markdown
# Context Normalization Strategy
System A Structure:
.claude/agents/extended_context/domain/topic.md

System B Structure:  
.claude/knowledge/domain/topic.md

Normalization Approach:
1. Map equivalent content across systems
2. Create abstraction layer for context access
3. Focus on content quality rather than organization
4. Document mapping relationships
```

## Evaluation Quality Issues

### 1. Scoring Consistency Problems

**Issue:** Different analysis sessions produce inconsistent scores.

**Solutions:**
```markdown
# Scoring Standardization Framework
1. Detailed Scoring Rubrics
   - Define specific criteria for each score level
   - Provide concrete examples for each rating
   - Use quantitative measures where possible

2. Calibration Exercises
   - Score same agents across multiple sessions
   - Compare scores with other analysts
   - Adjust rubrics based on consistency analysis

3. Automated Scoring Components
   - Use objective metrics where possible
   - Implement consistency checking algorithms
   - Flag significant scoring deviations for review
```

### 2. Bias in Agent Evaluation

**Issue:** Evaluation favors certain architectural patterns or systems.

**Solutions:**
- Implement multi-perspective evaluation
- Use diverse evaluation criteria
- Regular bias auditing processes
- Cross-validation with different evaluators

## Integration Testing Problems

### 1. Agent-Command Integration Failures

**Issue:** Agents work in isolation but fail when integrated with commands.

**Diagnosis:**
```bash
# Test integration points
# 1. Parameter passing
echo '{"test": "value"}' | agent-test parameter-passing

# 2. Context preservation
agent-test context-flow --verbose

# 3. Error handling
agent-test error-scenarios --simulate-failures
```

**Solutions:**
- Implement staged integration testing
- Create integration test suites
- Use mock services for testing
- Implement end-to-end validation

### 2. Performance Regression Issues

**Issue:** Agent performance degrades after updates or changes.

**Prevention and Detection:**
```markdown
# Performance Regression Framework
1. Baseline Performance Establishment
   - Measure performance before changes
   - Document performance characteristics
   - Create performance benchmarks

2. Continuous Performance Monitoring
   - Run performance tests after changes
   - Compare against established baselines
   - Alert on significant degradation

3. Performance Analysis Tools
   - Profile resource usage patterns
   - Identify performance bottlenecks
   - Track performance trends over time
```

## Troubleshooting Workflow

### Standard Diagnostic Process

1. **Issue Identification and Categorization**
   ```markdown
   Issue Category: [Configuration|Performance|Integration|Quality]
   Severity Level: [Critical|High|Medium|Low]
   Systems Affected: [List of affected systems]
   Symptoms Observed: [Detailed symptom list]
   ```

2. **Initial Diagnosis**
   ```bash
   # Quick checks for common issues
   # Agent configuration validation
   yaml-lint agent-config.md
   
   # Context accessibility check
   test-context-access agent-name
   
   # Basic functionality test
   quick-agent-test agent-name
   ```

3. **Deep Analysis**
   ```markdown
   # Systematic investigation
   1. Component Isolation Testing
      - Test agent in isolation
      - Test with minimal configuration
      - Test individual capabilities
   
   2. Integration Point Analysis
      - Test command-agent interface
      - Test context integration
      - Test tool accessibility
   
   3. Environmental Factors
      - Check system resources
      - Verify permissions
      - Test under different load conditions
   ```

4. **Solution Implementation and Validation**
   ```markdown
   # Solution approach
   1. Apply least disruptive fix first
   2. Test solution thoroughly
   3. Validate no regression introduced
   4. Document solution and prevention measures
   ```

### Emergency Response Procedures

**For Critical Agent Failures:**
1. **Immediate Response**
   - Switch to backup/fallback agents if available
   - Implement manual processes temporarily
   - Alert stakeholders of service impact

2. **Rapid Diagnosis**
   - Focus on most likely causes first
   - Use expedited diagnostic procedures
   - Engage additional expertise if needed

3. **Temporary Mitigation**
   - Implement workarounds to restore service
   - Reduce functionality if necessary to maintain stability
   - Monitor closely during mitigation period

4. **Permanent Resolution**
   - Develop comprehensive fix
   - Test thoroughly in non-production environment
   - Implement with careful monitoring

This troubleshooting guide ensures systematic resolution of agent analysis issues while building knowledge for prevention and continuous improvement.