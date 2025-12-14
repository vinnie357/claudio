# Claudio Plugin Sources

This file documents the sources used to create the claudio plugin skills.

## Project Discovery Skill

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Systematic project analysis methodology for understanding codebases
- **Key Topics**: Technology stack detection, architecture patterns, dependency analysis, integration opportunities
- **Source Material**: Derived from claudio extended_context/workflow/discovery/

## Requirements Skill

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Product Requirements Document (PRD) creation patterns
- **Key Topics**: Business objectives, success criteria, feature specifications, technical requirements
- **Source Material**: Derived from claudio extended_context/workflow/prd/

## Planning Skill

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Implementation planning with phases and task breakdown
- **Key Topics**: Phase organization, dependency mapping, resource allocation, milestone definition
- **Source Material**: Derived from claudio extended_context/workflow/planning/

## Task Breakdown Skill

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Converting plans into executable task structures
- **Key Topics**: Task decomposition, acceptance criteria, agent coordination, context assignment
- **Source Material**: Derived from claudio extended_context/workflow/task/

## Research Methodology Skill

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Complexity-aware research with web and documentation analysis
- **Key Topics**: Complexity assessment (low/medium/high), source validation, documentation synthesis
- **Source Material**: Derived from claudio extended_context/research/

## Documentation Skill

### Technical Writing Best Practices
- **URL**: https://developers.google.com/tech-writing
- **Purpose**: Guide for writing clear, comprehensive technical documentation
- **Key Topics**: README files, API docs, developer guides, user guides

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Parallel documentation generation with specialized agents
- **Key Topics**: README creation, API documentation, developer guides, user guides
- **Source Material**: Derived from claudio extended_context/documentation/

## Code Quality Skill

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Comprehensive code quality assessment through automated analysis
- **Key Topics**: Linting, formatting, test coverage, complexity metrics, maintainability
- **Framework Support**: JavaScript/TypeScript (ESLint, Jest), Python (pylint, pytest), Rust (clippy, cargo test), Elixir (credo, ExUnit), Go (golint, go test)
- **Source Material**: Derived from claudio extended_context/development/quality/

## Security STRIDE Skill

### STRIDE Threat Modeling
- **URL**: https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats
- **Purpose**: Microsoft's STRIDE threat classification framework
- **Date Accessed**: 2025-12-13
- **Key Topics**: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege

### OWASP Threat Modeling
- **URL**: https://owasp.org/www-community/Threat_Modeling
- **Purpose**: Threat modeling best practices and methodologies
- **Key Topics**: Asset identification, threat scenarios, risk assessment, mitigation strategies

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: STRIDE-based security analysis with Mermaid diagram visualization
- **Key Topics**: Threat modeling, vulnerability assessment, security architecture, trust boundaries
- **Source Material**: Derived from claudio security review agents

## Command Patterns Skill

### Claude Code Documentation
- **URL**: https://docs.anthropic.com/en/docs/agents-and-tools/claude-code
- **Purpose**: Official Claude Code slash command patterns and best practices
- **Key Topics**: Command frontmatter, Task invocation, TodoWrite integration, parallel execution

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Claude Code command development patterns
- **Key Topics**: Frontmatter structure, argument extraction, parallel Task calls, output validation
- **Source Material**: Derived from claudio extended_context/meta/claude/commands/

## Agent Patterns Skill

### Claude Code Documentation
- **URL**: https://docs.anthropic.com/en/docs/agents-and-tools/claude-code
- **Purpose**: Official Claude Code agent architecture patterns
- **Key Topics**: Agent structure, tool selection, model assignment, extended context integration

### Internal Development
- **Created**: 2025-12-13
- **Purpose**: Claude Code agent architecture and design patterns
- **Key Topics**: Single-purpose specialist, workflow orchestrator, context-aware adapter, model selection
- **Source Material**: Derived from claudio extended_context/agent-analysis/

## Plugin Information

- **Name**: claudio
- **Version**: 2.0.0
- **Description**: Project discovery, planning, and quality analysis system with parallel agents
- **Skills**: 10 skills covering project analysis, planning, documentation, security, and Claude Code patterns
- **Repository**: https://github.com/vinnie357/claudio
- **Created**: 2025-12-13
