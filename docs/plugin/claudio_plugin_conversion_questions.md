# Claudio Plugin Conversion - Clarifying Questions

This document contains the key questions that need to be answered before proceeding with the conversion of claudio (80 agents, 24 commands, extensive extended_context) into a modern plugin-based architecture.

## Context

**Claudio System:**
- 80 agents (coordination, analysis, domain-specific, generation, utility)
- 24 slash commands (discovery, prd, plan, task, research, testing, quality, etc.)
- 13 extended_context categories with ~30+ topic areas
- Unique patterns: argument extraction, anti-fabrication, parallel coordination, project localization

**Goal:** Convert valuable claudio components into plugins compatible with the claude-skills marketplace architecture.

---

## Critical Decision Questions

### 1. Primary Goal & Integration

Are we:
- **A)** Merging claudio into claude-skills marketplace (claudio becomes plugins within claude-skills)
- **B)** Keeping them separate but aligned (claudio uses plugin architecture, separate from claude-skills)
- **C)** Making claudio a meta-plugin that installs from claude-skills marketplace

**Recommendation**: Option A - bring claudio's best features into claude-skills as new plugins.

**Your Answer:** **B) Separate but aligned** - Claudio stays in its own repo, uses plugin architecture compatible with claude-skills marketplace. Can be referenced from any marketplace via GitHub source.

---

### 2. Plugin Organization - How Many Plugins?

Looking at 24 commands and 80 agents, should we create:

**Option A: Comprehensive Consolidation (3-4 plugins)**
- `claudio` - All-in-one meta plugin that installs others
- `claudio-core` - Discovery, install, upgrade, anti-fabrication
- `claudio-workflow` - PRD, plan, task, implement, testing, quality
- `claudio-knowledge` - Research, documentation, templates

**Option B: Functional Separation (5-6 plugins)**
- `claudio-core` - Discovery, install, upgrade
- `claudio-planning` - PRD, plan, task, implement
- `claudio-quality` - Test, code-quality, security-review
- `claudio-docs` - Documentation, research
- `claudio-dev` - Phoenix-dev, design, domain skills

**Option C: Minimal (1-2 plugins)**
- `claudio` - Everything in one plugin (simplest)
- Optional: `claudio-dev` for language-specific stuff

**Your Answer:** **Single plugin with 9 commands** - One `claudio` plugin with focused scope:
- **Core workflow**: discovery, prd, plan, task, implement
- **Quality/Analysis**: security-review, code-quality, research, documentation
- **~22 agents** supporting these commands
- **10 skills** converted from extended_context

---

### 3. Commands vs Skills Philosophy

For the valuable commands (discovery, prd, plan, task, research), should they:

**A) Stay as Slash Commands**
- Users explicitly invoke `/discovery`, `/prd`, `/plan`
- Familiar workflow for existing claudio users
- Explicit control over when workflows run

**B) Become Auto-Activating Skills**
- No commands - skills activate when Claude detects need
- More autonomous, less user intervention
- Progressive disclosure pattern

**C) Hybrid Approach**
- Core workflows keep commands (discovery, prd, plan, task, research)
- Supporting knowledge becomes skills (code-quality patterns, security guidelines)
- Best of both: explicit workflows + contextual knowledge

**Recommendation**: Option C

**Your Answer:** **C) Hybrid Approach** - Core workflows keep commands (discovery, prd, plan, task, implement, security-review, research, code-quality, documentation). Supporting knowledge becomes skills (workflow methodology, command patterns, agent patterns, security-stride methodology).

---

### 4. Agent Consolidation - How Aggressive?

We have 80 agents. How should we consolidate?

**A) Aggressive (80 → ~20 agents)**
- Keep ONLY coordination/orchestration agents
- Convert ALL domain-specific agents to skills
- Example: `phoenix-dev-executor` becomes `phoenix-development` skill
- Aligns with upgrade plan

