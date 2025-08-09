# Command Analysis Troubleshooting Guide

## Overview

This guide provides solutions for common issues encountered during command analysis and evaluation processes. It covers both technical problems and methodological challenges.

## Common Analysis Issues

### 1. Configuration Parsing Problems

**Issue:** Command YAML frontmatter fails to parse correctly.

**Symptoms:**
- "Invalid YAML syntax" errors
- Missing required fields not detected
- Incorrect argument hint parsing

**Diagnosis Steps:**
1. Check YAML syntax with online validator
2. Verify required fields are present
3. Check for invisible characters or encoding issues
4. Validate quotes and escape sequences

**Solutions:**
```yaml
# Problem: Missing quotes around complex descriptions
description: Generate report for CI/CD pipeline status

# Solution: Properly quoted description  
description: "Generate report for CI/CD pipeline status"

# Problem: Invalid argument hint syntax
argument-hint: <required> [optional --flag]

# Solution: Consistent bracket usage
argument-hint: "<required> [optional] [--flag]"
```

**Prevention:**
- Use YAML linters in development process
- Implement automated validation
- Create command templates with correct structure
- Regular syntax checks during command updates

### 2. Agent Reference Resolution Failures

**Issue:** Commands reference agents that don't exist or aren't accessible.

**Symptoms:**
- "Agent not found" errors during analysis
- Commands fail to execute properly
- Integration tests fail

**Diagnosis Steps:**
1. Verify agent file exists at expected path
2. Check agent configuration syntax
3. Validate agent tool permissions
4. Test agent accessibility from command context

**Solutions:**
```markdown
# Problem: Incorrect agent reference
Use the security-analyzer agent to scan for vulnerabilities.

# Diagnosis: Check if agent exists
ls ~/.claude/agents/security-analyzer.md

# Solution 1: Correct agent name
Use the security-scanner agent to scan for vulnerabilities.

# Solution 2: Create missing agent if legitimately needed
# Create ~/.claude/agents/security-analyzer.md with proper configuration
```

**Prevention:**
- Maintain agent registry/catalog
- Implement automated reference validation
- Use standardized agent naming conventions
- Regular agent availability checks

### 3. Integration Quality Assessment Failures

**Issue:** Unable to properly evaluate command-agent integration quality.

**Symptoms:**
- Integration tests hang or timeout
- Inconsistent integration scoring
- Missing context preservation evaluation

**Diagnosis Steps:**
1. Check agent response times
2. Verify context passing mechanisms
3. Test with minimal parameter sets
4. Check for resource conflicts

**Solutions:**
```markdown
# Problem: Integration test timeout
# Check agent performance characteristics
# Implement timeout handling in tests

# Solution: Staged integration testing
1. Test basic connectivity first
2. Test parameter passing with simple cases
3. Test context preservation with incremental complexity
4. Test error handling scenarios last
```

**Prevention:**
- Implement staged testing approaches
- Set appropriate timeouts for different operations
- Create agent performance baselines
- Regular integration health checks

## Cross-System Analysis Challenges

### 1. Inconsistent Command Structures

**Issue:** Commands across systems use different structural patterns.

**Symptoms:**
- Comparative analysis produces skewed results
- Best practice identification is inconsistent
- Standardization recommendations are unclear

**Diagnosis:**
1. Catalog structural variations across systems
2. Identify core vs. optional structural elements
3. Document system-specific conventions
4. Map equivalent functionalities

**Solutions:**
- Create structural normalization mapping
- Develop system-specific analysis profiles
- Use weighted scoring based on system conventions
- Implement flexible comparison frameworks

**Example Normalization:**
```markdown
# System A: Uses tags for categorization
tags: ["deployment", "ci-cd", "automation"]

# System B: Uses categories field  
category: "deployment"
subcategory: "ci-cd"

# Normalization: Map both to standard category system
normalized-categories: ["deployment", "ci-cd", "automation"]
```

### 2. Agent Capability Mismatches

**Issue:** Similar commands use agents with different capabilities across systems.

**Symptoms:**
- Unfair performance comparisons
- Incorrect capability assessments
- Misleading optimization recommendations

**Solutions:**
- Create agent capability equivalence mapping
- Normalize comparisons based on available tools
- Account for system architectural differences
- Focus on outcome quality rather than implementation details

### 3. Context System Variations

