# Claudio Skills Upgrade Plan

## Executive Summary

This document outlines the plan to merge `./claudio` and `./claude-skills` into a modernized plugin-based architecture that leverages Claude Code's native plugin system while maintaining claudio's powerful project localization and agent orchestration capabilities.

## Current State Analysis

### Claudio System
- **Location**: `/Users/vinnie/github/claudio`
- **Architecture**: 77+ specialized agents with extended_context knowledge enhancement
- **Structure**:
  - `.claude/commands/` - Slash commands
  - `.claude/agents/` - Agent implementations
  - `extended_context/` - Knowledge contexts by category
  - `.claudio/` - Generated project analysis
- **Key Features**:
  - Discovery-based project localization
  - Anti-fabrication policies
  - Universal argument extraction
  - Parallel agent coordination
  - Template-based development
  - Research system with complexity assessment

### Claude-Skills System
- **Location**: `/Users/vinnie/github/claude-skills`
- **Architecture**: Plugin with modular skills for domain expertise
- **Structure**:
  - `.claude-plugin/plugin.json` - Plugin manifest
  - `skills/` - Self-contained skill directories
  - `commands/` - Plugin commands
- **Key Features**:
  - Progressive disclosure pattern
  - YAML frontmatter for metadata
  - Autonomous activation based on context
  - Modular, shareable packages
  - Reference materials loaded on-demand

### Key Insight from User
> "Some features of claudio are no longer needed, and have been replaced by skills"

This suggests Claude Code's native capabilities now handle some of what claudio was originally built to provide.

## Identified Redundancies

### Features Replaced by Claude Code/Skills
1. **Basic agent invocation patterns** - Claude Code's Task tool now handles this natively
2. **Simple domain knowledge** - Skills provide better progressive disclosure
3. **Static documentation** - Skills' reference pattern is more efficient
4. **Some utility commands** - Now built into Claude Code

### Features to Preserve from Claudio
1. **Project discovery and localization** - Unique capability for project-specific customization
2. **Agent coordination patterns** - Complex multi-agent orchestration
3. **Anti-fabrication framework** - Critical for factual outputs
4. **Universal argument extraction** - Essential for agent coordination
5. **Template system** - Valuable for consistent development
6. **Research system with complexity assessment** - Unique approach to knowledge generation

## Target Architecture

### Modular Plugin System

```
claudio-core/                       # Core plugin - essential features
├── .claude-plugin/
│   └── plugin.json                 # Core manifest
├── commands/
│   ├── discovery.md                # Project analysis
│   ├── install.md                  # Localization installer
│   └── upgrade.md                  # Plugin upgrade system
├── agents/
│   ├── discovery-orchestrator.md   # Core discovery
│   ├── install-orchestrator.md     # Installation coordinator
│   └── localization-engine.md      # Project customization
└── skills/
    ├── project-analysis/           # Discovery as a skill
    ├── localization/               # Project customization
    └── anti-fabrication/           # Quality assurance

claudio-dev-skills/                 # Development practices plugin
├── .claude-plugin/
│   └── plugin.json
└── skills/
    ├── elixir/                     # From claude-skills
    ├── rust/                       # From claude-skills
    ├── git/                        # From claude-skills
    ├── code-review/                # From claude-skills
    └── testing/                    # From extended_context

claudio-planning/                   # Planning & execution plugin
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   ├── prd.md
│   ├── plan.md
│   ├── task.md
│   └── implement.md
├── agents/
│   ├── prd-agent.md
│   ├── plan-agent.md
│   └── task-agent.md
└── skills/
    ├── requirements/               # From extended_context
    ├── planning/                   # From extended_context
    └── implementation/             # From extended_context

claudio-quality/                    # Quality & security plugin
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   ├── test.md
│   ├── code-quality.md
│   └── security-review.md
├── agents/
│   ├── test-coordinator.md
│   ├── quality-analyzer.md
│   └── security-coordinator.md
└── skills/
    ├── testing/                    # From extended_context
    ├── quality/                    # From extended_context
    └── security/                   # From extended_context

claudio-docs/                       # Documentation plugin
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   ├── documentation.md
│   ├── research.md
│   └── update-docs.md
├── agents/
│   ├── documentation-coordinator.md
│   ├── research-specialist.md
│   └── readme-generator.md
└── skills/
    ├── documentation/              # From claude-skills
    ├── research/                   # From extended_context
    └── technical-writing/          # From extended_context

claudio-tools/                      # Tool-specific plugins
├── .claude-plugin/
│   └── plugin.json
└── skills/
    ├── mise/                       # From claude-skills
    ├── nushell/                    # From claude-skills
    ├── dagu/                       # From claude-skills
    └── docker/                     # From extended_context
```

