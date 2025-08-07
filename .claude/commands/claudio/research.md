---
description: "Research topics with complexity-aware thinking modes and generate specialized agent prompts"
argument-hint: "<category> <topic> [--complexity=low|medium|high]"
---

Research a topic and generate a specialized agent prompt with complexity assessment and depth-appropriate analysis.

**Features:**
- **Automatic Complexity Assessment**: Evaluates topic complexity (1-10 scale)  
- **Thinking Mode Selection**: Standard/Think/Ultrathink based on complexity
- **Manual Override**: Use `--complexity=<level>` to force thinking mode
- **Depth-Appropriate Analysis**: Multi-perspective analysis for complex topics

**Examples:**
```
/research development docker-nodejs
/research infrastructure microservices-orchestration --complexity=high
/research frontend react-performance --complexity=medium
```

Use the claudio:research-specialist subagent to conduct comprehensive research and create expert agent prompts following established templates.