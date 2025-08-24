# Claudio

A comprehensive project analysis, planning, and implementation system for Claude Code that transforms any codebase into an organized, trackable development process through intelligent project localization and discovery-based workflows.

## What is Claudio?

<img src="docs/images/claudio.png" alt="Claudio System" width="600" height="auto">

Claudio is a comprehensive project analysis system built on specialized AI agents that work together to **discover, plan, and implement** project solutions through intelligent localization and parallel workflow execution. The system uses an **agent-based architecture** where specialized agents are **automatically customized for each project** based on comprehensive discovery analysis of technology stack, architecture patterns, and project requirements.

**Key Features:**
- **Enhanced Discovery System**: 5 parallel specialist agents (structure, technology, architecture, integration, consolidation) for comprehensive project understanding with 5x faster analysis
- **User README Generator Agent**: Automated project-specific documentation generation with technology stack-aware content and integration guidance
- **System Component Classification**: Automatic filtering between system (45+ internal components) and user components (78+ workflow components) for optimized installations with accurate command→agent mappings
- **Project-Specific CLAUDE.md Generation**: Technology stack-aware integration guidance generated during installation based on discovery analysis
- **Parallel Upgrade System**: 6 specialized subagents with batched execution for improved performance (discovery, legacy cleanup, template analysis, backup management, localization, validation)
- **Project-Specific Test Commands**: Auto-generated `/claudio:test` and `/claudio:test-g` commands during installation based on detected testing frameworks
- **Documentation Maintenance**: Parallel agent coordination (readme-updater, claude-md-updater, changelog-updater) with user-readme-generator for comprehensive updates
- **Enhanced Agent Coordination**: Direct coordination patterns with proper subagent_type references matching actual agent file names for improved system reliability
- **Research System**: Complexity-aware analysis with Think/Ultrathink modes for advanced topics and authoritative source integration
- **Claude SDK Development**: Sequential analysis of Claude Code implementations with cross-system comparison capabilities
- **Intelligent Localization**: Components automatically adapt to specific project context through discovery-based customization
- **Enhanced Error Handling**: Robust validation system with comprehensive quality assurance across all workflows

The default workflow combines **discovery and planning** into a unified process with optional **parallel implementation execution**.

## Agent-Based Architecture

Claudio employs specialized AI agents that orchestrate different aspects of project analysis:

### Enhanced Discovery System (Parallel Architecture)
- **discovery-agent**: Orchestrates 5-stage parallel project analysis with specialized analyzers for 5x performance improvement
  - **discovery-structure-analyzer**: Project organization, file patterns, directory structure, hierarchy mapping, and build system analysis
  - **discovery-tech-analyzer**: Technology stack detection, framework identification, dependency analysis, and package management assessment
  - **discovery-architecture-analyzer**: Design patterns, architectural style, component relationships, and structural analysis
  - **discovery-integration-analyzer**: Tool integration opportunities, API analysis, MCP recommendations, development workflow compatibility, and CI/CD analysis
  - **discovery-consolidator**: Analysis integration, comprehensive report generation, executive summary, localization recommendations, and project classification with quality assessment
- **prd-agent**: Transforms discovery findings into clear business requirements and success criteria
- **plan-agent**: Creates phased implementation roadmaps with time estimates and dependencies
- **task-agent**: Breaks down plans into executable tasks with specialized execution contexts
- **documentation-coordinator**: Generates comprehensive documentation (README, API docs, user guides)
- **security-review-coordinator**: Performs STRIDE-based security analysis with visual threat modeling
- **research-specialist**: Conducts complexity-aware topic research with adaptive thinking modes
- **implement-agent**: Executes plans through coordinated task processing

### Generation & Customization Agents
- **test-command-generator**: Creates project-specific test commands (`/claudio:test`, `/claudio:test-g`) based on framework detection during installation
- **new-command-generator**: Generates custom commands from research sources with workflow integration
- **newprompt-agent-creator**: Creates comprehensive agent prompts following Claudio conventions
- **Documentation Maintenance System** (Parallel Coordination):
  - **readme-updater-agent**: Updates project README files with current system capabilities
  - **claude-md-updater-agent**: Maintains project-specific CLAUDE.md documentation
  - **changelog-updater-agent**: Manages project changelog documentation with comprehensive tracking
  - **user-readme-generator-agent**: Creates project-specific README documentation with technology stack-aware content and integration guidance
- **claude-md-generator-agent**: Generates technology stack-aware project-specific CLAUDE.md during installation

### Quality Assurance Validators
- **discovery-validator**: Ensures discovery document quality and analysis depth
- **workflow-validator**: Validates complete workflow output and document completeness
- **install-validator**: Verifies installation completeness and functionality
- **new-command-validator**: Validates custom command structure and integration

### System Management Agents
- **install-full-workflow-agent**: Manages complete Claudio installation with project-specific CLAUDE.md generation
- **Parallel Upgrade System** (6 Specialized Subagents):
  - **upgrade-discovery-analyzer**: Installation analysis and compatibility assessment  
  - **upgrade-legacy-cleaner**: Phase 0 deprecated pattern cleanup with user content protection
  - **upgrade-template-analyzer**: Localization planning and conflict detection
  - **upgrade-backup-manager**: Backup creation and rollback script generation
  - **upgrade-component-localizer**: Project-specific template application and test command coordination
  - **upgrade-installation-validator**: Integrity verification and completion reporting
- **System Component Classification**:
  - **install-system-installer**: Automatic filtering between system (45+ components) and user components (78+ components) with accurate command→agent mappings and improved installation logic
  - **install-directory-creator-agent**: Creates project directory structures during installation
  - **install-path-validator-agent**: Validates installation paths and permissions
- **code-quality-analyzer**: Analyzes code quality with comprehensive reporting

Each agent is self-contained but works cooperatively, referencing other agents' outputs to create comprehensive, integrated project analysis and implementation plans. When installed in project/path modes, agents are automatically localized for the specific project context through discovery-based customization. **All agents use lowercase-hyphen naming convention** and employ **direct coordination patterns with verified subagent_type references** matching actual agent file names for improved system reliability and Claude Code integration.

## Requirements