## Migration Strategy

### Phase 1: Convert Extended Context to Skills

**Objective**: Transform claudio's `extended_context/` directories into properly structured skills with progressive disclosure.

#### Extended Context → Skills Mapping

| Current Extended Context | Target Skill Path | Skill Name |
|-------------------------|-------------------|------------|
| `extended_context/workflow/discovery/` | `claudio-core/skills/project-analysis/` | `project-analysis` |
| `extended_context/workflow/prd/` | `claudio-planning/skills/requirements/` | `requirements-engineering` |
| `extended_context/workflow/planning/` | `claudio-planning/skills/planning/` | `implementation-planning` |
| `extended_context/workflow/task/` | `claudio-planning/skills/task-breakdown/` | `task-breakdown` |
| `extended_context/development/quality/` | `claudio-quality/skills/quality/` | `code-quality` |
| `extended_context/development/design/` | `claudio-dev-skills/skills/design/` | `ux-design` |
| `extended_context/research/` | `claudio-docs/skills/research/` | `research-methodology` |
| `extended_context/documentation/` | `claudio-docs/skills/documentation/` | `technical-documentation` |
| `extended_context/infrastructure/` | `claudio-tools/skills/infrastructure/` | `infrastructure-patterns` |
| `extended_context/templates/` | `claudio-core/skills/templates/` | `template-system` |

#### Conversion Process

For each extended_context directory:

1. **Create SKILL.md** with YAML frontmatter:
```yaml
---
name: skill-name
description: When to activate this skill (from discovery, for planning, etc.)
license: MIT
---
```

2. **Extract core content** from extended_context overview.md → SKILL.md body
3. **Move detailed docs** to `references/` subdirectory
4. **Add activation criteria** based on when agents currently load this context
5. **Include examples** from current agent usage patterns
6. **Add troubleshooting** from current troubleshooting.md files

#### Example Conversion: Research Skill

**Current**: `.claude/agents/claudio/extended_context/research/overview.md`

**Target**: `claudio-docs/skills/research/SKILL.md`

```markdown
---
name: research-methodology
description: Activate when conducting topic research, assessing complexity, creating knowledge documentation, or filling knowledge gaps
license: MIT
---

# Research Methodology Skill

Activate this skill when you need to research a topic, assess its complexity, or create comprehensive knowledge documentation.

## When to Use

- Creating research documentation for new topics
- Assessing topic complexity for thinking mode selection
- Filling knowledge gaps identified during project work
- Generating agent prompts from research
- Creating reference materials for teams

## Complexity Assessment Framework

[Core content from overview.md - simplified]

See references/complexity-framework.md for detailed scoring criteria.

## Research Process

[High-level process from overview.md]

See references/research-workflow.md for complete step-by-step procedures.

## Output Formats

[Brief examples]

See references/templates/ for complete templates.
```

**References structure**:
```
claudio-docs/skills/research/
├── SKILL.md                        # Core skill
└── references/
    ├── complexity-framework.md     # Detailed scoring
    ├── research-workflow.md        # Complete process
    ├── templates/                  # Output templates
    └── examples/                   # Sample research outputs
```

### Phase 2: Core Plugin Architecture

**Objective**: Create `claudio-core` plugin with essential discovery and localization features.

#### Core Components

1. **Discovery System** (Preserve from claudio)
   - `/discovery` command
   - Parallel analysis architecture (5 agents)
   - Project classification
   - Technology stack detection
   - Architecture analysis

2. **Localization Engine** (Preserve from claudio)
   - `/install` command with project-specific customization
   - Discovery-based adaptation
   - Technology-aware workflows
   - Component filtering (system vs user)

3. **Upgrade System** (Preserve from claudio)
   - `/upgrade` command
   - Parallel upgrade agents
   - Backup management
   - Changelog generation

4. **Core Skills**
   - `project-analysis` - Discovery capabilities
   - `localization` - Project customization
   - `anti-fabrication` - Quality standards
   - `argument-extraction` - Agent coordination

#### plugin.json Structure

