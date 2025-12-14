# Claudio Plugin Conversion Plan

## Overview

This document outlines a proposed conversion strategy to transform the valuable components of the **claudio** system (80 agents, 24 commands, extensive extended_context) into a modern plugin-based architecture using the **claude-skills** marketplace structure.

## Current State Analysis

### Claudio System (`/Users/vinnie/github/claudio`)

**Structure:**
- `.claude/commands/claudio/` - 24 slash commands
- `.claude/agents/claudio/` - 80 specialized agents
- `.claude/agents/claudio/extended_context/` - Categorized knowledge contexts
- `.claudio/` - Generated project analysis and localization

**Key Commands (24 total):**
- `discovery.md` - Project analysis with parallel agents
- `prd.md` - Requirements documentation
- `plan.md` - Implementation planning
- `task.md` - Task breakdown
- `implement.md` - Implementation execution
- `test.md`, `test-review.md` - Testing workflows
- `code-quality.md`, `security-review.md` - Quality assurance
- `documentation.md`, `update-docs.md` - Documentation generation
- `research.md` - Topic research with complexity assessment
- `install.md`, `upgrade.md` - System management
- `phoenix-dev.md`, `design.md` - Domain-specific workflows
- `gcms.md` - Git commit messages
- Plus: `newprompt.md`, `new-command.md`, `generate-test-commands.md`, etc.

**Extended Context Categories:**
- `workflow/` - discovery, prd, planning, task
- `development/` - design, react-hooks, code_quality, postgresql-optimization
- `infrastructure/` - upgrade, installation
- `documentation/` - Documentation practices
- `research/` - Research methodology
- `testing/` - Testing practices
- `templates/` - Template system
- `phoenix-dev/` - Phoenix-specific knowledge
- `meta/`, `claudio/`, `generation/` - System management

**Key Patterns:**
- **Argument Extraction**: Universal pattern for passing context between agents
- **Anti-Fabrication**: Strict validation requirements
- **TodoWrite Management**: Phase-based workflow tracking
- **Parallel Coordination**: Multiple agents working simultaneously
- **Project Localization**: Discovery-based project customization

### Claude-Skills System (`/Users/vinnie/github/claude-skills`)

**Structure:**
- `.claude-plugin/marketplace.json` - Marketplace definition
- 7 plugins: `claudio`, `core`, `elixir`, `rust`, `dagu`, `ui`, `claude-code`
- Each plugin has `plugin.json`, `skills/`, optional `commands/`, `agents/`
- 25+ skills with progressive disclosure pattern

**Architecture:**
- YAML frontmatter in SKILL.md files
- Progressive disclosure (manifest → SKILL.md → references/)
- Independent plugin installation
- Composable skills system

## Clarifying Questions

Before proceeding with the conversion, I need clarification on several key decisions:

### 1. Plugin Organization Strategy

**Question**: How should we organize the 24 commands and 80 agents into plugins?

**Option A: Functional Grouping** (Aligned with upgrade plan)
- `claudio-core` - Discovery, install, upgrade, anti-fabrication
- `claudio-planning` - PRD, plan, task, implement workflows
- `claudio-quality` - Test, code-quality, security-review
- `claudio-docs` - Documentation, research, update-docs
- `claudio-dev` - Phoenix-dev, design, domain-specific

**Option B: Workflow-Based Grouping**
- `claudio-discovery` - Just discovery and project analysis
- `claudio-workflow` - PRD, plan, task, implement as single workflow
- `claudio-quality` - All quality/testing/security together
- `claudio-knowledge` - Research, documentation, templates

**Option C: Minimal Consolidation**
- `claudio` - Everything as one large plugin (simpler but less modular)
- Organize internally with clear namespacing

**Recommendation**: Option A aligns with the upgrade plan, but I'm open to preferences.

### 2. Commands vs Skills vs Agents

**Question**: For each of the 24 commands, should they become:

**A) Slash Commands in Plugins?**
- Keep as slash commands (e.g., `/discovery`, `/prd`, `/plan`)
- Users invoke explicitly
- Commands coordinate agents/skills behind the scenes
- **Pros**: Familiar workflow, explicit control
- **Cons**: Requires user to know what to invoke

**B) Skills with Auto-Activation?**
- Convert to skills that activate contextually
- Claude decides when to use them
- **Pros**: More autonomous, progressive disclosure
- **Cons**: Less explicit control, harder to predict

