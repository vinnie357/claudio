---
description: "Research topics and create comprehensive documentation with complexity-aware analysis"
argument-hint: "<category> <topic> [--complexity=low|medium|high]"
---

Research a topic and create comprehensive documentation with complexity assessment and depth-appropriate analysis.

**Document Creation:**
- **Direct Usage**: Creates research documents in `.claudio/research/<category>/<topic>/`
- **File Generation**: Produces both `overview.md` and `troubleshooting.md`
- **Structured Content**: Follows established templates for consistency
- **Quality Standards**: Includes authoritative sources and practical examples

**Features:**
- **Automatic Complexity Assessment**: Evaluates topic complexity (1-10 scale)  
- **Thinking Mode Selection**: Standard/Think/Ultrathink based on complexity
- **Manual Override**: Use `--complexity=<level>` to force thinking mode
- **Depth-Appropriate Analysis**: Multi-perspective analysis for complex topics
- **Document Templates**: Structured overview and troubleshooting guides

**Examples:**
```
/research development docker-nodejs
# Creates: .claudio/research/development/docker-nodejs/overview.md + troubleshooting.md

/research infrastructure microservices-orchestration --complexity=high  
# Creates: .claudio/research/infrastructure/microservices-orchestration/ (with advanced analysis)

/research frontend react-performance --complexity=medium
# Creates: .claudio/research/frontend/react-performance/ (with enhanced reasoning)
```

**Output Structure:**
- `overview.md`: Comprehensive topic analysis with best practices and implementation patterns
- `troubleshooting.md`: Common issues, solutions, diagnostic tools, and escalation guidance

Use the research-specialist subagent to conduct comprehensive research and create structured documentation following established Claudio templates.