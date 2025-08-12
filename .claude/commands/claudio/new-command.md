---
description: "Generate custom commands with sub-agents and extended context from research sources"
argument-hint: "<name> \"<purpose>\" <source> [--claudio \"<workflow_position>\"]"
---

Generate complete custom command systems (command + sub-agent + extended context) based on user specifications and research sources. Creates professional-quality commands that follow Claudio patterns and integrate seamlessly with existing workflows.

**Command Structure:**
`/new-command <name> "<purpose>" <source> [--claudio "<workflow_position>"]`

**Parameters:**
- **name**: Command name (alphanumeric, hyphens allowed)
- **purpose**: Brief description of what the command does
- **source**: URL or local file path for research context
- **--claudio**: Optional workflow integration position

**Examples:**

**User Command (standalone):**
```bash
/new-command mycommand "analyzes project dependencies" https://docs.npmjs.com/cli/v8/commands/npm-audit
```

**Workflow Integration:**
```bash
/new-command security-scan "performs security analysis" ./security-guide.md --claudio "after discovery workflow"
```

**Source Types:**
- **URLs**: Automatically researched via `/claudio:research` command
- **Local Files**: Analyzed and integrated as extended context
- **Documentation**: README files, API docs, guides, specifications

**Generated Components:**

1. **Command File**: `commands/claudio/{name}.md`
   - Proper frontmatter and description
   - Usage examples and integration guidance
   - Reference to specialized sub-agent

2. **Sub-Agent**: `agents/claudio/{name}-executor.md`
   - Specialized agent for command execution
   - Tools and capabilities based on research
   - Error handling and validation

3. **Extended Context**: `agents/claudio/extended_context/{category}/{name}/overview.md`
   - Comprehensive context from research source
   - Best practices and implementation patterns
   - Framework-specific guidance

**Workflow Integration Options:**
- `"after discovery workflow"` - Runs after project discovery
- `"after prd workflow"` - Runs after requirements generation
- `"after plan workflow"` - Runs after implementation planning
- `"before task workflow"` - Runs before task breakdown
- `"parallel with [phase]"` - Runs concurrently with specified phase

**Installation:**
- **User Commands**: Installed in current project only
- **Workflow Commands**: Integrated into Claudio system workflows
- **Validation**: Automatic validation of generated command structure

**Quality Assurance:**
- Research-driven context generation
- Template-based consistent structure
- Integration validation and testing
- Following established Claudio patterns

Use the new-command-generator subagent to orchestrate research analysis, template generation, and command installation process.

**Prerequisites:**
- For URL sources: Internet access for research
- For workflow integration: Proper understanding of Claudio workflow phases
- Write permissions for target installation directory

**Validation:**
All generated commands undergo automatic validation to ensure:
- Proper file structure and formatting
- Correct sub-agent integration
- Valid extended context references
- Workflow integration compatibility (if applicable)