**C) Hybrid Approach?**
- Core workflows remain as commands (discovery, prd, plan, task)
- Supporting capabilities become skills (code-quality, security patterns)
- **Pros**: Best of both worlds
- **Cons**: More complex architecture

**Current Thinking**: Hybrid seems best - key workflows as commands, domain knowledge as skills.

### 3. Agent Consolidation Strategy

**Question**: With 80 agents, how aggressively should we consolidate?

**Current Categories of Agents:**
- **Coordination Agents** (~15): Discovery orchestrators, install coordinators, upgrade managers
- **Analysis Agents** (~10): Structure analyzers, tech analyzers, architecture analyzers
- **Domain Agents** (~25): Phoenix-dev, React-hooks, PostgreSQL optimization
- **Generation Agents** (~15): PRD generators, documentation generators, test generators
- **Utility Agents** (~15): Validators, formatters, summarizers

**Option A: Aggressive Consolidation** (80 → ~20)
- Keep only coordination and analysis agents
- Convert all domain agents to skills
- Merge similar generation agents
- **Target**: ~20 core agents as per upgrade plan

**Option B: Moderate Consolidation** (80 → ~40)
- Keep coordination, analysis, and key generation agents
- Convert only pure domain knowledge to skills
- Preserve specialized workflows as agents

**Option C: Minimal Consolidation** (80 → ~60)
- Only remove truly redundant agents
- Keep most agent-based workflows intact
- Focus on organizing rather than reducing

**Recommendation**: Option A - aggressive consolidation with skills handling domain knowledge.

### 4. Extended Context Conversion

**Question**: How should we convert the extended_context knowledge bases?

**Current Extended Context:**
- `workflow/discovery/overview.md`
- `workflow/prd/overview.md`
- `workflow/planning/overview.md`
- `development/design/overview.md`
- `development/phoenix-dev/overview.md`
- `documentation/overview.md`
- `research/overview.md`
- etc.

**Conversion Options:**

**A) Direct to Skills**
- Each extended_context → one skill
- `workflow/discovery/` → `claudio-core/skills/project-discovery/`
- `development/phoenix-dev/` → `claudio-dev/skills/phoenix-development/`
- Keep overview.md content in SKILL.md, detailed content in references/

**B) Bundled into Agent Context**
- Keep as reference material for agents
- Don't expose as standalone skills
- Agents load contextually when needed

**C) Hybrid**
- Core workflows (discovery, prd, planning) → bundled with agents
- Domain knowledge (phoenix-dev, design, postgresql) → skills
- Research/documentation → skills

**Recommendation**: Option A - convert to skills for maximum reusability.

### 5. Templates System

**Question**: What should happen to the templates system?

**Current Templates:**
- `extended_context/templates/` directory
- Template generation agents
- Used by various commands

**Options:**

**A) Skills-Based Templates**
- Create `claudio-templates` skill
- Templates loaded on-demand as references
- Skills guide template usage

**B) Asset Files**
- Keep as `assets/` in relevant plugins
- Not loaded into context
- Generated when needed

**C) Remove Templates**
- Templates now redundant with Claude Code capabilities
- Just provide patterns in skills instead

**What types of templates are most valuable to preserve?**

### 6. Project Localization Strategy

**Question**: How should discovery-based project localization work with plugins?

**Current Flow:**
1. `/discovery` analyzes project
2. Creates `.claudio/docs/discovery.md`
3. `/install` reads discovery
4. Localizes agents/commands for project

**Plugin-Based Options:**

**A) Plugin Recommendation**
- `/discovery` analyzes project
- Recommends which plugins to install
- User installs suggested plugins
- Plugins auto-configure based on discovery

**B) Dynamic Configuration**
- Core plugin always installed
- Discovery creates `.claude/settings.json` config
- Skills activate based on project type
- No need to install domain plugins

**C) Hybrid**
- Core discovery recommends plugins
- Installed plugins customize based on discovery
- Project-specific settings in `.claude/`

**Which approach aligns best with your vision?**

### 7. Backward Compatibility

**Question**: Should existing claudio users be able to migrate smoothly?

**Options:**

**A) Full Compatibility**
- Maintain `/discovery`, `/prd`, `/plan` command names
- Keep `.claudio/` directory structure
- Provide migration script
- Allow gradual transition

**B) Clean Break**
- New command names (e.g., `/claudio-discover`)
- New directory structure
- Migration guide only
- Fresh start

