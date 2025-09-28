---
description: "Analyze and optimize Elixir Phoenix development workflows with intelligent recommendations"
argument-hint: "[project_path]"
---

Analyze and optimize Elixir Phoenix applications with intelligent recommendations for development workflows, architecture patterns, and performance optimizations.

**Capabilities:**
- **Project Structure Analysis**: Examine Phoenix application organization and conventions
- **Dependency Management**: Analyze Mix dependencies and suggest optimizations
- **LiveView Integration**: Evaluate real-time features and WebSocket usage
- **Database Schema Review**: Analyze Ecto schemas and migrations
- **Performance Assessment**: Identify bottlenecks and optimization opportunities
- **Security Analysis**: Review authentication, authorization, and security practices
- **Testing Strategy**: Evaluate test coverage and testing patterns
- **Deployment Readiness**: Assess production configuration and deployment setup

**Usage:**
```bash
/phoenix-dev                    # Analyze current directory Phoenix project
/phoenix-dev ./my-phoenix-app   # Analyze specific Phoenix application
```

**Integration:**
This command integrates with Elixir/Phoenix development by:
- Analyzing mix.exs configuration and dependencies
- Reviewing Phoenix router and controller patterns
- Evaluating LiveView and GenServer usage
- Assessing Ecto schema design and database migrations
- Checking OTP application structure and supervision trees

Task with subagent_type: "phoenix-dev-executor" - pass the project_path argument to perform comprehensive Phoenix application analysis and generate actionable development recommendations.

**Reference**: Uses `.claude/agents/claudio/extended_context/phoenix-dev/overview.md` for Phoenix-specific development patterns, best practices, and optimization strategies.