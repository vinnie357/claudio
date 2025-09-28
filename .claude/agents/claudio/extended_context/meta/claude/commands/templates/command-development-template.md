# Command Development Template

## Complete Command Structure

ALL new commands MUST follow this exact pattern:

```markdown
---
description: "Command description with clear purpose"
argument-hint: "[input]"
---

I am a [command purpose] that [brief description]. My task is to:

1. Setup todo tracking for the workflow
2. Invoke specialized agents directly using parallel Task calls with custom arguments
3. Read and validate outputs from [expected output files]
4. Create a comprehensive [validation/summary] report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "agent1" - pass the input-value argument for processing
- Task with subagent_type: "agent2" - pass the input-value argument for processing
- Task with subagent_type: "agent3" - pass the input-value argument for processing

Then read outputs from [output files], validate them, and create complete report.

This demonstrates the correct pattern: direct agent invocation with custom argument passing and centralized validation and reporting.
```

## Required Elements

### Frontmatter
- **description**: Clear purpose statement in quotes
- **argument-hint**: Expected input format in brackets

### Introduction
- Clear statement of command purpose
- Brief description of what it accomplishes
- Numbered list of high-level tasks

### Implementation Section
- Always include "## Implementation" header
- Start with TodoWrite progress tracking statement
- List parallel Task calls with specific subagent_type references
- Include output validation and reporting steps
- End with pattern explanation

### Critical Requirements
- **TodoWrite first**: Always setup todo tracking before Task calls
- **"make parallel Task calls"**: Explicit parallel execution statement
- **Multiple Task calls**: List each agent with custom arguments
- **Custom arguments**: Pass meaningful context to each agent
- **Output validation**: Read and validate actual outputs
- **Complete report**: Centralized result compilation

## Example Implementation

```markdown
---
description: "Analyze project security posture and generate comprehensive security report"
argument-hint: "[project-path]"
---

I am a security analysis coordinator that evaluates project security across multiple dimensions. My task is to:

1. Setup todo tracking for the security analysis workflow
2. Invoke specialized security agents using parallel Task calls with project context
3. Read and validate outputs from security analysis reports
4. Create a comprehensive security assessment report

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:
- Task with subagent_type: "vulnerability-assessment-specialist" - scan project for security vulnerabilities and exposures
- Task with subagent_type: "security-architecture-analyst" - evaluate security design and architecture patterns  
- Task with subagent_type: "security-threat-modeler" - perform STRIDE-based threat analysis and risk assessment

Then read outputs from security reports, validate findings, and create consolidated security assessment.
```

## Anti-Patterns (NEVER USE)
- Missing frontmatter description or argument-hint
- Coordinator agents that call other agents (commands coordinate directly)
- Sequential execution when parallel is possible
- Missing TodoWrite progress tracking
- Generic arguments or no argument passing
- Assuming outputs without validation
- Incorrect subagent_type references that don't match actual agent files
- Inconsistent agent naming (must use lowercase-hyphen format)