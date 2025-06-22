# Claudio

A comprehensive project analysis and planning system for Claude Code that transforms any codebase into an organized, trackable development process.

## What is Claudio?

Claudio is a collection of specialized AI agent prompts and commands that work together to analyze projects and generate actionable implementation roadmaps. It orchestrates discovery, requirements documentation, implementation planning, and task organization through intelligent agents.

## Requirements

- **Claude Code CLI**: This system is designed for use with [Claude Code](https://claude.ai/code)
- The Claude Code CLI provides the runtime environment and tools that Claudio agents use
- No additional installations required - Claudio works within your existing Claude Code setup

## Quick Start

### Analyzing External Projects (Recommended)
To analyze code outside the Claudio directory:

```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access
claude --add-dir /path/to/my-code
# or with relative paths:
claude --add-dir ../my-code

# 3. Analyze the external project
/claudio /path/to/my-code
```

**Why use --add-dir?** This flag allows Claude Code to access and analyze projects outside the Claudio directory while keeping Claudio's system files separate from your project code.

### Option 2: The Claudio Workflow (Alternative for Teams)
Add Claudio to your existing project as a git submodule:
```bash
cd your-existing-project
git submodule add <claudio-repo-url> .claudio-system
git submodule update --init --recursive
```

Then start Claude Code from the submodule directory:
```bash
cd .claudio-system
claude
```

**The Claudio Workflow** allows you to:
- Keep Claudio updated across multiple projects
- Share the same analysis system with your team
- Version control your Claudio setup alongside your project
- Maintain consistency in project analysis across your organization

This will create a comprehensive `.claudio/` folder in your target project with:
- **Discovery Report**: Technology stack and capability analysis
- **Requirements Document**: Clear project objectives and success criteria  
- **Implementation Plan**: Phased roadmap with time estimates
- **Task Breakdown**: Executable tasks with specialized contexts
- **Progress Tracking**: Status monitoring at project, phase, and task levels

## How New Users Can Get Started

### For Project Analysis
1. **Clone and setup**: `git clone <repo> && cd claudio`
2. **Start Claude with access**: `claude --add-dir /path/to/your/project`
3. **Analyze your project**: "/claudio /path/to/your/project"
4. **Review the analysis**: Check the generated `.claudio/` folder in your project
5. **Begin implementation**: Follow the task breakdown and phase plan

### For Individual Tasks
Use specific commands for focused work:
```
/discovery ./my-app          # Analyze project structure
/documentation readme ./my-app   # Generate README
/prd feature user-auth       # Create requirements doc
/plan project my-app "8 weeks"   # Create implementation plan
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
    └── phase1/, phase2/   # Task breakdown with contexts
```

## Task Execution Model

### How Task Contexts Work
Claudio's task system has been designed for efficient, focused execution:

**Task Context Focus**: Each task context (`.claudio/phase*/task*/claude.md`) is designed to produce the next recommended prompt or action as output, rather than work summaries.

**Silent Processing**: Task agents work silently, updating status files for progress tracking instead of producing verbose terminal output.

**Status-First Tracking**: All progress information, work summaries, and updates are maintained in dedicated status files:

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

| Command | Purpose | Example |
|---------|---------|---------|
| `/claudio` | Complete project analysis | `/claudio ../my-app` |
| `/discovery` | Analyze project structure | `/discovery ./backend` |
| `/documentation` | Generate docs | `/documentation api ./my-api` |
| `/prd` | Create requirements | `/prd feature chat-system` |
| `/plan` | Implementation planning | `/plan project app "12 weeks"` |
| `/task` | Break down into tasks* | `/task plan.md my-project` |
| `/research` | Topic research | `/research security oauth2` |
| `/design` | UX/UI analysis & specs | `/design audit ./my-app material` |
| `/code-quality` | Code quality assessment* | `/code-quality full ./my-project` |
| `/newprompt` | Create new agent prompts | `/newprompt security-review "vulnerability analysis" standard` |

*Task command creates contexts that produce next actions and tracks progress in status.md files

*Optional command - see [Optional Commands](#optional-commands) for installation

## Adding New Prompts and Commands

### Quick Method: Use the NewPrompt Command
```bash
# Create a new agent and command automatically
/newprompt security-review "Comprehensive security analysis with vulnerability assessment" standard
```

The `/newprompt` command will:
- Create the agent prompt and command files
- Determine workflow integration (standard/optional/conditional)
- Generate integration instructions for existing files
- Update documentation and folder structures

### Manual Method: Step-by-Step
Want to add a security review prompt manually? Here's how:

### 1. Create the Agent Prompt
```bash
mkdir -p prompts/security-review
```

Create `prompts/security-review/claude.md`:
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
Create `.claude/commands/security-review.md`:
```markdown
# Security Review Command

## Description
Perform comprehensive security analysis of codebases with vulnerability assessment and remediation recommendations.

## Usage
/security-review <target_path> [security_standard]

## Parameters
- `target_path`: Path to code/project to review
- `security_standard`: Optional standard (OWASP, SOC2, etc.)

## Context
Use the security review agent prompt from `prompts/security-review/claude.md`.

## Instructions
1. Analyze code for security vulnerabilities
2. Review authentication and authorization
3. Check for common security anti-patterns
4. Generate remediation recommendations
5. **Direct Command**: Save to `security-reviews/<project>_security_review.md`
6. **Within Claudio**: Save to `<target>/.claudio/security-review.md`
```

### 3. Integration with Claudio
To integrate with the main Claudio workflow, update `prompts/claudio/claude.md` to include security review as an optional phase.

## Simple Usage Examples

### Just Starting Out
```bash
# 1. Clone Claudio
git clone <this-repo>
cd claudio

# 2. Start Claude with directory access
claude --add-dir ../my-react-app
# or with absolute paths:
claude --add-dir /Users/me/my-react-app

# 3. In Claude Code session:
/claudio ../my-react-app
# or:
/claudio /Users/me/my-react-app
```

### Specific Analysis
```
"Can you do a security review of /path/to/my-api"
"Generate documentation for /my/frontend/project"  
"Create a PRD for adding real-time chat to my app"
```

### Following Up
```
# Check progress via status files
"Show me the current status from /my-project/.claudio/status.md"
"What's the progress on phase 1 tasks?"

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
1. **Copy to Project**: Copy the command files to your project's `.claude/commands/` directory
2. **Symlink**: Create symlinks to stay updated with Claudio improvements
3. **Git Submodule**: Automatic availability when using Claudio as a submodule

**Usage Examples:**
```bash
# Full quality assessment
/code-quality full ./my-project

# Quick CI/CD check  
/code-quality quick . json

# Focus on test coverage
/code-quality coverage ./project detailed
```

**Supported Languages:** JavaScript/TypeScript, Python, Rust, Go, Elixir, Java, C#, PHP, Ruby

For detailed installation instructions and tool requirements, see the [code-quality documentation](./prompts/code-quality/README.md).

## Project Structure

```
claudio/
├── README.md              # This file
├── CLAUDE.md             # Detailed system documentation
├── prompts/              # Agent prompt contexts
│   ├── research/         # Topic research agent
│   ├── discovery/        # Project analysis agent
│   ├── documentation/    # Documentation generation
│   ├── prd/             # Requirements documentation
│   ├── plan/            # Implementation planning
│   ├── task/            # Task breakdown
│   ├── design/          # UX/UI analysis and specifications
│   ├── code-quality/    # Code quality assessment (optional)
│   ├── newprompt/       # Agent creation system
│   └── claudio/         # Master orchestration agent
├── .claude/
│   └── commands/        # Executable commands
├── examples/            # Sample projects for testing
│   ├── web-app/        # Deno.js task manager SPA with full Claudio analysis
│   └── rust-game/      # Bevy chess game
└── [generated folders]  # Created when using standalone commands
```

## Benefits

- **Instant Project Understanding**: Get comprehensive analysis of any codebase
- **Clear Implementation Path**: Receive actionable plans with time estimates
- **Organized Development**: Transform ad-hoc coding into systematic progress
- **Progress Visibility**: Track work at project, phase, and task levels
- **Team Collaboration**: Shared contexts enable consistent development
- **Quality Assurance**: Built-in review and testing requirements

## Getting Help

- Read `CLAUDE.md` for detailed system documentation
- Explore `examples/` for sample projects to analyze
- Check `prompts/` to understand how agents work
- Review `.claude/commands/` to see available commands

Start by simply telling Claude: **"Please use claudio on /path/to/my/project"** and see what happens!
