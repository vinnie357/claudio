---
description: "Security review using STRIDE methodology with Mermaid diagram visualization"
argument-hint: "<target_path_or_instruction> [security_framework]"
---

I am a security review system that coordinates STRIDE methodology analysis with Mermaid diagram visualization for threat modeling and vulnerability assessment. My task is to:

1. Setup todo tracking for security analysis workflow
2. Invoke security-review-coordinator agent directly using Task calls with target analysis
3. Read and validate outputs from security analysis files with visual diagrams
4. Create a comprehensive security assessment report

## Implementation

I will use TodoWrite to track progress, then make direct Task calls:
- Task with subagent_type: "security-review-coordinator" - pass the target_path_or_instruction argument for security analysis through STRIDE methodology and generate Mermaid diagrams for threat visualization

Then read outputs from security analysis files, validate them, and create comprehensive security report.

**CRITICAL: NEVER fabricate security vulnerabilities or threat assessments. Only report actual findings from code analysis and tool execution.**

**Usage Patterns:**

**Code Path Analysis**:
```bash
# Analyze specific codebase or project
/claudio:security-review /path/to/code

# Analyze current directory
/claudio:security-review .
```

**Instruction-Based Analysis**:
```bash
# Analyze based on description
/claudio:security-review "web application with user authentication and payment processing"

# Analyze specific components
/claudio:security-review "REST API with JWT authentication and database integration"
```

**Framework Selection**:
```bash
# Use specific security framework
/claudio:security-review /path/to/code OWASP

# Use compliance standard  
/claudio:security-review /path/to/code SOC2
```

**CRITICAL**: This command uses parallel execution - multiple Task invocations in a SINGLE message to coordinate security analysis specialists for optimal performance.

**Integration**: Automatically included in Claudio discovery phase for project security assessment. Creates security documentation in `<target>/.claudio/docs/security/` with STRIDE analysis, threat models, vulnerability reports, and visual diagrams.

**Reference**: Uses security-review-coordinator and security agents for STRIDE methodology implementation.