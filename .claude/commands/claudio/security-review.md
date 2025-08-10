---
description: "Security review using STRIDE methodology with Mermaid diagram visualization"
argument-hint: "<target_path_or_instruction> [security_framework]"
---

Security review using STRIDE methodology with Mermaid diagram visualization for threat modeling and vulnerability assessment. Automatically integrated into Claudio discovery phase and available for standalone security analysis.

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

Use Task tool with subagent_type: "security-review-coordinator" to orchestrate security analysis through STRIDE methodology and generate Mermaid diagrams for threat visualization.

**CRITICAL**: This command uses parallel execution - multiple Task invocations in a SINGLE message to coordinate security analysis specialists for optimal performance.

**Integration**: Automatically included in Claudio discovery phase for project security assessment. Creates security documentation in `<target>/.claudio/docs/security/` with STRIDE analysis, threat models, vulnerability reports, and visual diagrams.

**Reference**: Uses security-review-coordinator and security agents for STRIDE methodology implementation.