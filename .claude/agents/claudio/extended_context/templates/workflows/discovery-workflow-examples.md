# Discovery Workflow Examples

This document provides comprehensive examples of discovery workflow patterns used throughout the Claudio system.

## Basic Project Discovery Workflow

### Simple Discovery Pattern
```markdown
## Discovery Implementation

I will use TodoWrite to track progress, then analyze the project:

Use TodoWrite to start project discovery analysis.

1. **Project Structure Analysis**: 
   Examine root directory files, identify main language(s) and frameworks, map directory structure and conventions

2. **Technology Stack Detection**:
   Parse package/dependency files, identify development tools and configurations, detect testing frameworks and CI/CD setup

3. **MCP Recommendations**:
   Based on discovered technologies, recommend relevant MCPs for enhanced development workflow

Use TodoWrite to complete project discovery analysis.

Generate comprehensive discovery report with technology identification, setup instructions, and MCP recommendations.
```

## Parallel Discovery Workflow (Current System)

### Multi-Analyzer Pattern
```markdown
## Enhanced Discovery Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

Use TodoWrite to start comprehensive project discovery.

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "discovery-structure-analyzer" - pass the project path for directory and file organization analysis
- Task with subagent_type: "discovery-tech-analyzer" - pass the project path for technology stack and dependency analysis
- Task with subagent_type: "discovery-architecture-analyzer" - pass the project path for design patterns and architectural analysis
- Task with subagent_type: "discovery-integration-analyzer" - pass the project path for tool integration and MCP recommendations

Then read outputs from all analyzers, validate completeness, and use discovery-consolidator to create unified discovery report.

Use TodoWrite to complete comprehensive project discovery.

**Performance Benefits**: 4x faster analysis with parallel specialist expertise, comprehensive coverage in ~30-45 seconds vs 2-3 minutes sequential
```

## Workflow Variations by Project Type

### Node.js/React Project Discovery
```markdown
**Technology-Specific Discovery Pattern**:

1. **Package Analysis**: Focus on package.json, yarn.lock/package-lock.json for dependency management
2. **Build System Detection**: Identify webpack, vite, or create-react-app configurations
3. **Testing Setup**: Look for Jest, Cypress, or Testing Library configurations
4. **Development Tools**: Detect ESLint, Prettier, TypeScript configurations
5. **MCP Recommendations**: Suggest database MCPs (postgres, mongodb), deployment MCPs (vercel, netlify), development MCPs (github)

**Specialized Agents Used**:
- discovery-tech-analyzer: Enhanced with Node.js/React pattern recognition
- discovery-integration-analyzer: Focused on JavaScript ecosystem MCPs
```

### Python Project Discovery
```markdown
**Python-Specific Discovery Pattern**:

1. **Environment Analysis**: Check for requirements.txt, pyproject.toml, Pipfile, environment.yml
2. **Framework Detection**: Identify Django, Flask, FastAPI, or other web frameworks
3. **Testing and Quality**: Look for pytest, unittest, flake8, black, mypy configurations
4. **Database Integration**: Detect SQLAlchemy, Django ORM, or other database tools
5. **MCP Recommendations**: Suggest postgres MCP for databases, docker for containerization

**Specialized Focus Areas**:
- Virtual environment setup and dependency management
- Python-specific development workflow patterns
- Framework-specific configuration and best practices
```

### Elixir/Phoenix Project Discovery
```markdown
**Elixir-Specific Discovery Pattern**:

1. **Mix Project Analysis**: Examine mix.exs for dependencies and project configuration
2. **Phoenix Framework Detection**: Identify Phoenix version and configuration patterns
3. **Database Setup**: Check for Ecto configurations and migration patterns
4. **Testing Framework**: Analyze ExUnit test setup and coverage configuration
5. **LiveView Detection**: Identify Phoenix LiveView usage patterns

**Phoenix-Specific Recommendations**:
- PostgreSQL MCP for database development
- Docker MCP for deployment containerization
- Monitoring MCPs for production Phoenix applications
```

## Discovery Output Patterns