**Issue:** Different systems use varying extended context architectures.

**Solutions:**
- Create context system abstraction layer
- Map equivalent context resources across systems
- Normalize context access patterns
- Account for context richness in evaluations

## Performance Analysis Problems

### 1. Inconsistent Performance Metrics

**Issue:** Performance measurements vary due to environmental factors.

**Solutions:**
- Establish baseline testing environments
- Use relative performance comparisons
- Average multiple measurement runs
- Account for system load variations
- Implement performance trend analysis

### 2. Resource Usage Assessment Difficulties

**Issue:** Hard to measure true resource consumption of commands.

**Solutions:**
```bash
# Implement resource monitoring wrappers
time -v /command-name args  # Detailed resource usage
ps -o pid,ppid,%cpu,%mem,cmd -p $COMMAND_PID  # Process monitoring
```

- Use system monitoring tools
- Implement resource usage logging
- Create resource usage benchmarks
- Monitor long-term resource trends

## Data Collection Issues

### 1. Incomplete Command Discovery

**Issue:** Analysis misses commands due to discovery problems.

**Symptoms:**
- Lower than expected command counts
- Missing commands in comparative analysis
- Incomplete system coverage

**Solutions:**
```bash
# Comprehensive command discovery
find ~/.claude/commands -name "*.md" -type f
grep -r "description:" ~/.claude/commands/
ls -la ~/.claude/commands/ | grep -E "\.(md|yaml|yml)$"
```

- Implement multiple discovery methods
- Use recursive directory scanning
- Check for non-standard file extensions
- Validate discovery completeness

### 2. Context Access Problems

**Issue:** Unable to access extended context or documentation.

**Solutions:**
- Verify context directory permissions
- Check relative path resolution
- Implement fallback documentation sources
- Create context availability validation

## Scoring and Evaluation Issues

### 1. Inconsistent Scoring Across Analysts

**Issue:** Different analysis sessions produce different scores for same commands.

**Solutions:**
- Implement standardized scoring rubrics
- Use automated scoring where possible
- Create scoring validation processes
- Document scoring decision rationales
- Regular scorer calibration exercises

### 2. Bias in Cross-System Comparisons

**Issue:** Analysis favors systems with certain architectural patterns.

**Solutions:**
- Implement bias detection mechanisms
- Use multiple analysis perspectives
- Weight scores based on system context
- Regular bias auditing processes
- Diverse analysis team composition

## Reporting and Communication Issues

### 1. Report Accessibility Problems

**Issue:** Analysis reports are hard to understand or act upon.

**Solutions:**
- Use consistent report templates
- Implement executive summary sections
- Provide actionable recommendations
- Include specific examples and evidence
- Create different report formats for different audiences

### 2. Recommendation Implementation Guidance

**Issue:** Recommendations are too vague to implement effectively.

**Solutions:**
```markdown
# Vague recommendation:
"Improve command documentation"

# Specific recommendation:
"Add usage examples to command description, include parameter explanations for --format and --output options, create troubleshooting section for common authentication errors"
```

- Provide specific, actionable recommendations
- Include implementation priorities
- Estimate implementation effort
- Provide code examples where appropriate
- Link to relevant best practice documentation

## Troubleshooting Workflow

### Standard Diagnostic Process

1. **Issue Identification**
   - Clearly define the problem
   - Gather error messages and symptoms
   - Identify affected systems/commands

2. **Initial Diagnosis**
   - Check common causes first
   - Verify basic functionality
   - Review recent changes

3. **Deep Diagnosis**
   - Use diagnostic tools and scripts
   - Check system logs and traces
   - Isolate variables systematically

4. **Solution Implementation**
   - Apply least invasive solution first
   - Test solution thoroughly
   - Document resolution process

5. **Prevention Planning**
   - Identify root cause
   - Implement prevention measures
   - Update processes and documentation

### Emergency Response Procedures

**For Critical Analysis Failures:**
1. Switch to manual analysis processes
2. Use simplified evaluation criteria
3. Focus on highest-priority commands
4. Implement parallel analysis approaches
5. Escalate to system administrators if needed

**For Data Integrity Issues:**
1. Stop analysis processes immediately
2. Backup current analysis state
3. Validate data integrity
4. Restore from known good state if necessary
5. Implement additional data validation

This troubleshooting guide helps ensure reliable, consistent command analysis processes across different systems and scenarios.