**C) Alias System**
- New plugin structure
- Old command names aliased to new
- Deprecation warnings
- 6-month compatibility period

**Recommendation**: Option A or C - respect existing workflows.

### 8. Anti-Fabrication Framework

**Question**: How should anti-fabrication requirements be enforced?

**Current Approach:**
- Embedded in every agent
- Repeated instructions about validation
- TodoWrite requirements
- Factual language enforcement

**Plugin Options:**

**A) Core Skill**
- `anti-fabrication` skill in claudio-core
- All other skills reference it
- Loaded automatically with other skills
- Central enforcement

**B) Plugin-Level Requirements**
- Each plugin defines anti-fabrication in manifest
- Skills inherit from plugin
- Consistent across all claudio plugins

**C) Per-Skill Enforcement**
- Each skill includes anti-fabrication section
- Redundant but explicit
- Current pattern in claude-skills

**Which ensures best compliance?**

### 9. Research System

**Question**: The research system is unique - how should it integrate?

**Current Features:**
- Complexity assessment (4-10 scale)
- Thinking mode selection (standard/think/ultrathink)
- Automatic documentation generation
- Creates overview.md + troubleshooting.md

**Options:**

**A) Research Command + Skill**
- Keep `/research` command
- Add `research-methodology` skill
- Command uses skill for execution
- Preserves full workflow

**B) Convert to Agent + Skill**
- `research-specialist` agent (keep current)
- `research-methodology` skill for guidance
- Remove command (use agent directly)

**C) Pure Skill**
- No command or dedicated agent
- Just `research-methodology` skill
- Claude uses when needed
- Simplest approach

**The research system seems valuable - preserve as-is, simplify, or enhance?**

### 10. Naming Conventions

**Question**: How should we name skills derived from claudio?

**Options:**

**A) Descriptive Names**
- `project-discovery`
- `requirements-engineering`
- `implementation-planning`
- Clear purpose from name

**B) Claudio-Prefixed**
- `claudio-discovery`
- `claudio-prd`
- `claudio-planning`
- Clear origin

**C) Namespaced**
- `claudio/discovery`
- `claudio/requirements`
- `claudio/planning`
- Plugin namespace

**Recommendation**: Option A - descriptive names that stand alone.

### 11. Testing and Quality Commands

**Question**: Several testing commands exist - how to consolidate?

**Current Commands:**
- `test.md` - Run tests
- `test-review.md` - Review test coverage
- `code-quality.md` - Code quality analysis
- `security-review.md` - Security audit
- `generate-test-commands.md` - Generate project-specific test commands

**Options:**

**A) Single Quality Plugin**
- `claudio-quality` with all commands
- Unified quality workflow
- `/quality` command with subcommands?

**B) Separate Concerns**
- `claudio-testing` - test, test-review, generate
- `claudio-security` - security-review
- `claudio-quality` - code-quality
- Modular installation

**C) Skills-First**
- Convert to skills with guidelines
- Remove explicit commands
- Let Claude apply quality practices

**Preference for testing/quality organization?**

### 12. Meta Commands

**Question**: What about meta/utility commands?

**Current Meta Commands:**
- `newprompt.md` - Create new agent prompts
- `new-command.md` - Create new commands
- `generate-test-commands.md` - Generate test commands
- `install-commands.md` - Install commands
- `index.md` - Index agents

**Options:**

**A) Developer Plugin**
- `claudio-dev-tools` plugin
- Commands for building claudio extensions
- For developers extending claudio

**B) Merge with claude-code Plugin**
- Add to existing `claude-code` plugin
- Plugin development tools together
- Consistent with marketplace

**C) Remove**
- Most now handled by Claude Code natively
- Skills/commands in marketplace are new standard
- Only keep if truly unique

**Are these still needed, or replaced by Claude Code plugin system?**

## Proposed Conversion Workflow

Based on answers to the above questions, I propose this general workflow:

### Phase 1: Inventory and Categorization
1. Audit all 80 agents - categorize as keep/convert/remove
2. Audit all 24 commands - categorize as command/skill/remove
3. Audit extended_context - map to skills
4. Document dependencies between components

### Phase 2: Core Plugin Creation
1. Create `claudio-core` plugin structure
2. Migrate discovery system (commands + agents)
3. Convert discovery extended_context to skill
4. Test discovery workflow end-to-end