### Standard Discovery Report Structure
```markdown
# Project Discovery Report

## Executive Summary
- **Project Type**: [Web Application/Library/CLI Tool/etc.]
- **Primary Technologies**: [Main languages and frameworks]
- **Development Maturity**: [Established/Growing/New]
- **Recommended Workflow**: [Suggested Claudio workflow approach]

## Technology Stack Analysis
### Frontend Technologies
- Framework: [React 18.2.0/Vue 3.x/Angular/etc.]
- Build System: [Vite/Webpack/Parcel]
- Styling: [CSS-in-JS/SCSS/Tailwind/etc.]

### Backend Technologies  
- Runtime: [Node.js/Python/Elixir/etc.]
- Framework: [Express/Django/Phoenix/etc.]
- Database: [PostgreSQL/MongoDB/etc.]

### Development Infrastructure
- Package Manager: [npm/yarn/pip/mix]
- Testing Framework: [Jest/pytest/ExUnit]
- Quality Tools: [ESLint/Prettier/Black/Credo]
- CI/CD: [GitHub Actions/Jenkins/GitLab CI]

## MCP Integration Recommendations
### Essential MCPs
1. **Database MCP**: [postgres/mysql/mongodb] for database development
2. **Cloud MCP**: [aws/vercel/heroku] for deployment and hosting  
3. **Development MCP**: [docker/github] for containerization and repository management

### Workflow Enhancement MCPs
- [Additional MCPs based on specific project needs]

## Claudio Workflow Integration
### Recommended Commands
- `/claudio:discovery` - Already completed
- `/claudio:prd` - Create requirements documentation
- `/claudio:plan` - Implementation planning
- `/claudio:code-quality` - Quality assessment with detected tools

### Project-Specific Customizations
- [Technology-specific workflow adjustments]
- [Framework-specific command optimizations]
```

## Error Handling Patterns

### Incomplete Discovery Handling
```markdown
**Graceful Degradation Pattern**:

When discovery analysis encounters limitations:

1. **Partial Analysis Reporting**: 
   - Report successful analysis areas clearly
   - Document analysis limitations and gaps
   - Provide confidence levels for each discovery area

2. **Fallback Strategies**:
   - Use generic patterns when specific detection fails
   - Provide manual verification steps for uncertain findings
   - Recommend follow-up analysis for unclear areas

3. **User Guidance**:
   - Clear instructions for providing missing information
   - Suggestions for improving project discoverability
   - Alternative analysis approaches when primary methods fail
```

### Technology Stack Conflicts
```markdown
**Conflict Resolution Pattern**:

When multiple technologies or conflicting patterns are detected:

1. **Priority-Based Resolution**:
   - Primary technology determined by majority of indicators
   - Secondary technologies noted with appropriate context
   - Framework precedence based on configuration file presence

2. **Multi-Technology Support**:
   - Document all detected technologies with usage context
   - Provide recommendations for each technology stack
   - Suggest workflow approaches for multi-language projects

3. **User Clarification**:
   - Highlight ambiguous findings for user confirmation
   - Provide questions to resolve technology priority
   - Offer manual override options for incorrect detections
```

## Performance Optimization Patterns

### Incremental Discovery
```markdown
**Large Project Optimization**:

For projects with 1000+ files:

1. **Sampling Strategy**: Analyze representative file samples rather than exhaustive scanning
2. **Priority-Based Analysis**: Focus on configuration files and key directories first
3. **Progressive Discovery**: Start with high-confidence patterns, expand as needed
4. **Caching Strategy**: Cache analysis results for subsequent discovery runs
```

### Parallel Analysis Coordination
```markdown
**Coordination Pattern for Parallel Analyzers**:

1. **Analyzer Independence**: Each analyzer operates on non-overlapping domains
2. **Resource Management**: Distribute file access across analyzers to minimize contention
3. **Result Aggregation**: Consolidator agent synthesizes findings without duplication
4. **Error Isolation**: Individual analyzer failures don't impact other analyses
```

## Discovery Integration with Other Workflows

### PRD Workflow Integration
```markdown
**Discovery → PRD Pattern**:

Discovery outputs that inform PRD creation:
- **Technology Constraints**: Framework limitations and capabilities
- **Architecture Patterns**: Existing patterns to maintain or evolve
- **Integration Points**: Available APIs and external service connections
- **Development Practices**: Current testing, deployment, and quality practices
```

### Planning Workflow Integration  
```markdown
**Discovery → Planning Pattern**:

Discovery insights for implementation planning:
- **Technical Architecture**: Existing structure to build upon or refactor
- **Tool Integration**: Available development and deployment tools
- **Performance Baseline**: Current performance characteristics for improvement planning
- **Resource Requirements**: Development environment and infrastructure needs
```

These discovery workflow patterns provide structured approaches for understanding projects and generating actionable insights for development teams.