---
description: "Research TaskFlow productivity app topics and create comprehensive documentation with complexity-aware analysis"
argument-hint: "<category> <topic> [--complexity=low|medium|high]"
---

Research TaskFlow productivity app topics and create comprehensive documentation with complexity assessment and depth-appropriate analysis.

**Document Creation:**
- **Direct Usage**: Creates TaskFlow research documents in `.claudio/research/<category>/<topic>/`
- **File Generation**: Produces both `overview.md` and `troubleshooting.md`
- **Structured Content**: Follows established templates for consistency
- **Quality Standards**: Includes authoritative sources and practical examples

**Features:**
- **Automatic Complexity Assessment**: Evaluates topic complexity (1-10 scale)  
- **Thinking Mode Selection**: Standard/Think/Ultrathink based on complexity
- **Manual Override**: Use `--complexity=<level>` to force thinking mode
- **Depth-Appropriate Analysis**: Multi-perspective analysis for complex topics
- **Document Templates**: Structured overview and troubleshooting guides

**TaskFlow-Specific Research Examples:**
```
/research mobile react-native-optimization
# Creates: .claudio/research/mobile/react-native-optimization/overview.md + troubleshooting.md

/research backend nodejs-microservices-patterns --complexity=high  
# Creates: .claudio/research/backend/nodejs-microservices-patterns/ (with advanced analysis)

/research synchronization realtime-websocket-sync --complexity=medium
# Creates: .claudio/research/synchronization/realtime-websocket-sync/ (with enhanced reasoning)

/research ai task-prediction-ml-models --complexity=high
# Creates: .claudio/research/ai/task-prediction-ml-models/ (with complex analysis)
```

**TaskFlow Research Categories:**
- **Mobile**: React Native performance, platform-specific optimizations, offline capabilities
- **Backend**: Node.js microservices, Express.js patterns, database optimization
- **Synchronization**: Real-time updates, WebSocket implementation, conflict resolution
- **AI**: Machine learning integration, task prediction, productivity analytics
- **Architecture**: Microservices patterns, event-driven design, scalability

**Output Structure:**
- `overview.md`: Comprehensive TaskFlow topic analysis with best practices and implementation patterns
- `troubleshooting.md`: Common issues, solutions, diagnostic tools, and escalation guidance

Task with subagent_type: "research-specialist" - pass the project_path argument to conduct comprehensive TaskFlow research and create structured documentation following established Claudio templates.