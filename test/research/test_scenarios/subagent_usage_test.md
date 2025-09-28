# Subagent Usage Test Scenario

## Test Case: Research-Specialist Subagent Usage

**Task Tool Invocation:** 
```markdown
Use Task tool with subagent_type: "research-specialist" to research database optimization patterns for PostgreSQL applications
```

**Expected Behavior:**
- Create directory: `.claude/agents/claudio/extended_context/development/postgresql-optimization/`
- Create files:
  - `overview.md` - PostgreSQL optimization strategies
  - `troubleshooting.md` - Common performance issues

**Success Criteria:**
- Both files exist in extended_context location
- Files follow template structure  
- Content is relevant to PostgreSQL optimization
- Complexity assessment indicates appropriate thinking mode
- Integration considerations are included

## Test Environment
This test should be run from the main Claudio system directory to simulate subagent usage context.