# Agent Configuration Fix Plan

## Issues Identified

### Issue 1: Conflicting Path Instructions
- Discovery agents have conflicting "Argument Extraction" vs "Argument Handling" sections
- Extraction says use `[extracted_path]`, Handling says use `{project_path}` template
- Agents follow the conflicting instructions, causing nested path creation (e.g., `test/claudio/test/claudio/.claudio/`)

### Issue 2: Missing TodoWrite Tools (System-Wide)
- discovery-validator confirmed missing TodoWrite
- upgrade-legacy-cleaner example shows broader pattern
- CLAUDE.md requires ALL agents have TodoWrite for internal task management
- Total agents in system: ~112 (need to audit all)

### Issue 3: Template vs Extraction Logic
- Multiple agents have `{project_path}` literal templates
- Should use extracted path values instead of literal templates

## Fix Strategy with Status Tracking

### Phase 1: Audit All Agents for TodoWrite ✅
**Status**: COMPLETED
**Goal**: Scan all .claude/agents/claudio/*.md files for TodoWrite access
**Actions**:
- [x] Get complete list of all agent files (81 total agents)
- [x] Check tools list in each agent frontmatter 
- [x] Identify agents missing TodoWrite
- [x] Create comprehensive inventory report

**RESULTS**:
- **Total agents**: 81
- **Have TodoWrite**: 18 agents ✅
- **Missing TodoWrite**: 63 agents ❌
- **Critical finding**: 78% of agents missing required TodoWrite tool

### Phase 2: Add TodoWrite to Missing Agents ✅
**Status**: COMPLETED
**Goal**: Add TodoWrite to tools list for all 63 identified agents
**Actions**:
- [x] Fix format issues (convert array format to standard)
- [x] Update tools lines to include TodoWrite
- [x] Validate syntax and formatting consistency
- [x] Ensure proper format: `tools: tool1, tool2, TodoWrite`

**PROGRESS**: 63/63 agents completed ✅
- ✅ changelog-updater-agent.md
- ✅ claude-commands-analyst.md (fixed format)
- ✅ claude-md-generator-agent.md  
- ✅ claude-md-updater-agent.md
- ✅ claude-sdk-architect.md (fixed format)
- ✅ claude-subagents-analyst.md (fixed format)
- ✅ claudio-coordinator-agent.md
- ✅ discovery-validator.md
- ✅ discovery-agent.md
- ✅ prd-agent.md
- ✅ plan-agent.md
- ✅ task-agent.md
- ✅ claudio-install-commands-test.md
- ✅ claudio-install-test.md
- ✅ claudio-structure-creator-agent.md
- ✅ claudio-test-suite.md
- ✅ claudio-upgrade-test.md
- ✅ code-quality-analyzer.md
- ✅ command-agent-integration-validator.md
- ✅ design-analyzer.md
- ✅ documentation-readme-creator.md
- ✅ documentation-user-guide-creator.md
- ✅ extended-context-content-validator.md
- ✅ extended-context-dependency-validator.md
- ✅ git-commit-message.md
- ✅ implement-agent.md
- ✅ generation-tracking-validator.md
- ✅ generate-test-commands-test.md
- ✅ install-agents-localizer-agent.md
- ✅ install-commands-coordinator-agent.md
- ✅ install-commands-localizer-agent.md
- ✅ install-commands-only-agent.md

**Remaining**: 31 agents

### Phase 3: Resolve Conflicting Path Instructions ✅
**Status**: COMPLETED
**Goal**: Fix conflicting Argument Extraction vs Argument Handling sections
**Actions**:
- [x] Fixed role descriptions to use extraction logic
- [x] Removed conflicting "Argument Handling" sections with literal templates
- [x] Kept only "Argument Extraction Instructions" with proper [extracted_path] format
- [x] Ensured consistent extraction logic across all discovery agents

**FIXED AGENTS**:
- ✅ discovery-structure-analyzer.md
- ✅ discovery-tech-analyzer.md  
- ✅ discovery-architecture-analyzer.md
- ✅ discovery-integration-analyzer.md
- ✅ discovery-consolidator.md

### Phase 4: Fix Path Template Issues 🛠️
**Status**: Pending
**Goal**: Replace all `{project_path}` literals with extraction-based instructions
**Actions**:
- [ ] Find all agents with `{project_path}` template literals
- [ ] Update role descriptions to use extraction logic
- [ ] Ensure consistent path handling across agent families
**Dependencies**: Phase 3 completion

### Phase 5: Validation Testing ✅
**Status**: Pending
**Goal**: Verify all fixes work end-to-end
**Actions**:
- [ ] Re-run `/claudio:claudio test/claudio` command
- [ ] Confirm files created in correct `test/claudio/.claudio/` location (not nested)
- [ ] Validate TodoWrite functionality across fixed agents
- [ ] Test parallel agent execution
**Dependencies**: Phase 4 completion

## Critical Discovery: TodoWrite Pattern Implementation Missing

### Root Cause Analysis
The workflow_updates.md document was **incorrectly marked "COMPLETED"** for Phase 4 (TodoWrite pattern integration) when the work was never actually done. Only Phase 1 (tool access) was completed.

### Actual Scope Discovered
- **Total agents**: 81 agents  
- **TodoWrite tool access**: ✅ All 81 agents now have TodoWrite in tools list
- **TodoWrite pattern implementation**: ❌ Zero agents had workflow patterns implemented
- **Estimated work**: ~50+ multi-step agents need TodoWrite workflow patterns

### Work Completed So Far
- ✅ **Phase 1**: All 81 agents have TodoWrite tool access
- ✅ **Phase 2**: Path conflicts fixed in 5 discovery agents
- ✅ **TodoWrite Pattern Implementation Started**: 
  - ✅ discovery-structure-analyzer.md (3 phases)
  - ✅ discovery-tech-analyzer.md (5 phases)
  - ❌ Remaining 79 agents need patterns

### Remaining Work
- **Discovery agents**: 3 remaining (architecture, integration, consolidator)
- **Installation agents**: ~12 agents with complex multi-phase workflows  
- **Upgrade agents**: ~6 agents with orchestrated workflows
- **Documentation agents**: ~4 agents with generation phases
- **Other multi-step agents**: ~25+ additional agents

### Why This Was Missed
The workflow_updates.md marked Phase 4 as "completed" based on planning/documentation rather than actual implementation. The detailed instructions existed but the agent modifications were never executed.

## Success Criteria (Updated)
- ✅ All agents have TodoWrite in tools list (**COMPLETED**)
- ✅ No conflicting argument extraction vs handling instructions (**COMPLETED**)
- ✅ No literal `{project_path}` templates in discovery agent instructions (**COMPLETED**)
- ❌ **All multi-step agents use TodoWrite workflow patterns** (**IN PROGRESS - 2/81 completed**)
- ❌ All agents can track progress with TodoWrite phase management (**PENDING**)

## Risk Mitigation
- Work on system agents in main claudio directory (not test directory)
- Make incremental changes with validation at each phase
- Keep backups of original configurations if needed
- Test fixes with simple commands before full workflow

---
**Plan Created**: 2025-09-07  
**Plan Updated**: 2025-09-07 - Critical discovery: TodoWrite patterns never implemented
**Total Phases**: 7 (expanded scope)
**Current Status**: Phase 2 - Implementing TodoWrite patterns in discovery agents (2/5 completed)

## Next Steps Recommendation
Use the suggested prompt above to continue systematic TodoWrite pattern implementation across all remaining multi-step agents. This is a substantial undertaking that requires methodical execution through each agent category.