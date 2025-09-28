# Anti-Fabrication Implementation Continuation Prompt

## Current Status
The anti-fabrication implementation is 66% complete (48/73 agents updated). The core issue has been resolved for all high-risk agents, but 31 remaining agents need standardization for system-wide consistency.

## Remaining Work
Complete the anti-fabrication requirements for these 31 agents:

### Critical Remaining Agents (High Priority)
- `discovery-agent.md` - Core project analysis agent
- `security-review-coordinator.md` - Security analysis coordinator
- `security-architecture-analyst.md` - Security architecture analysis
- `documentation-coordinator.md` - Documentation generation coordinator
- `readme-updater-agent.md` - README maintenance agent
- `user-readme-generator-agent.md` - User documentation generator

### System Maintenance Agents (Medium Priority)
- `changelog-updater-agent.md`
- `claude-md-updater-agent.md`
- `claude-sdk-architect.md`
- `install-system-localizer-agent.md`
- `install-user-templates-agent.md`
- `upgrade-backup-manager.md`
- `upgrade-component-localizer.md`
- `upgrade-installation-validator.md`
- `upgrade-legacy-cleaner.md`
- `upgrade-template-analyzer.md`

### Testing and Generation Agents (Lower Priority)
- `claudio-install-commands-test.md`
- `claudio-install-test.md`
- `claudio-test-suite.md`
- `claudio-upgrade-test.md`
- `generate-test-commands-test.md`
- `test-command-generator.md`
- `test-review.md`
- `project-test-runner.md`
- `claude-settings-test-manager.md`

### Utility Agents (Lowest Priority)
- `git-commit-message.md`
- `phoenix-dev-executor.md`
- `security-diagram-generator.md`
- `newprompt-command-creator.md`
- `newprompt-coordinator.md`
- `newprompt-integration-planner.md`

## Standard Template to Apply

Add this section to each agent (after core responsibilities, before main workflow):

```markdown
## Anti-Fabrication Requirements:
- **Factual Basis Only**: Base all outputs on actual project analysis, discovery findings, or explicit requirements
- **No Fabricated Metrics**: NEVER include specific performance numbers, success percentages, or business impact metrics unless explicitly found in source materials
- **Source Validation**: Reference the source of all quantitative information and performance targets
- **Uncertain Information**: Mark estimated or uncertain information as "requires analysis", "requires measurement", or "requires validation"
- **No Speculation**: Avoid fabricated timelines, benchmarks, or outcomes not grounded in actual project data
```

## Task Instructions

1. **Navigate to agent directory**: `cd /Users/vinnie/github/claudio/.claude/agents/claudio`

2. **For each agent file**, add the anti-fabrication requirements section:
   - Read the agent file to understand its structure
   - Find the appropriate insertion point (typically after "## Your Core Responsibilities:" or similar)
   - Add the standard anti-fabrication template
   - Verify the insertion maintains proper markdown structure

3. **Batch processing approach**:
   ```bash
   # Check which agents still need updates
   for file in *.md; do 
     if [ "$file" != "index.md" ] && [ "$file" != "extended-context-index.md" ]; then 
       if ! grep -q "Anti-Fabrication Requirements" "$file"; then 
         echo "MISSING: $file"
       fi
     fi
   done
   ```

4. **Progress tracking**:
   - Update comprehensive-anti-fabrication-plan.md with progress
   - Mark phases as completed when done
   - Update overall progress percentage

5. **Validation**:
   ```bash
   # Count total agents with anti-fabrication rules
   grep -l "Anti-Fabrication Requirements" *.md | wc -l
   ```

6. **Final documentation**:
   - Update implementation-summary.md with final status
   - Move any remaining planning documents to prompt_log/docs/
   - Create completion report

## Expected Completion
- **Target**: 73/73 agents (100%)
- **Current**: 48/73 agents (66%)
- **Remaining**: 31 agents to update

## Success Criteria
✅ All 73 Claudio agents include standardized anti-fabrication requirements  
✅ No agent can fabricate performance metrics like "99.9% uptime, <2s load times"  
✅ System-wide consistency in handling uncertain information  
✅ Complete documentation in prompt_log/docs/ directory

## Background Context
This work addresses agents generating fabricated success metrics without factual basis. The original issue was identified in claude-md-generator-agent creating fake performance numbers like "99.9% uptime, <2s page load times, 25% conversion rate increase, 40% operational efficiency improvement" - all without any factual foundation.

The solution ensures all agents require factual basis for quantitative claims and use "requires analysis" language for uncertain information instead of fabricating specific numbers.