- **Claude Code CLI**: This system is designed for use with [Claude Code](https://claude.ai/code)
- The Claude Code CLI provides the runtime environment and tools that Claudio agents use
- No additional installations required - Claudio works within your existing Claude Code setup

## Quick Start

### Option 1: Direct Analysis (Recommended for Individual Use)
Analyze projects directly with the Claudio source repository:

```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access
claude --add-dir /path/to/my-code
# or with relative paths:
claude --add-dir ../my-code

# 3. Analyze the external project
/claudio:claudio /path/to/my-code

# 4. Update project documentation with parallel coordination
/claudio:update-docs "enhanced discovery system with 4 parallel analysis agents"

# 5. Optional: Execute implementation when ready
/claudio:implement /path/to/my-code
```

**Why use --add-dir?** This flag allows Claude Code to access and analyze projects outside the Claudio directory while keeping Claudio's system files separate from your project code.

### Option 2: Install Claudio to Your Project (Recommended for Teams)
Install project-localized Claudio directly into your project for team consistency:

```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude from Claudio directory
claude

# 3. Install localized Claudio to your project
/claudio:install /path/to/your-project

# 4. Navigate to your project and use localized Claudio
cd /path/to/your-project
claude

# 5. Use project-customized commands
/claudio:claudio
/claudio:implement  # When ready to execute
```

### Option 3: Global User Installation
Install generic Claudio templates globally for system-wide access:

```bash
# 1. From Claudio directory
/claudio:install commands user

# 2. Use from any project directory (commands will localize for each project)
cd /any/project
claude
/claudio:claudio  # Performs discovery and localization for this specific project
```

**Benefits of Project Installation (Options 1 & 2)**:
- Keep Claudio updated with project-specific localization via enhanced parallel `/claudio:upgrade` system
- Share project-customized analysis system with your team
- Version control your localized Claudio setup alongside your project  
- Maintain consistency in project-specific analysis across your organization
- Components automatically adapt to your technology stack and architecture patterns through discovery-based customization
- **5 parallel specialist agents** provide comprehensive project understanding with 5x performance improvement (structure, technology, architecture, integration, consolidation)
- **Automatic system component filtering** ensures only relevant user components (78+) are installed from total system (123+ components) with accurate command→agent mappings
- **Project-specific CLAUDE.md generation** with technology stack-aware integration guidance and framework-specific workflows
- **Auto-generated test commands** (`/claudio:test`, `/claudio:test-g`) based on detected testing frameworks during installation
- **Enhanced agent coordination** with direct coordination patterns and verified subagent_type references for improved system reliability

**Benefits of Global User Installation (Option 3)**:
- Use generic Claudio tools across multiple projects
- Commands automatically localize when executed on target projects
- No need to install Claudio in each project directory
- Ideal for individual users working on multiple projects

This will create a comprehensive `.claudio/` folder in your target project with:
- **Enhanced Discovery Report**: 5 parallel specialist agents provide comprehensive understanding with 5x performance improvement (structure, technology, architecture, integration, consolidation) with executive summary and localization recommendations
- **Requirements Document**: Clear project objectives and success criteria based on discovery findings
- **Implementation Plan**: Phased roadmap with time estimates and technology stack considerations
- **Task Breakdown**: Executable tasks with specialized contexts and project-specific patterns
- **Progress Tracking**: Status monitoring at project, phase, and task levels
- **Documentation System**: Parallel coordination for README, CLAUDE.md, and changelogs with technology-specific guidance including user-readme-generator
- **Project-Specific Test Commands**: Auto-generated `/claudio:test` and `/claudio:test-g` based on detected testing frameworks

**Note**: The default `/claudio:claudio` command focuses on **discovery and planning**. Implementation is handled separately with the optional `/claudio:implement` command.

## How New Users Can Get Started

### Complete Workflow (Recommended)
1. **Clone and setup**: `git clone <repo> && cd claudio`
2. **Start Claude with access**: `claude --add-dir /path/to/your/project`
3. **Enhanced Discovery & Planning**: `/claudio:claudio /path/to/your/project` (5 parallel specialist agents with 5x performance improvement + comprehensive planning)
4. **Review the comprehensive analysis**: Check the generated `.claudio/` folder with discovery report, requirements, and plans
5. **Test with auto-generated commands**: Use project-specific `/claudio:test` and `/claudio:test-g` commands
6. **Update documentation**: Use `/claudio:update-docs "project updates"` for parallel documentation maintenance
7. **Create custom tools**: `/claudio:new-command tool-name "purpose" source-url` with research-driven generation
8. **Optional Implementation**: `/claudio:implement /path/to/your/project` (when ready to execute plans)
9. **Keep system updated**: `/claudio:upgrade --check` with parallel upgrade system

**Quality Assurance**: All outputs are automatically validated for completeness and quality through integrated validation loops.

### Team/Organization Setup
1. **Install localized system**: `/claudio:install /path/to/team/project` (runs 5 parallel specialist discovery agents and localizes 78+ components with system filtering and verified command→agent mappings)
2. **Team members use**: Navigate to project, start Claude, use project-customized `/claudio:claudio` with technology stack-aware workflows
3. **Stay updated**: Use `/claudio:upgrade` with 6 parallel subagents for efficient localization updates
4. **Version control**: Commit `.claude/` folder for team consistency with project-specific customizations and auto-generated test commands

### For Individual Tasks
Use specific commands for focused work:
```bash
/claudio:discovery ./my-app          # 5 parallel specialist agents with 5x performance (structure, tech, architecture, integration, consolidation)
/claudio:security-review ./my-app    # STRIDE security analysis with technology-specific threat modeling
/claudio:documentation readme ./my-app   # Generate README with project-specific patterns
/claudio:prd feature user-auth       # Create requirements doc with domain awareness
/claudio:plan project my-app "8 weeks"   # Create implementation plan with technology-specific patterns
/claudio:test-review                 # Analyze testing patterns with framework-specific insights
/claudio:update-docs "new features"  # Parallel documentation maintenance (README, CLAUDE.md, changelogs)
/claudio:claude-sdk command_name     # Sequential analysis of Claude Code implementations
/claudio:gcms                       # Generate commit messages following project conventions
```

### Understanding the Output
After running Claudio on a project, you'll find:

```
your-project/
└── .claudio/
    ├── summary.md          # Executive overview
    ├── discovery.md        # Technology analysis  
    ├── prd.md             # Requirements
    ├── plan.md            # Implementation roadmap
    ├── status.md          # Progress tracking
    ├── research/          # Topic-specific research
    ├── docs/              # Generated documentation
    │   └── security/      # Security analysis with STRIDE methodology
    └── phase1/, phase2/   # Task breakdown with contexts
```

## Task Execution Model

### How Task Contexts Work
Claudio's task system has been designed for efficient, focused execution:

**Agent-Driven Task Execution**: Each task context (`.claudio/phase*/task*/claude.md`) contains specialized agent instructions that produce actionable next steps rather than work summaries.

**Coordinated Processing**: Task agents work through the Task orchestrator system, updating status files for progress tracking while maintaining focused execution.

**Comprehensive Status Tracking**: All progress information, work summaries, and coordination updates are maintained in dedicated status files that provide visibility across the entire project:

```
project/.claudio/
├── status.md                    # Project-level progress
├── phase1/
│   ├── phase_status.md         # Phase-level progress
│   ├── task1/
│   │   ├── claude.md           # Task context (produces next action)
│   │   └── status.md           # Task progress and updates
│   └── task2/
│       ├── claude.md           # Task context (produces next action)
│       └── status.md           # Task progress and updates
└── shared/status/
    └── global_status.md        # Cross-phase status tracking
```

### Finding Progress Information
- **Current Task Status**: Check `phase*/task*/status.md` for detailed progress
- **Phase Overview**: Review `phase*/phase_status.md` for phase-level progress  
- **Project Status**: View `.claudio/status.md` for overall project tracking
- **Next Actions**: Task contexts suggest the next recommended prompt to execute

## Available Commands

### Core Workflow Commands
| Command | Purpose | Example | Localization |
|---------|---------|---------|-------------|
| `/claudio:claudio` | Complete discovery & planning | `/claudio:claudio ../my-app` | Full project localization with 5 parallel specialist agents |
| `/claudio:discovery` | Enhanced project analysis | `/claudio:discovery ./backend` | 5 parallel specialist agents: structure, technology, architecture, integration, consolidation |
| `/claudio:documentation` | Generate docs | `/claudio:documentation api ./my-api` | Project-specific documentation patterns |
| `/claudio:prd` | Create requirements | `/claudio:prd feature chat-system` | Domain and architecture-aware requirements |
| `/claudio:plan` | Implementation planning | `/claudio:plan project app "12 weeks"` | Technology-specific development patterns |
| `/claudio:task` | Break down into tasks* | `/claudio:task plan.md my-project` | Project structure-aware task contexts |
| `/claudio:research` | Topic research with complexity assessment | `/claudio:research security oauth2` or `/claudio:research development react-testing --complexity=high` | Adaptive thinking modes (Think/Ultrathink) for complex topics |
| `/claudio:update-docs` | Update project documentation | `/claudio:update-docs "enhanced features"` | Parallel coordination for README, CLAUDE.md, and changelogs |
| `/claudio:design` | UX/UI analysis & specs | `/claudio:design audit ./my-app material` | Framework and architecture-specific design analysis |
| `/claudio:security-review` | STRIDE security analysis with Mermaid diagrams | `/claudio:security-review ./my-app` | Technology stack-specific security patterns |

### Implementation & Execution
| Command | Purpose | Example | Localization |
|---------|---------|---------|-------------|
| `/claudio:implement` | Execute implementation plans** | `/claudio:implement ../my-project` | Project-specific execution with localized contexts |
| `/claudio:test`**** | Run project tests with analysis | `/claudio:test` or `/claudio:test --fix` | Auto-generated for each project's test framework |
| `/claudio:test-g`**** | Gemini-integrated testing | `/claudio:test-g` | Project-specific test analysis with AI assistance |

### System Management
| Command | Purpose | Example | Localization |
|---------|---------|---------|-------------|
| `/claudio:install` | Install Claudio components | `/claudio:install` or `/claudio:install commands user` | Project/path modes: localization via discovery; User mode: direct template copying |
| `/claudio:upgrade` | Parallel upgrade system | `/claudio:upgrade` or `/claudio:upgrade /path/to/project` | 6 specialized subagents with batched execution and backup management |
| `/claudio:generate-test-commands`***** | Generate project test commands | System command - auto-called during install/upgrade | Creates project-specific test commands based on discovery |

### Utilities
| Command | Purpose | Example | Localization |
|---------|---------|---------|-------------|
| `/claudio:new-command` | Generate custom commands from research | `/claudio:new-command my-tool "analyzes dependencies" https://docs.npmjs.com` | Research-driven command generation with workflow integration |
| `/claudio:newprompt` | Create new agent prompts | `/claudio:newprompt security-review "vulnerability analysis" standard` | Template-based with project integration patterns |
| `/claudio:test-review` | Analyze testing patterns and frameworks | `/claudio:test-review` | Technology stack-specific testing analysis |
| `/claudio:gcms` | Generate conventional git commit messages | `/claudio:gcms` | Project convention-aware commit messages |
| `/claudio:code-quality` | Code quality assessment*** | `/claudio:code-quality full ./my-project` | Language and framework-specific quality analysis |
| `/claudio:claude-sdk` | Claude Code implementation analysis | `/claudio:claude-sdk command_name` or `/claudio:claude-sdk --cross-system` | Sequential analysis with cross-system comparison |

*Task command creates contexts that produce next actions and tracks progress in status.md files

**Implementation command is optional and invoked separately when ready to execute plans

***Optional command - see [Optional Commands](#optional-commands) for installation

****Auto-generated project-specific test commands installed during `/claudio:install` or `/claudio:upgrade`

*****System command that remains in Claudio source, automatically called during installation/upgrade workflows

## Validation System

Claudio includes a comprehensive quality assurance framework with specialized validators that ensure system reliability and output quality across all workflows.

### Validation Components

#### Discovery Validator
- **Purpose**: Validates discovery document quality and analysis depth
- **Checks**: Technology detection, architecture analysis, dependency mapping, improvement recommendations
- **Success Criteria**: Minimum sections present, technical depth achieved, actionable insights provided
- **Auto-runs**: After discovery phase in workflows

#### Workflow Validator  
- **Purpose**: Validates complete Claudio workflow output quality
- **Checks**: Document completeness, phase structure, task breakdown, status tracking setup
- **Success Criteria**: All required documents present, proper linking between phases, executable task contexts
- **Auto-runs**: After `/claudio:claudio` workflow completion

#### Install Validator
- **Purpose**: Validates installation completeness and functionality
- **Checks**: Command installation, agent setup, directory structure, file permissions
- **Success Criteria**: All components installed, proper namespacing, test commands generated
- **Auto-runs**: After `/claudio:install` operations

#### New Command Validator
- **Purpose**: Validates custom command generation quality
- **Checks**: Command structure, sub-agent integration, context references, workflow compatibility
- **Success Criteria**: Proper formatting, valid integration points, executable command structure
- **Auto-runs**: After `/claudio:new-command` generation

### Validation Integration

Validators are integrated into workflows automatically:
- **Discovery workflows**: Run discovery validator after analysis
- **Installation workflows**: Run install validator after setup
- **Custom command creation**: Run command validator after generation
- **Complete workflows**: Run workflow validator at completion

### Validation Reports

Each validator generates detailed reports including:
- **Pass/Fail Status**: Clear success or failure indication
- **Detailed Findings**: Specific issues or confirmations
- **Recommendations**: Actionable improvement suggestions
- **Quality Metrics**: Quantitative assessment of output quality

## Custom Command Generation

Claudio enables you to create custom commands tailored to your specific needs through research-driven generation.

### Using `/claudio:new-command`

Generate complete command systems (command + sub-agent + context) from research sources:

```bash
# Create from URL research
/claudio:new-command dependency-analyzer "analyzes project dependencies" https://docs.npmjs.com/cli/v8/commands/npm-audit

# Create from local documentation
/claudio:new-command api-validator "validates API endpoints" ./api-spec.md

# Integrate with Claudio workflow
/claudio:new-command security-scan "performs security analysis" https://owasp.org/www-project-top-ten/ --claudio "after discovery workflow"
```

### Generated Components

Each custom command creates:

1. **Command File** (`commands/claudio/{name}.md`)
   - Usage documentation and examples
   - Parameter definitions
   - Integration instructions

2. **Sub-Agent** (`agents/claudio/{name}-executor.md`)
   - Specialized execution logic
   - Tool selection and capabilities
   - Error handling

3. **Extended Context** (`agents/claudio/extended_context/{category}/{name}/overview.md`)
   - Research-based knowledge
   - Best practices and patterns
   - Framework-specific guidance

### Workflow Integration Options

Custom commands can integrate into Claudio workflows:
- `"after discovery workflow"` - Runs after project analysis
- `"after prd workflow"` - Runs after requirements generation
- `"after plan workflow"` - Runs after implementation planning
- `"before task workflow"` - Runs before task breakdown
- `"parallel with [phase]"` - Runs concurrently with specified phase

### Quality Assurance

All generated commands undergo automatic validation:
- Structure and formatting verification
- Sub-agent integration testing
- Context reference validation
- Workflow compatibility checking

## Project-Specific Testing

Claudio automatically generates customized test commands for each project based on its discovered testing framework and patterns.

### Auto-Generated Test Commands

During installation or upgrade, Claudio analyzes your project and creates:

#### `/claudio:test` - Intelligent Test Runner
- **Features**: 
  - Runs your project's test suite with framework detection
  - Provides intelligent summary and analysis
  - Optional `--fix` flag for auto-remediation
  - Framework-specific optimizations
- **Example**: `/claudio:test` or `/claudio:test --fix`

#### `/claudio:test-g` - Gemini-Enhanced Testing
- **Features**:
  - AI-assisted test analysis and recommendations
  - Read-only analysis with task generation
  - Advanced pattern detection
  - Test coverage insights
- **Requirements**: Gemini CLI access and API configuration
- **Example**: `/claudio:test-g`

### Project-Specific README Generation

Claudio includes a specialized agent for creating project-specific README documentation:

#### User README Generator Agent
- **Purpose**: Automated generation of project-specific README files with technology stack-aware content
- **Features**:
  - Technology stack-aware content generation
  - Integration guidance based on discovery analysis
  - Framework-specific usage examples
  - Project-specific setup and installation instructions
  - Customized documentation patterns
- **Integration**: Automatically invoked during installation and documentation update workflows
- **Agent**: `user-readme-generator-agent.md` provides specialized README generation capabilities

### Framework Detection

Test commands are customized for detected frameworks:
- **JavaScript/TypeScript**: Jest, Mocha, Vitest, Karma
- **Python**: pytest, unittest, nose2
- **Ruby**: RSpec, Minitest
- **Go**: go test, testify
- **Rust**: cargo test
- **Java**: JUnit, TestNG
- **Other frameworks**: Automatically detected from project structure

### Installation Process

Test commands are automatically generated during:
- `/claudio:install` - Full system installation
- `/claudio:install commands` - Commands-only installation
- `/claudio:upgrade` - System upgrades
- `/claudio:claudio` - Complete workflow execution

The generation process:
1. Analyzes project discovery document
2. Detects testing frameworks and patterns
3. Generates customized command implementations
4. Creates specialized sub-agents
5. Installs in project's `.claude/` directory

## Installation and System Management

### Installing Claudio Components

Claudio supports multiple installation modes to fit different workflows:

#### Installation Modes

**Project Mode** (Default - Recommended):
```bash
# Install complete localized Claudio system in current project
/claudio:install

# Install localized commands only in current project  
/claudio:install commands
```
Creates `.claude/` folder in current directory with project-localized Claudio system based on discovery analysis.

**User Mode** (Global Installation):
```bash
# Install generic commands globally for user
/claudio:install commands user
```
Installs generic Claudio templates to `~/.claude/` for system-wide access. Uses direct copying of templates - localization occurs when commands are executed on target projects.

**Custom Path Mode**:
```bash
# Install localized system to specific location
/claudio:install /path/to/project
/claudio:install commands /path/to/custom/location
```
Installs project-localized Claudio system to any specified directory after discovery analysis.

#### What Gets Installed
- **Project/Path Modes**: Project-localized commands, agents, prompts, and all system components customized for your codebase
- **User Mode**: Generic template files that enable localization workflows on target projects
- **Automatic Discovery**: Installation system runs project discovery in project/path modes to customize components
- **Mode-Specific Behavior**: 
  - **Project/Path**: Intelligent localization based on project analysis
  - **User**: Direct copying of generic templates for use across multiple projects

### Upgrading Claudio

Keep your Claudio installation current with the upgrade system:

#### Check for Updates
```bash
# Preview available upgrades for current directory
/claudio:upgrade --check

# Check specific project installation
/claudio:upgrade /path/to/project --check

# Show current installation status
/claudio:upgrade --status
```

#### Perform Localized Upgrades
```bash
# Upgrade current directory with re-localization
/claudio:upgrade

# Upgrade specific project with localization refresh
/claudio:upgrade /path/to/project

# Upgrade specific components with localization
/claudio:upgrade --commands
/claudio:upgrade /path/to/project --agents

# Force complete re-discovery and re-localization
/claudio:upgrade --force

# Force re-discovery even if current
/claudio:upgrade --force-discovery

# Preserve existing contexts during upgrade
/claudio:upgrade --preserve-contexts
```

#### Safety Features
- **Automatic Backups**: Complete backup created before any localization changes
- **Changelog Generation**: Detailed record of all modifications and re-localizations
- **Rollback Support**: Easy reversion to previous localized versions
- **No-Change Detection**: Clear notification when localization is current
- **Context Preservation**: Existing project contexts (tasks, phases) are maintained during upgrades

#### Version Management
```bash
# List upgrade history for current directory
/claudio:upgrade --list-versions

# List versions for specific project
/claudio:upgrade /path/to/project --list-versions

# View specific changelog
/claudio:upgrade --changelog 2025-08-02_14-30-15

# Rollback current directory to previous version
/claudio:upgrade --rollback 2025-08-02_14-30-15

# Rollback specific project
/claudio:upgrade /path/to/project --rollback 2025-08-02_14-30-15
```

### System Maintenance

#### Validation and Health Checks
```bash
# Validate current directory installation
/claudio:upgrade --validate

# Validate specific project installation
/claudio:upgrade /path/to/project --validate

# Show installation information
/claudio:upgrade --status
```

The upgrade system maintains complete version history in `.claude/.upgrades/` with:
- Timestamped backups for safe rollback
- Detailed changelogs for transparency
- Automated rollback scripts for easy recovery
- Git-independent version management

## Implementation Execution

Beyond planning, Claudio can execute your implementation plans through a separate, optional command:

### Three-Phase Workflow
Claudio is designed around **three core phases** for comprehensive project management:

1. **Discovery**: Project analysis, technology assessment, and capability mapping
2. **Planning**: Requirements documentation and implementation roadmap creation  
3. **Implementation**: Optional code execution and task completion

### Combined Default Workflow
The **default workflow combines discovery and planning** into a single command:

- **Combined Phase**: Discovery + Planning with `/claudio:claudio`
- **Optional Phase**: Implementation with `/claudio:implement`

**Benefits of This Approach**:
- **Enhanced Discovery + Planning Together**: 5 parallel specialist agents provide comprehensive understanding with 5x performance improvement plus complete roadmap in one step
- **Implementation Separation**: Review comprehensive analysis and plans before execution, share with team, execute when ready
- **Flexible Timing**: Run enhanced discovery/planning frequently with parallel execution, implement only when needed
- **Team Collaboration**: Technology stack-aware plans can be reviewed and refined before implementation begins

After creating plans with `/claudio:claudio`, optionally execute them:

```bash
# Default workflow: discovery and planning combined
/claudio:claudio ../my-project

# Optional: execute implementation when ready
/claudio:implement ../my-project
```

### Implementation Features
- **Parallel Task Processing**: Execute independent tasks simultaneously
- **Progress Tracking**: Real-time status updates and completion monitoring
- **Error Handling**: Graceful failure handling with rollback capabilities
- **Selective Execution**: Run specific phases or tasks as needed

### Implementation Modes
```bash
# Execute complete implementation plan
/claudio:implement

# Execute specific phase
/claudio:implement --phase phase1

# Execute specific task
/claudio:implement --task phase1.task2

# Resume interrupted execution
/claudio:implement --resume

# Control parallel execution
/claudio:implement --parallel 4

# Preview execution plan (dry run)
/claudio:implement --dry-run

# Check implementation status
/claudio:implement --status
```

Implementation integrates with existing agents:
- **Code Quality**: Automatic quality checks during implementation
- **Documentation**: Live documentation updates as code is implemented
- **Testing**: Coordinated test execution and validation

## Adding New Prompts and Commands

### Quick Method: Use the NewPrompt Command
```bash
# Create a new agent and command automatically
/claudio:newprompt security-review "Comprehensive security analysis with vulnerability assessment" standard
```

The `/claudio:newprompt` command will:
- Create the agent prompt and command files
- Determine workflow integration (standard/optional/conditional)
- Generate integration instructions for existing files
- Update documentation and folder structures

### Manual Method: Step-by-Step
Want to add a security review prompt manually? Here's how:

### 1. Create the Agent Prompt
```bash
mkdir -p .claude/agents/claudio/prompts/security-review
```

Create `.claude/agents/claudio/extended_context/security-review/overview.md`:
```markdown
# Security Review Agent

You are a specialized security review agent that analyzes codebases for security vulnerabilities, best practices, and compliance requirements.

## Your Core Responsibilities:
1. **Vulnerability Assessment**: Identify potential security risks
2. **Best Practices Review**: Evaluate security implementations
3. **Compliance Checking**: Verify regulatory compliance
4. **Remediation Planning**: Provide actionable security improvements

## Analysis Areas:
- Authentication and authorization
- Data protection and encryption
- Input validation and sanitization
- API security and rate limiting
- Dependency vulnerabilities
- Infrastructure security

[Include detailed methodology and templates...]
```

### 2. Create the Command
Create `.claude/commands/claudio/security-review.md`:
```markdown
# Security Review Command

## Description
Perform comprehensive security analysis of codebases with vulnerability assessment and remediation recommendations.

## Usage
/claudio:security-review <target_path> [security_standard]

## Parameters
- `target_path`: Path to code/project to review
- `security_standard`: Optional standard (OWASP, SOC2, etc.)

## Context
Use the security review agent context from `.claude/agents/claudio/extended_context/security-review/overview.md`.

## Instructions
1. Analyze code for security vulnerabilities
2. Review authentication and authorization
3. Check for common security anti-patterns
4. Generate remediation recommendations
5. **Direct Command**: Save to `security-reviews/<project>_security_review.md`
6. **Within Claudio**: Save to `<target>/.claudio/security-review.md`
```

### 3. Integration with Claudio
To integrate with the main Claudio workflow, update the claudio-coordinator-agent to include security review as an optional phase.

## Simple Usage Examples

### Complete Project Workflow
```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access
claude --add-dir ../my-react-app

# 3. In Claude Code session - complete workflow:
/claudio:claudio ../my-react-app
/claudio:implement ../my-react-app  # When ready to execute

# 4. Update project documentation with parallel coordination
/claudio:update-docs "enhanced features and capabilities"

# 5. Test your project with auto-generated commands
/claudio:test                        # Run tests with intelligent analysis
/claudio:test-g                      # Enhanced testing with Gemini

# 6. Create custom commands as needed
/claudio:new-command metrics "track performance" ./perf-guide.md

# 7. Keep system updated
/claudio:upgrade --check
```

### Team Installation Workflow
```bash
# 1. Install localized system to team project
/install /path/to/team/project

# 2. Team members navigate and use project-customized Claudio
cd /path/to/team/project
claude
/claudio:claudio  # Uses project-specific localized components
/claudio:implement  # When ready

# 3. Keep localized installation current
/claudio:upgrade  # Re-localizes based on current project state
```

### Specific Analysis Tasks
```bash
# Individual command usage (automatically localizes for each project)
/claudio:discovery /path/to/my-api    # Analyze project structure with tech-specific analysis
/claudio:security-review /path/to/my-api  # Security analysis with STRIDE and tech-specific patterns
/claudio:documentation readme ./frontend  # Generate README with project-specific patterns
/claudio:prd feature real-time-chat   # Create requirements doc with domain awareness
/claudio:test-review                  # Analyze testing setup with framework-specific insights
/claudio:gcms                        # Generate commit messages following project conventions

# New command generation and testing
/claudio:new-command linter "code style checker" https://eslint.org/docs  # Create custom command
/claudio:test                        # Run project tests with intelligent analysis
/claudio:test --fix                  # Run tests with auto-remediation
/claudio:test-g                      # Gemini-enhanced test analysis
```

### System Management
```bash
# Installation management with mode-appropriate behavior
/claudio:install                    # Install localized system to current project
/claudio:install commands user      # Install generic templates globally (no localization)
/claudio:install /custom/path      # Install localized system to specific location

# Upgrade management with re-localization
/claudio:upgrade --check   # Preview available updates and re-localization needs
/claudio:upgrade           # Apply upgrades with re-localization to current directory
/claudio:upgrade /path/to/project  # Upgrade specific project with localization refresh
/claudio:upgrade --force-discovery  # Force project re-analysis and re-localization
/claudio:upgrade --rollback 2025-08-02_14-30-15  # Rollback if needed
```

### Following Up and Progress Tracking
```bash
# Check progress via status files
"Show me the current status from /my-project/.claudio/status.md"
"What's the progress on phase 1 tasks?"

# Implementation execution and monitoring
/claudio:implement --status           # Check implementation progress
/claudio:implement --phase phase1     # Execute specific phase
/claudio:implement --dry-run          # Preview execution plan

# Execute next recommended actions
"What does the task context suggest as the next step?"
"Update the implementation plan to include the new requirements"
"Generate additional research on GraphQL best practices"
```

## Optional Commands

Some commands are available as optional installations that users can add to their own projects:

### Code Quality Assessment

The `/code-quality` command provides comprehensive code quality assessment including linting, formatting, testing, coverage analysis, and cyclomatic complexity evaluation.

**Installation Options:**
1. **Copy to Project**: Copy the command files to your project's `.claude/commands/claudio/` directory
2. **Symlink**: Create symlinks to stay updated with Claudio improvements
3. **Git Submodule**: Automatic availability when using Claudio as a submodule

**Usage Examples:**
```bash
# Full quality assessment
/claudio:code-quality full ./my-project

# Quick CI/CD check  
/claudio:code-quality quick . json

# Focus on test coverage
/claudio:code-quality coverage ./project detailed
```

**Supported Languages:** JavaScript/TypeScript, Python, Rust, Go, Elixir, Java, C#, PHP, Ruby

**Project Localization:** Commands are automatically customized for your project's technology stack and patterns.

For detailed installation instructions and tool requirements, see the [code-quality documentation](./.claude/agents/claudio/prompts/code-quality/README.md).

## Project Structure

```
claudio/
├── README.md              # This file  
├── CLAUDE.md             # Detailed system documentation
├── .claude/              # Claudio system implementation
│   ├── commands/claudio/ # All executable commands with namespace
│   │   ├── claudio.md    # Master project analysis
│   │   ├── discovery.md  # Project structure analysis  
│   │   ├── prd.md        # Requirements documentation
│   │   ├── plan.md       # Implementation planning
│   │   ├── task.md       # Task breakdown
│   │   ├── implement.md  # Implementation execution
│   │   ├── research.md   # Topic research with complexity assessment
│   │   ├── documentation.md # Documentation generation
│   │   ├── update-docs.md # Documentation update coordination
│   │   ├── design.md     # UX/UI analysis
│   │   ├── new-command.md # Custom command generation
│   │   ├── newprompt.md  # Agent creation system
│   │   ├── generate-test-commands.md # Test command generator (system)
│   │   ├── install.md    # Installation management
│   │   ├── upgrade.md    # Upgrade management
│   │   ├── test-review.md # Testing analysis
│   │   ├── gcms.md       # Git commit messages
│   │   ├── security-review.md # Security analysis with STRIDE
│   │   ├── code-quality.md # Code quality assessment
│   │   └── claude-sdk.md # Claude Code implementation analysis
│   └── agents/claudio/   # Agent implementations
│       ├── claudio-coordinator-agent.md # Master orchestration
│       ├── discovery-agent.md # Discovery coordination with 5 parallel specialists
│       ├── discovery-structure-analyzer.md # Project structure analysis with hierarchy mapping
│       ├── discovery-tech-analyzer.md # Technology detection with package management assessment
│       ├── discovery-architecture-analyzer.md # Architecture analysis with structural patterns
│       ├── discovery-integration-analyzer.md # Integration analysis with API and MCP recommendations
│       ├── discovery-consolidator.md # Discovery report consolidation with project classification
│       ├── prd-agent.md # PRD creation
│       ├── plan-agent.md # Planning coordination
│       ├── task-agent.md # Task breakdown
│       ├── implement-agent.md # Implementation execution
│       ├── install-full-workflow-agent.md # Full workflow installation
│       ├── upgrade-orchestrator-agent.md # Upgrade coordination
│       ├── documentation-coordinator.md # Documentation coordination
│       ├── readme-updater-agent.md # README update coordination
│       ├── claude-md-updater-agent.md # CLAUDE.md maintenance
│       ├── claude-md-generator-agent.md # Project-specific CLAUDE.md generation
│       ├── user-readme-generator-agent.md # Project-specific README generation
│       ├── changelog-updater-agent.md # Changelog management
│       ├── new-command-generator.md # Custom command generation
│       ├── test-command-generator.md # Test command generation
│       ├── newprompt-coordinator.md # Agent creation
│       ├── code-quality-analyzer.md # Quality assessment
│       ├── design-analyzer.md # UX/UI analysis
│       ├── research-specialist.md # Research coordination
│       ├── git-commit-message.md # Commit message generation
│       ├── test-review.md # Testing analysis
│       ├── security-review-coordinator.md # Security analysis coordination
│       ├── security-threat-modeler.md # STRIDE threat modeling
│       ├── security-diagram-generator.md # Security Mermaid diagrams
│       ├── vulnerability-assessment-specialist.md # Vulnerability analysis
│       ├── security-architecture-analyst.md # Security architecture review
│       ├── discovery-validator.md # Discovery validation
│       ├── workflow-validator.md # Workflow validation
│       ├── install-validator.md # Installation validation
│       ├── new-command-validator.md # Command validation
│       └── extended_context/  # Extended agent contexts
│           ├── workflow/
│           │   ├── discovery/     # Project analysis context
│           │   ├── prd/           # Requirements context
│           │   ├── planning/      # Planning context
│           │   └── task/          # Task breakdown context
│           ├── development/
│           │   ├── code_quality/  # Code quality context
│           │   ├── design/        # Design analysis context
│           │   └── testing/       # Test command templates
│           ├── infrastructure/
│           │   ├── installation/  # Installation context
│           │   └── upgrade/       # Upgrade context
│           ├── documentation/     # Documentation context
│           ├── research/          # Research context
│           ├── command-analysis/  # Claude SDK command analysis
│           └── agent-analysis/    # Claude SDK agent analysis
├── examples/            # Sample projects for testing
│   ├── web-app/        # Deno.js task manager SPA with full Claudio analysis
│   └── rust-game/      # Bevy chess game
└── [generated folders]  # Created when using standalone commands
```

### Generated Project Structure
When Claudio analyzes a project, it creates:

```
your-project/
└── .claudio/
    ├── summary.md          # Executive overview
    ├── discovery.md        # Technology analysis  
    ├── prd.md             # Requirements
    ├── plan.md            # Implementation roadmap
    ├── status.md          # Progress tracking
    ├── .upgrades/         # Upgrade management (when using installed Claudio)
    │   ├── backups/       # Version backups
    │   ├── changelogs/    # Upgrade changelogs
    │   └── version_history.json # Version tracking
    ├── research/          # Topic-specific research
    ├── docs/              # Generated documentation
    │   ├── readme.md      # Project documentation
    │   ├── api.md         # API documentation
    │   ├── user_guide.md  # User guide
    │   └── security/      # Security analysis
    │       ├── stride_analysis.md
    │       ├── threat_model.md
    │       ├── vulnerability_report.md
    │       ├── remediation_plan.md
    │       └── diagrams/
    │           ├── data_flow.mermaid
    │           ├── attack_trees.mermaid
    │           ├── threat_model.mermaid
    │           └── security_architecture.mermaid
    ├── design/            # Design specifications
    └── phase1/, phase2/   # Task breakdown with contexts
```

## Development and Testing

### Contributing to Claudio

Claudio includes a comprehensive test suite with validation loops and template systems to ensure quality and consistency across all components.

#### Validation-Driven Development

All Claudio components undergo automatic validation:
- **Discovery Documents**: Validated for completeness and depth
- **Generated Commands**: Validated for structure and integration
- **Workflow Outputs**: Validated for document quality
- **Installations**: Validated for completeness and functionality

#### Template System

Claudio uses standardized templates for consistency:

##### Command Templates
- **Structure**: Frontmatter, description, usage, parameters
- **Integration**: Sub-agent references, workflow hooks
- **Validation**: Automatic structure verification

##### Agent Templates  
- **Components**: Purpose, responsibilities, tools, methodology
- **Patterns**: Consistent naming, error handling, output formats
- **Localization**: Project-specific customization points

##### Context Templates
- **Organization**: Structured knowledge sections
- **References**: Cross-agent integration points
- **Extensions**: Research-based content additions

#### Validation Loops

Development workflow includes integrated validation:
1. **Pre-generation**: Validate inputs and requirements
2. **Generation**: Apply templates with consistency checks
3. **Post-generation**: Validate output structure and quality
4. **Integration**: Validate workflow compatibility
5. **Installation**: Validate deployment completeness

#### Test Suite Structure

The `test/` directory contains generated example projects specifically designed to test Claudio workflows:

```
test/
├── README.md              # Comprehensive test documentation
├── claudio-ci-test.sh     # Automated CI test script
├── install/               # Tests claudio:install (full system)
│   └── README.md         # E-commerce platform project
├── install-commands/      # Tests claudio:install commands
│   └── README.md         # DevOps automation project  
├── upgrade/               # Tests claudio:upgrade workflow
│   ├── README.md         # TaskFlow productivity app
│   └── .claude/          # Mock existing installation
├── discovery-readme/      # Tests claudio:discovery (simple)
│   └── README.md         # FitTracker mobile app
└── discovery-code/        # Tests claudio:discovery (complex)
    ├── README.md         # WeatherAPI Elixir service
    ├── mix.exs           # Phoenix project structure
    ├── lib/              # Sample Elixir code
    └── config/           # Configuration files
```

#### Test Project Characteristics

Each test project represents different scenarios:

- **Technology Diversity**: Node.js, Python, Elixir, mobile development
- **Architecture Patterns**: Microservices, functional programming, real-time systems
- **Complexity Levels**: Simple README-only to complex multi-service applications
- **Domain Coverage**: E-commerce, DevOps, productivity, health, weather services

#### Running Tests

**Individual Workflow Testing:**
```bash
# Test commands-only installation
cd test/install-commands && /claudio:install commands

# Test discovery on simple project
cd test/discovery-readme && /claudio:discovery

# Test discovery on code project  
cd test/discovery-code && /claudio:discovery

# Test system upgrade
cd test/upgrade && /claudio:upgrade

# Test full installation
cd test/install && /claudio:install
```

**Automated CI Testing:**
```bash
# Run complete test suite
./test/claudio-ci-test.sh

# Individual test validation
cd test/install && /claudio:install
# Verify .claudio/summary.md, .claudio/discovery.md, .claudio/prd.md exist
```

#### Development Workflow

1. **Clone and Setup**: `git clone <repo> && cd claudio`
2. **Test Changes**: Run `./test/claudio-ci-test.sh` to validate all workflows
3. **Add New Features**: Update test projects if new capabilities are added
4. **Validate Installation Modes**: Test project, user, and path installation modes
5. **Check Localization**: Ensure components adapt correctly to different technology stacks
6. **Agent System Validation**: Test restructured agent system using the dedicated test workflow

#### Agent System Testing

For development validation of the Claudio agent system, use the dedicated test workflow:

```bash
# Start a new Claude Code session and run:
@test/agent_validation.md
```

This test workflow:
- **Validates** all renamed agents are available and properly invoked
- **Tests** agent descriptions for proper Claude Code selection 
- **Verifies** extended context structure works with new paths
- **Checks** command vs agent disambiguation 
- **Exercises** Claude SDK analysis capabilities
- **Uses** realistic sample application in `test/claudio-agents/` (Elixir Phoenix task manager)
- **Provides** comprehensive validation criteria and troubleshooting guidance

**When to Use**: After making changes to agent naming, extended context structure, or agent descriptions. Essential for validating system restructures and ensuring proper Claude Code integration.

#### CI/CD Integration

The test suite is designed for continuous integration:

```yaml
# Example GitHub Actions integration
- name: Test Claudio Workflows
  run: |
    chmod +x test/claudio-ci-test.sh
    ./test/claudio-ci-test.sh
```

**Test Validation Criteria:**
- Commands-only installation creates `.claude/commands/` and `.claude/agents/`
- Discovery tests generate discovery reports in `discovery/reports/`
- Upgrade tests create changelog and backup files
- Full installation produces complete `.claudio/` structure
- All tests complete without errors across different project types

#### Adding New Test Scenarios

When adding new Claudio features:

1. **Create Test Project**: Add new directory in `test/` with representative project
2. **Update CI Script**: Add validation steps to `claudio-ci-test.sh`
3. **Document Test**: Update `test/README.md` with new test scenario
4. **Validate Localization**: Ensure new features work across different technology stacks

The test projects are **generated examples** designed specifically for validation - they are not live projects but carefully crafted scenarios that exercise all Claudio capabilities.

#### Creating New Validators

To add a new validator:

1. **Create Validator Agent**: `agents/claudio/{name}-validator.md`
   - Define validation criteria and success metrics
   - Specify tools needed for validation
   - Include detailed reporting template

2. **Integration Points**: Update workflows to call validator
   - Add to relevant command workflows
   - Include in installation/upgrade processes
   - Ensure proper error handling

3. **Testing**: Add test cases for validator
   - Success scenarios with valid inputs
   - Failure scenarios with invalid inputs
   - Edge cases and boundary conditions

#### Creating New Generators

To add a new generator:

1. **Create Generator Agent**: `agents/claudio/{name}-generator.md`
   - Define generation logic and templates
   - Specify research/discovery requirements
   - Include localization patterns

2. **Template Creation**: Add templates in `prompts/{category}/`
   - Standardized structure and formatting
   - Placeholders for customization
   - Validation hooks

3. **Command Integration**: Create command in `commands/claudio/`
   - User-facing interface
   - Parameter validation
   - Generator agent invocation

## Benefits

- **5 Parallel Specialist Agents**: Comprehensive project understanding with 5x performance improvement through simultaneous structure, technology, architecture, integration, and consolidation analysis
- **User README Generator Agent**: Automated project-specific documentation generation with technology stack-aware content and integration guidance
- **System Component Classification**: Automatic filtering between system (45+ internal) and user components (78+ workflow) ensures optimized installations with accurate command→agent mappings
- **Project-Specific CLAUDE.md Generation**: Technology stack-aware integration guidance automatically generated during installation based on discovery
- **Parallel Upgrade System**: 6 specialized subagents with batched execution (discovery, cleanup, templates, backup, localization, validation) for improved performance
- **Auto-Generated Test Commands**: Project-specific `/claudio:test` and `/claudio:test-g` created during installation based on detected testing frameworks
- **Documentation Maintenance System**: Parallel agent coordination (readme-updater, claude-md-updater, changelog-updater, user-readme-generator) for comprehensive updates
- **Enhanced Agent Coordination**: Direct coordination patterns with verified subagent_type references matching actual agent file names for improved system reliability
- **Complexity-Aware Research**: Think/Ultrathink modes for advanced topics with authoritative source integration and quality assessment
- **Claude SDK Development Capabilities**: Sequential analysis of Claude Code implementations with cross-system comparison and architecture evaluation
- **Clear Implementation Path**: Receive actionable plans with time estimates based on comprehensive 5-stage discovery with consolidation
- **Organized Development**: Transform ad-hoc coding into systematic progress with integrated validation system
- **Flexible Implementation**: Choose when to execute plans - implementation is optional and separate from enhanced discovery/planning
- **Progress Visibility**: Track work at project, phase, and task levels with comprehensive status monitoring
- **Team Collaboration**: Shared project-localized contexts enable consistent development approach with technology-specific workflows
- **Security Analysis**: Comprehensive STRIDE-based security review with technology-specific threat modeling and visual diagrams
- **Quality Assurance**: Built-in validation system with specialized validators ensures output quality across all workflows
- **Multi-Mode Flexibility**: Use globally for multiple projects or install project-specific versions with intelligent discovery-based localization
- **Research-Driven Command Generation**: Create tailored commands from research sources with workflow integration and validation
- **Enhanced Upgrade Management**: Parallel execution with backup management, rollback capabilities, and version tracking
- **System Reliability Improvements**: Fixed 15+ subagent_type references across upgrade, install, and claudio commands to match actual agent file names for consistent operation

## Getting Help

- **System Documentation**: Read `CLAUDE.md` for detailed system documentation
- **Sample Projects**: Explore `examples/` for sample projects to analyze
- **Agent Contexts**: Check `.claude/agents/claudio/prompts/` to understand how agents work
- **Available Commands**: Review `.claude/commands/claudio/` to see all available commands
- **Installation Help**: Use `/claudio:install --help` or `/claudio:upgrade --help` for system management
- **Status Checking**: Use `/claudio:upgrade --status` to verify your installation

## Troubleshooting

### Common Issues

#### Node.js Memory Issues
If Claude Code crashes with "JavaScript heap out of memory" errors when running multiple agents:

```bash
# Quick fix
export NODE_OPTIONS="--max-old-space-size=8192" && claude-code

# Permanent solution (add to ~/.zshrc or ~/.bashrc)
export NODE_OPTIONS="--max-old-space-size=8192"
```

For detailed memory management guidance, see: [Node.js Memory Issues Documentation](docs/troubleshooting/nodejs-memory-issues.md)

### Quick Start Commands
```bash
# Enhanced discovery and planning with 5 parallel specialist agents and 5x performance
/claudio:claudio /path/to/my/project

# Update documentation with parallel coordination (README, CLAUDE.md, changelogs)
/claudio:update-docs "enhanced discovery system with 5 parallel specialist agents"

# Research with complexity assessment and Think/Ultrathink modes
/claudio:research development react-testing --complexity=high

# Claude SDK sequential analysis with cross-system comparison
/claudio:claude-sdk command_name

# With optional implementation execution
/claudio:implement /path/to/my/project

# System management with enhanced parallel workflows
/claudio:install                    # Install with project-specific CLAUDE.md generation and auto test commands
/claudio:upgrade --check           # Check for updates with 6 parallel subagents and system component filtering  
/claudio:upgrade /path/to/project  # Upgrade with parallel execution, backup management, and version tracking
```

Start by simply telling Claude: **"Please use claudio:claudio on /path/to/my/project"** and experience the enhanced 5 parallel specialist agent discovery system with 5x performance improvement and comprehensive project understanding!