```json
{
  "name": "claudio-core",
  "displayName": "Claudio Core",
  "version": "2.0.0",
  "description": "Project discovery, analysis, and localization engine for Claude Code. Provides intelligent project understanding and context-aware customization.",
  "author": "vinnie",
  "repository": "https://github.com/vinnie/claudio-core",
  "dependencies": [],
  "commands": [
    "commands/discovery.md",
    "commands/install.md",
    "commands/upgrade.md"
  ],
  "agents": [
    "agents/discovery-orchestrator.md",
    "agents/discovery-structure-analyzer.md",
    "agents/discovery-tech-analyzer.md",
    "agents/discovery-architecture-analyzer.md",
    "agents/discovery-integration-analyzer.md",
    "agents/discovery-consolidator.md",
    "agents/install-orchestrator.md",
    "agents/localization-engine.md",
    "agents/upgrade-orchestrator.md"
  ],
  "skills": [
    "skills/project-analysis",
    "skills/localization",
    "skills/anti-fabrication",
    "skills/argument-extraction"
  ]
}
```

### Phase 3: Specialized Plugin Modules

**Objective**: Create optional plugin modules for different use cases.

#### claudio-dev-skills Plugin

**Target Users**: Developers working with specific languages/frameworks

**Contents**:
- All skills from `claude-skills` (Elixir, Rust, Git, etc.)
- Converted development skills from claudio extended_context
- Design and UX skills
- Tool-specific skills (mise, nushell, dagu)

**Installation**: `claude-code plugin install claudio-dev-skills`

#### claudio-planning Plugin

**Target Users**: Teams doing structured project planning

**Contents**:
- `/prd`, `/plan`, `/task`, `/implement` commands
- Planning agents from claudio
- Requirements engineering skill
- Implementation planning skill
- Task breakdown skill

**Installation**: `claude-code plugin install claudio-planning`

#### claudio-quality Plugin

**Target Users**: Teams focused on quality assurance and security

**Contents**:
- `/test`, `/code-quality`, `/security-review` commands
- Quality and security agents
- Testing skill with framework detection
- Code quality skill
- Security analysis skill

**Installation**: `claude-code plugin install claudio-quality`

#### claudio-docs Plugin

**Target Users**: Documentation-focused teams

**Contents**:
- `/documentation`, `/research`, `/update-docs` commands
- Documentation agents
- Research methodology skill
- Technical writing skill
- Documentation generation skill

**Installation**: `claude-code plugin install claudio-docs`

### Phase 4: Project Localization Integration

**Objective**: Maintain claudio's powerful localization while working with plugin architecture.

#### Localization Flow

```
User runs: /discovery

↓

Discovery analyzes project:
- Technology stack
- Frameworks
- Architecture patterns
- Testing setup
- Documentation needs

↓

User runs: /install

↓

Localization engine:
1. Reads discovery results
2. Determines required plugins
3. Suggests plugin installation
4. Customizes installed plugin components
5. Generates project-specific configs

↓

Result: Customized plugin setup for this specific project
```

#### Example Localization Scenario

**Project**: Elixir Phoenix web application with PostgreSQL

**Discovery Output**:
```markdown
## Technology Stack
- Language: Elixir 1.15
- Framework: Phoenix 1.7
- Database: PostgreSQL 15
- Testing: ExUnit
- Build: Mix
```

**Localization Recommendations**:
```markdown
## Suggested Plugins
1. claudio-core (required) - Project analysis and localization
2. claudio-dev-skills (recommended) - Elixir, Phoenix, Git skills
3. claudio-planning (optional) - Structured planning workflows
4. claudio-quality (recommended) - ExUnit testing, code quality
5. claudio-docs (optional) - Documentation generation

## Project-Specific Customizations
- Generated /test command using ExUnit
- Phoenix LiveView skill activated
- Elixir OTP skill activated
- PostgreSQL optimization skill activated
```

**User Experience**:
```bash
# User runs discovery
/discovery

# Claude suggests:
# "I've analyzed your Phoenix project. I recommend installing:
# - claudio-dev-skills (Elixir/Phoenix expertise)
# - claudio-quality (ExUnit testing)
#
# Would you like me to install these plugins?"

# User confirms, localization engine:
1. Installs recommended plugins
2. Activates relevant skills
3. Generates project-specific test command
4. Creates .claude/settings.json with project config
```

### Phase 5: Skill Progressive Disclosure

