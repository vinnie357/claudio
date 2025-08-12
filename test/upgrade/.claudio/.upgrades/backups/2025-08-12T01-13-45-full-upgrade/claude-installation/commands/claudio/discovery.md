---
description: "Analyze project structure and technology stack"
argument-hint: "[target_path]"
version: "2.2.1"
---

Analyze project structure, technology stack, architecture patterns, and development requirements to create comprehensive discovery documentation. This command provides deep project understanding for development planning and technology decisions.

Use the discovery-orchestrator subagent to perform comprehensive project analysis including technology detection, architecture evaluation, and development workflow recommendations.

**Path Resolution**: Supports multiple ways to specify discovery target:
- **Direct Path**: `/claudio:discovery /path/to/project` (analyzes specified path)
- **Current Directory**: `/claudio:discovery` (analyzes current working directory)

This command creates detailed project analysis documentation to inform development decisions and project planning.
EOF < /dev/null