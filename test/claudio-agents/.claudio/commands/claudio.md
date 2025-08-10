# Claudio Command

## Command
`/claudio:claudio`

## Purpose
Complete Phoenix LiveView project analysis workflow that generates comprehensive documentation, requirements, and implementation plans.

## Usage
```
/claudio:claudio [path] [--force]
```

## Arguments
- `path`: Project directory to analyze (defaults to current directory)
- `--force`: Force complete re-analysis including existing documentation

## Agent Reference
Uses `claudio:claudio-coordinator-agent subagent` to orchestrate the complete workflow

## Process Overview
1. **Discovery Analysis**: Project structure and Phoenix LiveView capabilities
2. **Requirements Documentation**: PRD generation with Phoenix-specific context
3. **Implementation Planning**: Technical planning respecting Elixir/Phoenix patterns
4. **Task Breakdown**: Executable tasks aligned with Mix workflow
5. **Documentation Generation**: Comprehensive project documentation
6. **Quality Assurance**: Security review and code quality assessment
7. **Test Command Generation**: Phoenix and ExUnit-specific test commands

## Output Structure
```
.claudio/
├── docs/
│   ├── discovery.md          # Phoenix project analysis
│   ├── prd.md               # Product requirements
│   ├── plan.md              # Implementation plan
│   ├── executive-summary.md # Project overview
│   ├── api-documentation.md # Phoenix API docs
│   ├── user-guide.md        # Usage documentation
│   └── developer-guide.md   # Development guide
├── phase1/, phase2/, etc/   # Task breakdown by phase
├── quality/
│   ├── security-review.md   # Security assessment
│   ├── code-quality.md      # Quality analysis
│   └── design-evaluation.md # UI/UX assessment
└── status.md               # Progress tracking
```

## Phoenix LiveView Specializations
- **Component Preservation**: Maintains existing TaskAppWeb.CoreComponents customizations
- **LiveView Integration**: Understands real-time component patterns
- **Elixir Patterns**: Respects OTP application structure and Mix conventions
- **Testing Alignment**: Integrates with ExUnit, ExCoveralls, and testing patterns
- **Asset Pipeline**: Works with existing Tailwind CSS and esbuild setup

## Workflow Orchestration
- **Parallel Execution**: Optimized batch processing for improved performance
- **Dependency Management**: Ensures proper workflow prerequisites
- **Context Preservation**: Maintains project-specific customizations throughout
- **Quality Validation**: Comprehensive validation of all generated documentation

## Integration Benefits
- **Existing Workflow**: Enhances current Mix aliases and development patterns
- **Team Collaboration**: Provides shared context for Phoenix development team
- **Quality Assurance**: Integrates with existing Credo and Dialyxir setup
- **Documentation**: Generates comprehensive docs aligned with Phoenix conventions