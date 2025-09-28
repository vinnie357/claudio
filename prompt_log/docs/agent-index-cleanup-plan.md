# Agent Index Cleanup & Corrections Plan

**Created**: 2025-09-06  
**Status**: ✅ COMPLETED  
**Purpose**: Fix agent index correctness issues and format inconsistencies

## Issues Identified

### 1. **Index Reference Errors** ✅ FIXED
- Index refers to "claude-commands-analyst" → should be "claudio-claude-commands-analyst"
- Index refers to "claude-subagents-analyst" → should be "claudio-claude-subagents-analyst"
- **Status**: ✅ FIXED

### 2. **Missing Agent in Index** ✅ CONFIRMED PRESENT
- `claude-settings-test-manager` exists but not listed in agent index
- **Status**: ✅ ALREADY PRESENT (was in index, initial assessment was incorrect)

### 3. **Format Inconsistency** ✅ RESOLVED
- Agent index uses hierarchical text format vs command index's clean tables
- Makes it difficult to scan and maintain compared to command index
- **Status**: ✅ REFORMATTED to table format with tools and model columns

### 4. **Test Workflow Documentation** ✅ CLARIFIED
- Workflow: `/claudio:generate-test-commands` → `test-command-generator` → creates `/claudio:test` + `/claudio:test-g` → **invokes** `claude-settings-test-manager` to add permissions
- `claude-settings-test-manager` is invoked (not created) to extend generated commands
- **Status**: ✅ UNDERSTOOD - No changes needed

## Agent Format Compliance ✅ VERIFIED
Based on research in `.claudio/research/claude/sub-agents/overview.md`:
- Correct format: `name:` field on line 1 in YAML frontmatter
- **Status**: ✅ ALL AGENTS COMPLIANT (79/79 agents have correct name fields)

## Implementation Steps

### Step 1: Create Plan Documentation ✅ COMPLETED
- [x] Document plan with status tracking
- **Completed**: 2025-09-06

### Step 2: Fix Agent Name References ✅ COMPLETED
- [x] Update "claude-commands-analyst" → "claudio-claude-commands-analyst" in index
- [x] Update "claude-subagents-analyst" → "claudio-claude-subagents-analyst" in index
- **Status**: Completed 2025-09-06

### Step 3: Add Missing Agent ✅ COMPLETED  
- [x] Add claude-settings-test-manager to User Agents section
- [x] Document it as extending test command permissions (not creating agents)
- **Status**: Completed 2025-09-06 (Note: Agent was already present in index)

### Step 4: Reformat Index ✅ COMPLETED
- [x] Convert hierarchical format to table format matching command index
- [x] Group agents by logical categories for better maintenance
- [x] Maintain all existing agent information
- [x] Add tools and model columns for better reference
- **Status**: Completed 2025-09-06

### Step 5: Update Status ✅ COMPLETED
- [x] Mark all steps complete in this plan file
- **Status**: Completed 2025-09-06

## Target Files
- **Primary**: `.claude/agents/claudio/index.md` - Main agent index requiring fixes

## Success Criteria
- [x] All agent name references in index match actual agent filenames
- [x] claude-settings-test-manager is listed in index
- [x] Index uses consistent table format like command index
- [x] All agent information is preserved during reformatting
- [x] Plan file shows all steps completed

## Summary of Changes Made

### Agent Index Corrections:
1. **Fixed Agent References**: Updated incorrect references from "claude-commands-analyst" → "claudio-claude-commands-analyst" and "claude-subagents-analyst" → "claudio-claude-subagents-analyst"

2. **Reformatted Structure**: Converted from hierarchical text format to clean table format matching command index style with columns for Agent, Type, Description, Tools, and Model

3. **Improved Organization**: Grouped agents into logical categories:
   - Core Workflow Agents (6)
   - Analysis & Security Agents (7) 
   - Documentation Agents (8)
   - Development & Integration Agents (8)
   - Specialized User Agents (7)
   - System Agents by category (43 total)

4. **Added Metadata**: Included tools and model assignments for better reference and maintenance

5. **Verified Agent Count**: Confirmed 79 total agents (36 User + 43 System) with proper categorization

---

**Next Update**: After each step completion