**B) Moderate (80 → ~40 agents)**
- Keep coordination + key workflow agents
- Convert pure knowledge agents to skills
- Preserve complex multi-step agents

**C) Conservative (80 → ~60 agents)**
- Only remove truly redundant agents
- Keep most workflows as agents
- Gradual migration approach

**Your Answer:** **A) Aggressive (80 → ~22 agents)** - Keep only agents needed for the 9 plugin commands:
- Discovery agents (6): discovery-agent + 5 analyzers
- Workflow agents (4): prd-agent, plan-agent, task-agent, implement-agent
- Security agents (5): coordinator + 4 specialists
- Quality agent (1): code-quality-analyzer
- Research agent (1): research-specialist
- Documentation agents (5): coordinator + 4 creators

---

### 5. Extended Context Strategy

The 13 categories of extended_context (~30+ topics) - convert to:

**A) All Become Skills**
- `workflow/discovery/` → `project-discovery` skill
- `development/phoenix-dev/` → `phoenix-development` skill
- `research/` → `research-methodology` skill
- Maximum reusability, fits skills paradigm

**B) Bundled with Agents**
- Keep as reference material loaded by agents
- Don't expose as standalone skills
- Simpler but less modular

**C) Selective Conversion**
- Workflow contexts stay with agents
- Domain knowledge becomes skills
- Mixed approach

**Your Answer:** **C) Selective/Hybrid Conversion** -
- **Stay in claudio plugin**: Workflow contexts (discovery, prd, planning, task), research-methodology, documentation, code-quality, security-stride, command-patterns, agent-patterns → 10 skills
- **Distribute to other plugins**: phoenix → elixir plugin, react-hooks → ui plugin, postgresql → databases plugin, design → ui plugin

---

### 6. Backward Compatibility Priority

For existing claudio users:

**A) Full Compatibility Mode**
- Keep command names: `/discovery`, `/prd`, `/plan`
- Keep `.claudio/` directory structure
- Provide migration script
- Support for 6+ months

**B) Clean Break**
- New names: `/claudio:discover`, `/claudio:plan`
- New structure
- Migration guide only

**C) Deprecation Path**
- Old commands aliased to new
- Warnings but functional
- 3-month transition period

**Your Answer:** **A) Full Compatibility Mode** - Keep original `.claude/commands/claudio/` and `.claude/agents/claudio/` structure intact. The `.claude-plugin/plugin.json` references these existing files directly. Existing users continue using current structure, new users can install via plugin system.

---

### 7. The Research System

The research system is unique with complexity assessment (4-10), thinking mode selection, auto-documentation. Should it:

**A) Preserve Fully**
- Keep `/research` command
- Keep `research-specialist` agent
- Add `research-methodology` skill
- All three work together

**B) Simplify to Skill + Agent**
- Remove command
- Keep agent for orchestration
- Add skill for methodology
- Invoke agent directly

**C) Convert to Pure Skill**
- No command or dedicated agent
- Just `research-methodology` skill
- Claude uses contextually

**Your Answer:** **A) Preserve Fully** - Keep `/research` command + `research-specialist` agent + `research-methodology` skill. All three work together - command for workflow, agent for execution, skill for methodology knowledge.

---

### 8. Testing & Quality Organization

Five commands cover testing/quality:
- `test.md`, `test-review.md`
- `code-quality.md`
- `security-review.md`
- `generate-test-commands.md`

Should these be:

**A) Single `claudio-quality` Plugin**
- All quality commands together
- Unified workflow
- Single installation

**B) Separate by Concern**
- `claudio-testing` - test commands
- `claudio-security` - security
- `claudio-quality` - code quality

**C) Convert to Skills**
- Remove explicit commands
- Quality patterns as skills
- Claude applies contextually

**Your Answer:** **Hybrid** - Include `security-review` and `code-quality` in main claudio plugin (9 commands total). Testing commands (`test`, `test-review`, `generate-test-commands`) stay as local commands, not in plugin - they're utility commands that don't need marketplace distribution.