**Objective**: Optimize context usage with progressive disclosure pattern.

#### Disclosure Levels

**Level 1: Plugin Manifest** (Always loaded)
- Skill name and description only
- Claude decides when to activate

**Level 2: SKILL.md** (Loaded when activated)
- Core procedural knowledge
- Activation criteria
- Key concepts and patterns
- Common examples

**Level 3: References** (Loaded on-demand)
- Detailed documentation
- Complete API references
- Advanced troubleshooting
- Edge cases and scenarios

#### Example: Elixir Phoenix Skill

**Level 1** (in plugin.json):
```json
{
  "skills": [
    "skills/elixir/phoenix"
  ]
}
```

**Level 2** (SKILL.md - 2-3KB):
```markdown
---
name: elixir-phoenix
description: Phoenix web framework development including LiveView, contexts, channels, and best practices
---

# Phoenix Framework Skill

## When to Activate
- Working with Phoenix applications
- Creating LiveView components
- Implementing contexts
- Setting up channels
- Following Phoenix conventions

## Core Patterns
[Brief overview of key patterns]

## Common Examples
[3-5 practical code examples]

For detailed API reference, see references/api-guide.md
For LiveView patterns, see references/liveview-patterns.md
```

**Level 3** (references/ - 20-30KB):
- `references/api-guide.md` - Complete Phoenix API
- `references/liveview-patterns.md` - LiveView deep-dive
- `references/context-design.md` - Context best practices
- `references/testing.md` - Phoenix testing strategies
- `references/troubleshooting.md` - Common issues

### Phase 6: Agent Simplification

**Objective**: Reduce agent count by leveraging skills, keep only coordination agents.

#### Current: 77+ Agents

Many agents are specialized for specific domains (e.g., `phoenix-dev-executor`, `react-hooks-analyzer`).

#### Target: ~20 Core Agents

**Coordination Agents** (Keep):
- `discovery-orchestrator` - Coordinates discovery analysis
- `install-orchestrator` - Manages installation
- `prd-coordinator` - Coordinates requirements
- `plan-coordinator` - Coordinates planning
- `task-coordinator` - Coordinates task breakdown
- `test-coordinator` - Coordinates testing
- `quality-coordinator` - Coordinates quality analysis
- `security-coordinator` - Coordinates security review
- `documentation-coordinator` - Coordinates doc generation

**Analysis Agents** (Keep):
- `discovery-structure-analyzer`
- `discovery-tech-analyzer`
- `discovery-architecture-analyzer`
- `discovery-integration-analyzer`
- `discovery-consolidator`

**Utility Agents** (Keep):
- `localization-engine`
- `upgrade-orchestrator`
- `research-specialist`

**Domain-Specific Agents** (Remove → Convert to Skills):
- `phoenix-dev-executor` → `elixir/phoenix` skill
- `react-hooks-analyzer` → `react/hooks` skill
- `postgresql-optimizer` → `postgresql-optimization` skill
- All language/framework-specific agents → Skills

#### Agent → Skill Conversion Example

**Current**: `phoenix-dev-executor` agent (dedicated agent)

**Target**: `elixir/phoenix` skill (activated on-demand)

**Before** (Agent):
```markdown
I am the Phoenix Development Executor specialized in Phoenix framework...
[5KB of Phoenix-specific knowledge in agent file]
```

**After** (Skill):
```markdown
---
name: elixir-phoenix
description: Activate for Phoenix framework development tasks
---

[2KB core knowledge in SKILL.md]
[20KB detailed knowledge in references/]
```

**Benefits**:
- Context only loaded when working with Phoenix
- More efficient token usage
- Better separation of concerns
- Easier to maintain and update

## Implementation Roadmap

### Week 1: Foundation & Conversion

#### Days 1-2: Core Plugin Setup
- [ ] Create `claudio-core` directory structure
- [ ] Write core `plugin.json` manifest
- [ ] Extract discovery commands and agents
- [ ] Test discovery system in plugin format

#### Days 3-5: Extended Context → Skills Conversion
- [ ] Identify all extended_context directories
- [ ] Create skill directory structure for each
- [ ] Convert overview.md → SKILL.md with frontmatter
- [ ] Move detailed content → references/
- [ ] Add activation criteria
- [ ] Test skill activation

### Week 2: Specialized Plugins

#### Days 1-2: claudio-dev-skills
- [ ] Merge claude-skills content
- [ ] Convert development extended_context
- [ ] Create plugin manifest
- [ ] Test with sample projects

