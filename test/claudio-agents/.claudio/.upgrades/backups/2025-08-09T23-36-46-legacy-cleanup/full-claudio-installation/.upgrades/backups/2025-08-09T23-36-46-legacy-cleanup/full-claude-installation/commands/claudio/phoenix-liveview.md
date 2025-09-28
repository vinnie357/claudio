---
description: "Specialized Phoenix LiveView development workflows with interactive testing and optimization"
argument-hint: "[project_path]"
---

Specialized command for Phoenix LiveView development workflows, focusing on interactive components, real-time testing, state management optimization, and performance tuning for LiveView applications.

**Capabilities:**
- **LiveView Component Analysis**: Examine mount/render patterns and state management
- **Interactive Testing**: Analyze LiveView testing strategies and DOM interactions
- **Performance Optimization**: Identify state update bottlenecks and rendering optimizations
- **Event Handling Review**: Evaluate phx-click, phx-change, and custom event patterns
- **Theme and UI Integration**: Assess dark mode, responsive design, and CSS integration
- **WebSocket Efficiency**: Analyze push_event usage and client-side JavaScript integration
- **Error Boundary Analysis**: Review error handling in interactive components
- **Load Testing Strategies**: Evaluate concurrent LiveView connection patterns

**Usage:**
```bash
/claudio:phoenix-liveview                    # Analyze current directory for LiveView patterns
/claudio:phoenix-liveview ./my-phoenix-app   # Analyze specific Phoenix LiveView application
/claudio:phoenix-liveview --focus-testing    # Focus on LiveView testing patterns
/claudio:phoenix-liveview --performance      # Focus on performance optimization
```

**LiveView-Specific Integration:**
This command provides specialized analysis for:
- LiveView mount/render lifecycle optimization
- Real-time state synchronization patterns
- Interactive component testing with Phoenix.LiveViewTest
- Client-server event coordination and error handling
- Performance monitoring for concurrent LiveView sessions
- Theme switching and dynamic UI update patterns

**Testing Focus:**
- LiveView functional testing patterns
- DOM interaction and event simulation
- Load testing for concurrent LiveView connections
- State management validation across reconnections
- Error boundary testing and recovery patterns

Use the claudio:phoenix-liveview-executor subagent to perform specialized LiveView analysis and generate actionable recommendations for interactive Phoenix applications.

**Reference**: Uses `.claude/agents/claudio/extended_context/liveview-development/overview.md` for LiveView-specific development patterns, testing strategies, and performance optimization techniques.