### Phase 3: Specialized Plugins
1. Create plugin structures (planning, quality, docs, etc.)
2. Migrate commands to appropriate plugins
3. Convert extended_context to skills
4. Consolidate agents (keep coordinators, convert domain to skills)

### Phase 4: Integration and Testing
1. Test plugin combinations
2. Validate cross-plugin workflows
3. Test project localization with plugins
4. Performance testing

### Phase 5: Documentation and Migration
1. Write plugin documentation
2. Create migration guide
3. Update marketplace
4. Release versioning strategy

## Specific Conversion Candidates

### High-Value Commands to Preserve
1. `/discovery` - Core project analysis (keep as command)
2. `/prd` - Requirements documentation (keep as command)
3. `/plan` - Implementation planning (keep as command)
4. `/task` - Task breakdown (keep as command)
5. `/research` - Topic research with complexity (keep as command)

### Agents to Keep (Coordination/Orchestration)
1. `discovery-agent.md` - Project discovery orchestrator
2. `discovery-structure-analyzer.md`
3. `discovery-tech-analyzer.md`
4. `discovery-architecture-analyzer.md`
5. `discovery-integration-analyzer.md`
6. `install-*-agent.md` series - Installation workflow
7. `upgrade-orchestrator-agent.md`
8. `research-specialist.md`
9. `prd-agent.md`
10. Planning/task coordination agents

### Agents to Convert to Skills
1. `phoenix-dev-executor.md` → `phoenix-development` skill
2. Domain-specific analyzers → domain skills
3. Code quality patterns → quality skills
4. Security patterns → security skills

### Extended Context → Skills
1. `workflow/discovery/` → `project-discovery` skill
2. `workflow/prd/` → `requirements-engineering` skill
3. `workflow/planning/` → `implementation-planning` skill
4. `development/phoenix-dev/` → `phoenix-development` skill
5. `development/design/` → `ux-design` skill
6. `research/` → `research-methodology` skill
7. `documentation/` → `technical-documentation` skill

## Key Preservation Priorities

What makes claudio valuable and MUST be preserved:

1. **Discovery System**
   - Parallel analysis with 5 specialized agents
   - Comprehensive project understanding
   - Technology stack detection
   - MCP recommendations

2. **Anti-Fabrication Framework**
   - Strict validation requirements
   - Factual language enforcement
   - Tool-based verification
   - Quality standards

3. **Argument Extraction Pattern**
   - Universal coordination mechanism
   - Enables complex agent workflows
   - Essential for parallel operations

4. **Research Methodology**
   - Complexity assessment framework
   - Thinking mode selection
   - Comprehensive documentation generation

5. **Project Localization**
   - Discovery-based customization
   - Technology-aware workflows
   - Project-specific configuration

6. **Workflow Orchestration**
   - PRD → Plan → Task → Implement flow
   - TodoWrite phase management
   - Parallel agent coordination

## Questions for Finalization

Before I start making changes, please advise on:

1. **Primary Goal**: Are we consolidating claudio into claude-skills, or keeping them separate?

2. **Plugin Count**: Prefer fewer large plugins (3-4) or more focused plugins (6-8)?

3. **Command Philosophy**: Keep workflow commands explicit, or push toward skill-based autonomy?

4. **Agent Philosophy**: Aggressive consolidation (20 agents) or preserve more (40-50)?

5. **Migration Priority**: Smooth migration for existing users, or clean slate?

6. **Timeline**: Is this a gradual evolution or complete rewrite?

7. **Testing**: Should I start with one command/plugin as prototype before full conversion?

8. **Integration**: Should claudio become a plugin in the claude-skills marketplace, or vice versa?

9. **Unique Features**: Which claudio features are truly unique vs. now redundant with Claude Code?

10. **Target Users**: Who is the primary audience - existing claudio users, new Claude Code users, or both?

## Next Steps

Once you answer these clarifying questions, I will:

1. Create detailed conversion specifications for chosen approach
2. Build conversion scripts/tools where applicable
3. Create first prototype plugin
4. Test and iterate
5. Document the new architecture
6. Create migration guides

## Appendix: File Counts

**Claudio System:**
- Commands: 24
- Agents: 80
- Extended Context Categories: 13
- Extended Context Topics: ~30+

**Claude-Skills System:**
- Plugins: 7
- Skills: 25+
- Total more modular but smaller in scope

The conversion represents significant consolidation and modernization while preserving claudio's unique value.