---

### 9. Meta/Developer Commands

Commands like `newprompt`, `new-command`, `generate-test-commands`, `install-commands`:

**A) Create `claudio-dev-tools` Plugin**
- For developers extending claudio
- Keep these meta commands

**B) Merge with `claude-code` Plugin**
- Add to existing plugin dev tools
- Consistent with marketplace

**C) Remove - Redundant**
- Claude Code plugin system replaces these
- No longer needed

**Your Answer:** **Not in plugin (stay local)** - Meta/developer commands like `newprompt`, `new-command`, `install`, `upgrade` are system maintenance tools for claudio itself. They don't need marketplace distribution and stay in the local `.claude/commands/claudio/` directory.

---

### 10. Anti-Fabrication Enforcement

The anti-fabrication framework is critical. Enforce via:

**A) Core Skill in claudio-core**
- `anti-fabrication` skill
- All plugins reference it
- Central enforcement

**B) Plugin Manifest Property**
- Each claudio plugin defines requirements
- Skills inherit automatically
- Consistent across plugins

**C) Per-Skill Sections**
- Each skill includes anti-fabrication rules
- Redundant but explicit
- Current claude-skills pattern

**Your Answer:** **A) Leverage existing claude-skills core:anti-fabrication skill** - The claude-skills repo already has a `core:anti-fabrication` skill. Claudio agents can reference this existing skill rather than duplicating. Anti-fabrication requirements are also embedded in each agent's prompt.

---

### 11. Project Localization Flow

Currently: `/discovery` → analyzes → `/install` → localizes agents/commands

With plugins, should localization:

**A) Recommend Plugins**
- Discovery suggests which plugins to install
- User installs recommended plugins
- Plugins auto-configure based on discovery

**B) Dynamic Skill Activation**
- Core plugin always installed
- Discovery creates settings
- Skills activate based on project type
- No manual plugin installation

**C) Hybrid**
- Discovery recommends plugins
- Installed plugins customize via discovery
- Project-specific settings

**Your Answer:** **A) Recommend Plugins** - Discovery analyzes project and suggests which plugins to install. For the main claudio plugin, discovery creates project-specific settings that customize how commands/agents behave for that project type.

---

### 12. Starting Point

Should we:

**A) Prototype One Plugin First**
- Start with `claudio-core` (discovery system)
- Test the conversion pattern
- Iterate before converting everything

**B) Convert Everything Systematically**
- Create all plugins at once
- Comprehensive migration
- Bigger effort upfront

**C) Incremental Migration**
- Convert high-value pieces first
- Leave some in original claudio
- Gradual transition

**Your Answer:** **A) Prototype first** - This plan IS the prototype. Created:
- Updated `.claude-plugin/plugin.json` with 9 commands, 22 agents, 10 skills
- Created `skills/` directory with 10 SKILL.md files converted from extended_context
- Plugin references existing `.claude/commands/` and `.claude/agents/` files directly

---

## Recommended Answers

Based on the analysis, here are the recommended approaches:

1. **Primary Goal**: A) Merge into claude-skills as new plugins
2. **Plugin Count**: B) 5 plugins - core, planning, quality, docs, dev
3. **Commands vs Skills**: C) Hybrid - workflows as commands, knowledge as skills
4. **Agent Consolidation**: A) Aggressive - 80 → 20 agents, rest become skills
5. **Extended Context**: A) All become skills for maximum reusability
6. **Compatibility**: A) Full compatibility - preserve key command names
7. **Research System**: A) Preserve fully - command + agent + skill
8. **Quality Organization**: A) Single quality plugin with all testing/quality
9. **Meta Commands**: B) Merge with claude-code OR C) Remove if redundant
10. **Anti-Fabrication**: A) Core skill referenced by all
11. **Localization**: A) Plugin recommendation flow
12. **Starting Point**: A) Prototype claudio-core first

---

## Additional Context Questions

### Templates System

Current: `extended_context/templates/` directory with template generation agents