#### Days 3-4: claudio-planning
- [ ] Extract planning commands
- [ ] Convert planning extended_context
- [ ] Create plugin manifest
- [ ] Test planning workflow

#### Day 5: claudio-quality & claudio-docs
- [ ] Extract quality/security/docs commands
- [ ] Convert relevant extended_context
- [ ] Create plugin manifests
- [ ] Test each plugin

### Week 3: Integration & Localization

#### Days 1-2: Localization Engine
- [ ] Adapt install command for plugins
- [ ] Create plugin recommendation logic
- [ ] Implement project-specific customization
- [ ] Test with multiple project types

#### Days 3-4: Agent Simplification
- [ ] Identify coordination vs domain agents
- [ ] Convert domain agents → skills
- [ ] Update coordinator agents
- [ ] Test agent orchestration

#### Day 5: Integration Testing
- [ ] Test full workflow (discovery → install → use)
- [ ] Test plugin combinations
- [ ] Test localization accuracy
- [ ] Test skill activation

### Week 4: Documentation & Polish

#### Days 1-2: Documentation
- [ ] Write plugin README files
- [ ] Create installation guides
- [ ] Document skill structure
- [ ] Create migration guide from claudio v1

#### Days 3-4: Examples & Testing
- [ ] Create example projects
- [ ] Test with Elixir project
- [ ] Test with Rust project
- [ ] Test with multi-language project

#### Day 5: Release Preparation
- [ ] Version all plugins to 2.0.0
- [ ] Create CHANGELOG files
- [ ] Tag releases
- [ ] Publish to marketplace

## Technical Considerations

### Anti-Fabrication in Skills

Skills must maintain claudio's anti-fabrication standards:

```markdown
---
name: skill-name
description: Skill description
---

# Skill Name

## Anti-Fabrication Requirements

When using this skill, ensure:
- Base all outputs on actual tool execution and file analysis
- Execute Read, Glob, or validation tools before making claims
- Mark uncertain information as "requires analysis"
- Use factual language without superlatives
- Never provide estimates without measurement

[Rest of skill content]
```

### Universal Argument Extraction

Coordination agents must maintain argument extraction patterns:

```markdown
## Argument Extraction Instructions

When invoked via Task tool, look for "pass the [argument_name] argument" followed by a value. Extract and use throughout operations.

### Common Argument Patterns:
- project_path: Extract and use for all file operations
- changes-description: Extract for targeted updates
- complexity-level: Extract for thinking mode selection

[Agent implementation]
```

### Progressive Disclosure Implementation

Skills must implement 3-level disclosure:

```
skills/skill-name/
├── SKILL.md                    # Level 2: Core knowledge (2-4KB)
└── references/                 # Level 3: Detailed docs (loaded on-demand)
    ├── api-reference.md
    ├── patterns.md
    ├── troubleshooting.md
    └── examples/
```

Claude Code handles Level 1 (skill name/description in manifest) automatically.

### Skill Activation Criteria

Each skill must define clear activation criteria:

```markdown
## When to Use This Skill

Activate when:
- Working with [specific technology]
- Implementing [specific pattern]
- Solving [specific problem]
- User mentions [specific keywords]

Do not activate when:
- [Scenarios where skill is not relevant]
```

### Plugin Dependencies

Define dependencies in plugin.json:

```json
{
  "name": "claudio-planning",
  "dependencies": ["claudio-core"],
  "optionalDependencies": ["claudio-quality"]
}
```

This ensures:
- Core features available when needed
- Graceful degradation if optional plugins missing
- Clear installation requirements

## Migration Path for Users

### Current Claudio Users

**Step 1**: Install new plugins
```bash
# Essential
claude-code plugin install claudio-core

# Optional (based on needs)
claude-code plugin install claudio-dev-skills
claude-code plugin install claudio-planning
claude-code plugin install claudio-quality
claude-code plugin install claudio-docs
```

**Step 2**: Run discovery on existing projects
```bash
cd your-project
/discovery
```

**Step 3**: Let localization recommend plugins
```bash
/install
# Will suggest relevant plugins based on project
```

**Step 4**: Remove old claudio submodule
```bash
git rm claudio
rm -rf .claude/agents/claudio
rm -rf .claude/commands/claudio
```

### New Users

**Step 1**: Install core
```bash
claude-code plugin install claudio-core
```

