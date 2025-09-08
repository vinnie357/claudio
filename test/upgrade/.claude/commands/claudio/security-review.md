---
description: "TaskFlow security review using STRIDE methodology with Mermaid diagram visualization"
argument-hint: "<target_path_or_instruction> [security_framework]"
---

I am a TaskFlow security review system that coordinates STRIDE methodology analysis with Mermaid diagram visualization for threat modeling and vulnerability assessment. My task is to:

1. Setup todo tracking for TaskFlow security analysis workflow
2. Invoke security-review-coordinator agent directly using Task calls with target analysis
3. Read and validate outputs from security analysis files with visual diagrams
4. Create a comprehensive TaskFlow security assessment report

## Implementation

I will use TodoWrite to track progress, then make direct Task calls:
- Task with subagent_type: "security-review-coordinator" - pass the target_path_or_instruction argument for TaskFlow security analysis through STRIDE methodology and generate Mermaid diagrams for threat visualization

Then read outputs from security analysis files, validate them, and create comprehensive TaskFlow security report.

**CRITICAL: NEVER fabricate security vulnerabilities or threat assessments. Only report actual findings from TaskFlow code analysis and tool execution.**

**TaskFlow-Specific Security Analysis:**
- **Mobile Security**: React Native app security, secure storage, device-specific vulnerabilities
- **API Security**: Node.js microservices security, JWT authentication, API gateway protection
- **Data Security**: PostgreSQL/MongoDB security, data encryption, synchronization security
- **Real-time Security**: WebSocket security, message integrity, connection authentication

**Usage Patterns:**

**TaskFlow Code Path Analysis**:
```bash
# Analyze TaskFlow codebase
/claudio:security-review /path/to/taskflow
# Analyze current TaskFlow directory
/claudio:security-review .
```

**TaskFlow Instruction-Based Analysis**:
```bash
# Analyze TaskFlow architecture description
/claudio:security-review "React Native productivity app with Node.js microservices, real-time sync, and AI features"
# Analyze TaskFlow components
/claudio:security-review "mobile task management app with offline capabilities and cloud synchronization"
```

**Framework Selection**:
```bash
# Use OWASP framework for TaskFlow
/claudio:security-review /path/to/taskflow OWASP
# Use mobile-specific security standards
/claudio:security-review /path/to/taskflow MOBILE-SEC
```

**CRITICAL**: This command uses parallel execution - multiple Task invocations in a SINGLE message to coordinate TaskFlow security analysis specialists for optimal performance.

**Integration**: Automatically included in TaskFlow Claudio discovery phase for project security assessment. Creates security documentation in `<target>/.claudio/docs/security/` with STRIDE analysis, threat models, vulnerability reports, and visual diagrams.

**Reference**: Uses security-review-coordinator and security agents for STRIDE methodology implementation optimized for TaskFlow's React Native and Node.js architecture.