**A) Skills-Based Templates**
- Create `template-system` skill
- Templates loaded on-demand as references
- Skills guide template usage

**B) Asset Files**
- Keep as `assets/` in relevant plugins
- Not loaded into context
- Generated when needed

**C) Remove Templates**
- Templates now redundant with Claude Code capabilities
- Just provide patterns in skills instead

**Your Answer:** **A) Skills-Based Templates** - Templates become part of skills (command-patterns skill, agent-patterns skill). The skills provide the patterns and guidance; specific templates are in skill references/ directories.

**What types of templates are most valuable to preserve?** Command development templates, agent architecture templates, and workflow integration patterns.

---

### Naming Conventions

How should we name skills derived from claudio?

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

**Recommendation**: Option A - descriptive names that stand alone

**Your Answer:** **A) Descriptive Names** - Skills use clear descriptive names:
- `project-discovery`, `requirements`, `planning`, `task-breakdown`
- `research-methodology`, `documentation`, `code-quality`
- `security-stride`, `command-patterns`, `agent-patterns`

---

### Domain-Specific Skills

Current domain-specific content includes:
- Phoenix development (`phoenix-dev/`)
- React hooks (`development/react-hooks/`)
- PostgreSQL optimization (`development/postgresql-optimization/`)
- Design/UX (`development/design/`)

Should these:

**A) Merge with Existing claude-skills**
- Add to existing `elixir` plugin (phoenix)
- Enhance existing skills with claudio knowledge
- Consolidate expertise

**B) Create New claudio-dev Plugin**
- Keep claudio domain knowledge separate
- `claudio-dev` plugin with all domain skills
- Standalone installation

**C) Distribute Across Plugins**
- Phoenix → `elixir` plugin in claude-skills
- React → new `ui` plugin
- PostgreSQL → new `databases` plugin
- Organize by technology, not origin

**Your Answer:** **C) Distribute Across Plugins** - Domain knowledge goes to relevant technology plugins:
- `phoenix-dev/` → Enhance existing `elixir:phoenix` skill in claude-skills
- `react-hooks/` → Create `ui:react-hooks` skill in claude-skills
- `postgresql-optimization/` → Create new `databases` plugin with postgresql skill
- `design/` → Create `ui:design-systems` skill in claude-skills

This distributes by technology domain rather than keeping everything in claudio.

---

## Next Steps After Answers

Once these questions are answered, the workflow will be:

1. **Create Detailed Specifications**
   - Plugin structures and manifests
   - Skill conversion mappings
   - Agent consolidation plan
   - Migration guide outline

2. **Build Conversion Tools**
   - Scripts to assist with bulk conversion
   - Validation tools
   - Testing frameworks

3. **Prototype First Plugin**
   - Implement `claudio-core` (or chosen starting point)
   - Test discovery workflow
   - Validate approach

4. **Iterate and Expand**
   - Apply learnings to remaining plugins
   - Convert extended_context to skills
   - Consolidate agents
   - Test integrations

5. **Document and Release**
   - Plugin documentation
   - Migration guides
   - Marketplace integration
   - Version strategy

---

## Summary of Conversion Scope

**What We're Converting:**
- 80 agents → ~20 coordination agents + skills
- 24 commands → Key workflow commands + skills
- 13 extended_context categories → Skills with progressive disclosure
- Unique patterns → Core capabilities (anti-fabrication, argument extraction, etc.)

**What We're Preserving:**
- Discovery system (parallel analysis)
- Anti-fabrication framework
- Research methodology
- Workflow orchestration (PRD → Plan → Task)
- Project localization
- Argument extraction pattern

**What We're Modernizing:**
- Plugin-based architecture
- Progressive disclosure
- Skills for domain knowledge
- Marketplace distribution
- Modular installation

**Target Architecture:**
- 3-6 focused plugins
- ~20 coordination agents
- 30+ skills
- Backward compatible commands
- Smooth migration path