**Step 2**: Run discovery
```bash
cd your-project
/discovery
```

**Step 3**: Install recommended plugins
```bash
# Based on discovery recommendations
claude-code plugin install claudio-dev-skills  # If working with code
claude-code plugin install claudio-planning    # If doing planning
```

## Success Metrics

### Performance Metrics
- [ ] Context usage reduced by 40%+ via progressive disclosure
- [ ] Skill activation time < 100ms
- [ ] Discovery analysis completes in < 30 seconds
- [ ] Plugin installation < 5 seconds per plugin

### User Experience Metrics
- [ ] Users can find relevant skills easily
- [ ] Skill activation feels natural and automatic
- [ ] Plugin recommendations are accurate
- [ ] Localization produces project-specific results

### Code Quality Metrics
- [ ] 100% of extended_context converted to skills
- [ ] Agent count reduced from 77 → ~20 core agents
- [ ] All plugins have comprehensive documentation
- [ ] All skills have clear activation criteria

## Open Questions & Decisions Needed

### 1. Marketplace Strategy
**Question**: Should we publish to official Claude Code marketplace or maintain independent distribution?

**Options**:
- A) Official marketplace (wider reach, official support)
- B) Independent GitHub-based marketplace (more control)
- C) Both (maximum flexibility)

**Recommendation**: Start with B, migrate to A when mature

### 2. Skill Naming Convention
**Question**: How should we name skills for clarity and discovery?

**Current patterns**:
- Language-specific: `elixir/phoenix`, `rust/async`
- Task-specific: `code-review`, `documentation`
- Tool-specific: `git`, `mise`, `docker`

**Recommendation**: Keep current pattern, add namespace for claudio-specific: `claudio/discovery`, `claudio/localization`

### 3. Backward Compatibility
**Question**: Should we maintain backward compatibility with claudio v1 commands?

**Options**:
- A) Full compatibility (alias old commands to new)
- B) Migration guide only (clean break)
- C) Hybrid (core commands compatible, deprecated ones documented)

**Recommendation**: Option C - maintain compatibility for `/discovery`, `/plan`, `/test`; provide migration guide for others

### 4. Version Strategy
**Question**: How should we version the plugin system?

**Proposal**:
- All plugins start at 2.0.0 (signaling major change from claudio v1)
- Semantic versioning for each plugin independently
- claudio-core acts as reference for compatible versions

### 5. Skill Bundling
**Question**: Should we allow users to create custom skill bundles?

**Example**: "Full-stack Elixir bundle" = elixir/phoenix + elixir/otp + postgresql + git

**Recommendation**: Phase 2 feature after initial release

## Risk Analysis

### High Risk
**Risk**: Users rely on claudio v1 patterns that break in v2
**Mitigation**: Comprehensive migration guide, compatibility layer for core commands, gradual deprecation

**Risk**: Plugin performance issues (slow loading, high memory)
**Mitigation**: Aggressive progressive disclosure, lazy loading, performance testing before release

### Medium Risk
**Risk**: Skill activation doesn't work intuitively
**Mitigation**: Extensive testing with real projects, clear activation criteria, user feedback loop

**Risk**: Localization recommendations are inaccurate
**Mitigation**: Maintain high-quality discovery analysis, build feedback mechanism, iterate on recommendation logic

### Low Risk
**Risk**: Plugin dependencies create installation complexity
**Mitigation**: Clear dependency documentation, helpful error messages, installation wizard

## Next Steps

### Immediate Actions
1. **Validate plan with user** - Get feedback on this document
2. **Prototype core plugin** - Build minimal claudio-core with one skill
3. **Test conversion process** - Convert one extended_context → skill manually
4. **Create automation tools** - Scripts to assist with bulk conversion

### Research Needed
1. **Claude Code plugin API** - Deep dive into official plugin capabilities
2. **Skill performance** - Benchmark progressive disclosure vs full context
3. **User workflows** - Study how current claudio users work
4. **Plugin marketplace** - Understand distribution options

### Decisions Required
1. Approve overall architecture (modular plugins)
2. Approve skill conversion approach (extended_context → skills)
3. Approve agent simplification (77 → 20)
4. Set release timeline
5. Determine marketplace strategy

## Appendix A: Skill Conversion Template

### Template for Converting Extended Context → Skill

