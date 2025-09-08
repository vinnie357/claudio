# Complete Pattern Audit and Command Template Standardization Plan

## Problem Summary
Root cause analysis reveals multiple pattern consistency issues causing the 4/45 agent installation failure:
1. Source command templates may have inconsistent `Task with subagent_type` patterns
2. install-commands-localizer-agent not preserving exact agent calling syntax
3. Missing command index for authoritative dependency tracking
4. Extended context templates may have mixed invocation patterns

## Phase 1: Source Template Pattern Audit
### Step 1: Audit Source Command Templates
- Examine all `.claude/commands/claudio/*.md` files for pattern consistency
- Check for exact `Task with subagent_type: "agent-name"` format
- Verify proper argument passing: `pass the project_path argument [value]`
- Identify any legacy patterns like `Use the claudio:agent-name subagent`
- Document pattern violations and inconsistencies

### Step 2: Audit Extended Context Command Templates
- Examine `.claude/agents/claudio/extended_context/templates/commands/*.md`
- Check template examples follow exact Task tool patterns
- Verify no mixing of invocation styles within templates
- Ensure consistent TodoWrite integration examples

### Step 3: Audit Agent Templates for Sub-agent Calling
- Check agents that call other agents use consistent patterns
- Verify proper argument extraction documentation
- Ensure no legacy coordination patterns remain

## Phase 2: Pattern Standardization
### Step 4: Standardize Source Commands
- Fix all source command files to use exact patterns:
  ```
  Task with subagent_type: "agent-name" - pass the project_path argument [value] for [purpose]
  ```
- Ensure consistent TodoWrite phase management
- Validate all argument passing follows standard format
- Update any legacy patterns to current standards

### Step 5: Standardize Template Examples
- Fix extended context command templates
- Ensure all examples use consistent Task tool patterns
- Update any mixed invocation styles

## Phase 3: Enhanced Command Localization
### Step 6: Fix install-commands-localizer-agent
**Critical Requirements:**
- **PRESERVE ALL** `Task with subagent_type` patterns from source templates
- **MAINTAIN EXACT FORMATTING** including argument passing
- **CREATE COMMAND INDEX** with comprehensive agent dependency mappings
- **EXTRACT required_agents** from command index (not parsing files)
- **VALIDATE** generated commands preserve all source patterns

**Enhanced Logic:**
1. Read source command with all Task patterns
2. Generate localized command preserving EXACT agent calling syntax
3. Create command index documenting all agent dependencies
4. Build required_agents array from index
5. Validate pattern preservation

## Phase 4: Testing and Validation
### Step 7: Complete Pattern Validation
- Verify all source templates use consistent patterns
- Confirm generated commands preserve exact patterns
- Test command index provides complete dependency tracking
- Validate required_agents array is comprehensive (45+ agents)

### Step 8: End-to-End Installation Test
- Run `/claudio:claudio test/claudio` with standardized patterns
- Verify commands_tracking.json has complete required_agents array
- Confirm all agents get installed (not 4/45 partial failure)
- Test generated commands execute without missing agent errors

## Success Criteria
✅ All source templates use consistent Task tool patterns
✅ Generated commands preserve exact subagent_type formatting
✅ Command index provides authoritative dependency tracking
✅ required_agents array contains complete dependency tree (45+ agents)
✅ Agent installation completes successfully (not partial failure)
✅ Commands execute without runtime agent calling errors
✅ Complete commands → agents → context chain works reliably

## Implementation Order
1. **Audit first** - understand current pattern state
2. **Standardize sources** - fix root template issues  
3. **Fix localization** - preserve patterns during generation
4. **Test completely** - validate end-to-end functionality

## Implementation Progress
- [ ] Phase 1: Source Template Pattern Audit
  - [ ] Step 1: Audit Source Command Templates
  - [ ] Step 2: Audit Extended Context Command Templates  
  - [ ] Step 3: Audit Agent Templates for Sub-agent Calling
- [ ] Phase 2: Pattern Standardization
  - [ ] Step 4: Standardize Source Commands
  - [ ] Step 5: Standardize Template Examples
- [ ] Phase 3: Enhanced Command Localization
  - [ ] Step 6: Fix install-commands-localizer-agent
- [ ] Phase 4: Testing and Validation
  - [ ] Step 7: Complete Pattern Validation
  - [ ] Step 8: End-to-End Installation Test