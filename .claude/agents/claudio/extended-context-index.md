# Extended Context Categories Index

**Purpose**: Tracks extended context categories, their usage patterns, and agent dependencies  
**Total Categories**: 7 main categories with 30+ subcategories  
**Installation Logic**: Dynamic creation based on installed agent requirements  
**Last Updated**: 2025-09-06

## Category Overview

Extended context provides specialized knowledge for agents based on project needs. Categories are created dynamically during installation based on which agents are installed and their specific requirements.

### Main Categories Structure

| Category | Type | Subcategories | Primary Usage | Installation Trigger |
|----------|------|---------------|---------------|---------------------|
| `workflow/` | User | discovery, prd, planning, task | Core workflow agents | Core workflow commands installed |
| `development/` | User | code_quality, design, testing, react-hooks, postgresql-optimization | Development analysis agents | Analysis & development tools installed |
| `documentation/` | User | overview | Documentation generation | Documentation commands installed |
| `research/` | User | overview | Research methodology | Research commands installed |
| `infrastructure/` | System | installation, upgrade | System operations | System commands (install/upgrade) |
| `command-analysis/` | User | architecture, evaluation | Claude Code command analysis | Claude SDK tools installed |
| `agent-analysis/` | User | architecture-patterns, evaluation-framework, troubleshooting, context-integration | Claude Code agent analysis | Claude SDK tools installed |

## Category Details

### workflow/ (User Context)
**Purpose**: Core project workflow execution contexts  
**Installation**: Created when core workflow commands are installed  
**Agents Using**: discovery-agent, prd-agent, plan-agent, task-agent, claudio-coordinator-agent

#### Subcategories:
- **`workflow/discovery/`**: Project discovery and analysis methodology
- **`workflow/prd/`**: Product Requirements Document creation patterns  
- **`workflow/planning/`**: Implementation planning structures and templates
- **`workflow/task/`**: Task breakdown and execution contexts

### development/ (User Context)
**Purpose**: Development-specific analysis and tooling contexts  
**Installation**: Created when development analysis tools are installed  
**Agents Using**: code-quality-analyzer, design-analyzer, test-command-generator, project-test-runner

#### Subcategories:
- **`development/code_quality/`**: Code analysis standards and linting patterns
- **`development/design/`**: UI/UX design analysis and accessibility standards
- **`development/testing/`**: Testing frameworks and project-specific test strategies
- **`development/react-hooks/`**: React-specific hook patterns and best practices (technology-specific)
- **`development/postgresql-optimization/`**: Database optimization patterns (technology-specific)

### documentation/ (User Context)
**Purpose**: Documentation generation standards and templates  
**Installation**: Created when documentation commands are installed  
**Agents Using**: documentation-coordinator, research-specialist

#### Subcategories:
- **`documentation/overview/`**: Documentation structure and generation patterns

### research/ (User Context)  
**Purpose**: Research methodology and content creation standards  
**Installation**: Created when research commands are installed  
**Agents Using**: research-specialist

#### Subcategories:
- **`research/overview/`**: Research methodology and quality standards

### infrastructure/ (System Context)
**Purpose**: System installation and maintenance operations  
**Installation**: Created for system operations (not user installations)  
**Agents Using**: install-full-workflow-agent, upgrade-orchestrator-agent

#### Subcategories:
- **`infrastructure/installation/`**: Installation procedures and validation patterns
- **`infrastructure/upgrade/`**: Upgrade procedures and safety mechanisms

### command-analysis/ (User Context)
**Purpose**: Claude Code command evaluation and improvement  
**Installation**: Created when Claude SDK tools are installed  
**Agents Using**: claudio-claude-sdk-architect, claude-commands-analyst

#### Subcategories:
- **`command-analysis/`**: Command structure analysis and evaluation frameworks

### agent-analysis/ (User Context)
**Purpose**: Claude Code agent architecture and integration analysis  
**Installation**: Created when Claude SDK tools are installed  
**Agents Using**: claudio-claude-sdk-architect, claudio-claude-subagents-analyst