```markdown
# Original Extended Context
Location: .claude/agents/claudio/extended_context/[category]/[topic]/

Files:
- overview.md
- troubleshooting.md
- examples.md
- (other references)

# Target Skill Structure
Location: claudio-[plugin]/skills/[skill-name]/

# Conversion Steps

## Step 1: Create SKILL.md
- Extract name and description from overview.md
- Add YAML frontmatter
- Copy core concepts (keep brief, 2-4KB)
- Add activation criteria
- Add 3-5 key examples
- Reference detailed docs

## Step 2: Create references/
- Move troubleshooting.md → references/troubleshooting.md
- Move examples.md → references/examples.md
- Move other docs → references/[appropriate-name].md

## Step 3: Update Activation Criteria
- When should this skill activate?
- What keywords trigger it?
- What project types need it?
- When should it NOT activate?

## Step 4: Add Progressive Disclosure
- Ensure SKILL.md is self-contained
- References loaded only when needed
- Clear navigation to references

## Step 5: Test
- Load skill in test project
- Verify activation works
- Test reference loading
- Validate content accuracy
```

## Appendix B: Plugin Manifest Template

```json
{
  "name": "claudio-[plugin-name]",
  "displayName": "Claudio [Display Name]",
  "version": "2.0.0",
  "description": "[One-line description of plugin purpose and capabilities]",
  "author": "vinnie",
  "repository": "https://github.com/vinnie/claudio-[plugin-name]",
  "homepage": "https://github.com/vinnie/claudio-[plugin-name]#readme",
  "license": "MIT",
  "keywords": ["claudio", "[domain]", "[technology]"],
  "dependencies": [
    "claudio-core"
  ],
  "optionalDependencies": [
    "claudio-[optional-plugin]"
  ],
  "commands": [
    "commands/[command-name].md"
  ],
  "agents": [
    "agents/[agent-name].md"
  ],
  "skills": [
    "skills/[skill-name]"
  ]
}
```

## Appendix C: Example Skill Migration

### Before: Extended Context

**File**: `.claude/agents/claudio/extended_context/research/overview.md`

```markdown
# Research Agent Prompt Generator

You are a specialized research agent that creates comprehensive, topic-specific prompts...

## Your Process:
1. Assess Topic Complexity: Evaluate using criteria...
2. Select Thinking Mode: Standard/Think/Ultrathink...
3. Research the Topic: Use research tools...
4. Generate Specialized Agent Prompt...

[15KB of detailed content]
```

### After: Skill

**File**: `claudio-docs/skills/research/SKILL.md` (2KB)

```yaml
---
name: research-methodology
description: Activate when conducting topic research, assessing complexity, or creating knowledge documentation
license: MIT
---

# Research Methodology Skill

## When to Activate
- Creating research documentation
- Assessing topic complexity
- Filling knowledge gaps
- Generating reference materials

## Complexity Assessment
Evaluate topics using 4 criteria:
- Scope Breadth (1-3)
- Technical Depth (1-3)
- Integration Complexity (1-2)
- Source Availability (1-2)

Total score determines thinking mode:
- 4-5: Standard
- 6-8: Think
- 9-10: Ultrathink

See references/complexity-framework.md for detailed scoring.

## Research Process
1. Assess complexity
2. Select thinking mode
3. Research using appropriate depth
4. Generate documentation

See references/research-workflow.md for complete steps.

## Example Output
[Brief example]

For complete templates, see references/templates/
```

**File**: `claudio-docs/skills/research/references/complexity-framework.md` (5KB)

```markdown
# Complexity Assessment Framework

[Detailed scoring criteria from original]
```

**File**: `claudio-docs/skills/research/references/research-workflow.md` (8KB)

```markdown
# Research Workflow

[Complete step-by-step process from original]
```

## Summary

This upgrade transforms claudio from a monolithic agent system into a modern, modular plugin architecture that:

1. **Reduces complexity** - From 77 agents to ~20 core coordinators
2. **Improves efficiency** - Progressive disclosure reduces context usage
3. **Increases flexibility** - Modular plugins let users install what they need
4. **Maintains power** - Project localization and discovery preserved
5. **Better UX** - Skills activate automatically based on context
6. **Easier maintenance** - Clear separation between coordination and domain knowledge

The system evolves from "one tool that does everything" to "composable tools that work together," while preserving the unique capabilities that make claudio valuable: intelligent project discovery, context-aware localization, and anti-fabrication quality standards.
