---
description: "Comprehensive security review using STRIDE methodology with Mermaid diagram visualization"
argument-hint: "<target_path_or_instruction> [security_framework]"
---

Comprehensive security review using STRIDE methodology with Mermaid diagram visualization for threat modeling and vulnerability assessment. Automatically integrated into Claudio discovery phase and available for standalone security analysis.

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

Use the claudio:security-review-coordinator subagent to orchestrate comprehensive security analysis through STRIDE methodology and generate Mermaid diagrams for threat visualization.

**Integration**: Automatically included in Claudio discovery phase for comprehensive project security assessment. Creates structured security documentation in `<target>/.claudio/docs/security/` with STRIDE analysis, threat models, vulnerability reports, and visual diagrams.

**Reference**: Uses `.claude/agents/claudio/prompts/security-review/claude.md` for comprehensive security analysis templates and STRIDE methodology implementation.