#### Subcategories:
- **`agent-analysis/architecture-patterns/`**: Agent design patterns and coordination strategies
- **`agent-analysis/evaluation-framework/`**: Agent quality assessment methodologies
- **`agent-analysis/troubleshooting/`**: Agent integration debugging and problem resolution
- **`agent-analysis/context-integration/`**: Extended context usage and optimization patterns

## Dynamic Installation Logic

### Category Creation Rules
1. **Analyze Installed Agents**: Check which agents are being installed
2. **Map Context Requirements**: Identify extended_context dependencies from agent files
3. **Create Required Categories**: Generate only needed category structures  
4. **Skip Unused Categories**: Avoid creating comprehensive structures for unused contexts
5. **Technology-Specific Contexts**: Generate based on project discovery results

### Installation Modes Impact

#### Commands-Only Installation
**Creates**: Minimal context based on command requirements
- Usually: workflow/, development/, documentation/ (if respective commands installed)
- Typically: 2-4 categories created

#### Full Workflow Installation  
**Creates**: All contexts needed by installed workflow and system agents
- Usually: workflow/, development/, documentation/, research/
- Typically: 4-6 categories created

#### System Operations
**Creates**: System-specific contexts for internal operations
- Always: infrastructure/ (for install/upgrade agents)
- System contexts not replicated to user installations

### Technology-Specific Context Generation

During installation, the discovery process may create technology-specific subcategories:

#### Framework-Specific Contexts
- **React Projects**: `development/react-hooks/`, `development/state-management/`
- **Database Projects**: `development/postgresql-optimization/`, `development/database-patterns/`
- **Testing Frameworks**: `development/jest-patterns/`, `development/testing-strategies/`
- **Language-Specific**: `development/typescript-patterns/`, `development/python-best-practices/`

#### Project-Specific Integration Contexts
- **API Integration**: `development/api-patterns/`, `research/api-documentation/`
- **Security Patterns**: `development/security-practices/`, `research/security-standards/`
- **Performance**: `development/performance-optimization/`, `research/performance-monitoring/`

## Agent Dependencies by Category

### High-Usage Categories (Created in 80%+ installations)
- **workflow/**: Required by core workflow agents (discovery, prd, plan, task)
- **development/**: Required by analysis tools (code-quality, design, test tools)
- **documentation/**: Required by documentation generation tools

### Medium-Usage Categories (Created in 40-60% installations)
- **research/**: Required when research commands are installed
- **command-analysis/ + agent-analysis/**: Required when Claude SDK tools are installed

### Low-Usage Categories (Created in <20% installations)
- **infrastructure/**: Only for system operations, not user installations
- **Technology-Specific**: Only when specific technologies are detected

## Maintenance and Validation

### Context Quality Validation
- **extended-context-content-validator**: Validates content quality and customization appropriateness
- **extended-context-dependency-validator**: Ensures agent-context alignment during installation
- **installation-mode-validator**: Verifies context creation matches installation mode requirements

### Context Updates
- **Dynamic Updates**: Context updated during upgrade operations based on new agent requirements
- **Technology Detection**: New technology-specific contexts created when project stack changes
- **Quality Assurance**: Context validation ensures accuracy and relevance to installed components

### Troubleshooting Context Issues
1. **Missing Context**: Use research-specialist subagent to create required documentation
2. **Outdated Content**: Upgrade operations refresh context based on current system capabilities  
3. **Technology Mismatch**: Re-run discovery to align contexts with actual project technology stack
4. **Validation Failures**: Use validation agents to identify and resolve context integrity issues

## Integration with System Components

### Installation Agents
- **install-extended-context-generator-agent**: Creates project-specific extended context during installation
- **install-system-localizer-agent**: Handles system-level context creation for internal operations

### Upgrade Agents  
- **upgrade-component-localizer**: Updates existing contexts based on new system capabilities
- **upgrade-discovery-analyzer**: Re-analyzes project to determine context update requirements

### Validation Agents
- **extended-context-dependency-validator**: Validates agent-context relationships match requirements
- **extended-context-content-validator**: Ensures context quality and project appropriateness

This index enables proper extended context management, installation filtering, and agent integration validation across all system operations.