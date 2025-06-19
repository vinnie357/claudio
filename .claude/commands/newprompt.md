# New Prompt Command

## Description
Create new agent prompts and corresponding commands for the Claudio system, including integration planning and documentation updates.

## Usage
```
/newprompt <agent_name> <agent_purpose> [workflow_integration]
```

## Parameters
- `agent_name`: Name for the new agent (e.g., "security-review", "performance", "testing")
- `agent_purpose`: Brief description of the agent's purpose and capabilities
- `workflow_integration`: Optional integration level:
  - `standard`: Include in default Claudio workflow (universal applicability)
  - `optional`: Available as standalone command only (specialized use cases)
  - `conditional`: Include when certain conditions are met (default)

## Context
Use the new prompt agent from `prompts/newprompt/claude.md` to guide the agent and command creation process.

## Instructions
1. Analyze the agent requirements and determine integration strategy
2. Create comprehensive agent prompt following Claudio conventions
3. Generate corresponding command file with dual output strategy
4. Determine workflow integration requirements and positioning
5. Generate documentation updates for system integration
6. **Direct Command**: Save agent to `prompts/<agent_name>/claude.md` and command to `.claude/commands/<agent_name>.md`
7. **Integration Updates**: Generate integration instructions for existing files

## Agent Creation Process

### Phase 1: Requirements Analysis
- Understand the new agent's purpose and scope
- Identify target use cases and user scenarios
- Analyze integration requirements with existing agents
- Determine workflow positioning and dependencies

### Phase 2: Agent Development
- Create agent prompt following established structure
- Define core responsibilities and process workflows
- Include templates and response guidelines
- Establish integration points with other agents

### Phase 3: Command Development
- Create command file with proper parameter structure
- Implement dual output strategy (standalone vs. Claudio)
- Include usage examples and expected outputs
- Define integration behavior and dependencies

### Phase 4: Integration Planning
- Determine Claudio workflow integration requirements
- Identify required updates to existing agent prompts
- Plan documentation updates across system files
- Create folder structure and output organization

## Workflow Integration Levels

### Standard Integration (`standard`)
**When to use**: Universal applicability across most software projects
- Automatically included in Claudio workflow
- Sequential dependency with other phases
- Generates artifacts needed by subsequent phases
- Updates Claudio master agent with new core responsibility

**Examples**: Security review, performance analysis, accessibility audit

### Optional Integration (`optional`)
**When to use**: Specialized use cases or user-driven needs
- Available as standalone command only
- Independent functionality without required integration
- Specialized tools for specific project types
- Does not modify standard Claudio workflow

**Examples**: Mobile app analysis, API documentation, deployment automation

### Conditional Integration (`conditional`)
**When to use**: Context-dependent inclusion in workflow
- Included based on project analysis or user selection
- May require discovery phase to determine applicability
- Enhances workflow when relevant but not universally needed
- Smart integration based on project characteristics

**Examples**: Design analysis (UI/UX projects), database optimization (data-heavy projects)

## Integration Requirements

### For Standard Integration
Required updates to existing files:
1. **Claudio Master Agent** (`prompts/claudio/claude.md`):
   - Add new core responsibility
   - Insert workflow phase with proper sequencing
   - Update folder structure examples
   - Add integration context section

2. **Related Agent Prompts**:
   - Add cross-references where appropriate
   - Update integration sections for coordination
   - Include new agent context in relevant workflows

3. **Documentation**:
   - Update README.md command table
   - Update CLAUDE.md system architecture
   - Update folder structure examples

### For Optional Integration
Required updates:
1. **README.md**: Add to available commands table
2. **CLAUDE.md**: Document as optional capability
3. **Command examples**: Include in usage documentation

## Expected Output Structure

### Agent Prompt Output
```
prompts/<agent_name>/
└── claude.md              # Comprehensive agent prompt
```

### Command Output
```
.claude/commands/
└── <agent_name>.md        # Command specification
```

### Integration Instructions
Generated documentation for required updates:
- Claudio master agent integration code
- Related agent prompt updates
- Documentation file updates
- Folder structure modifications

## Example Usage

### Security Review Agent
```
/newprompt security-review "Comprehensive security analysis with vulnerability assessment and remediation recommendations" standard
```

### API Documentation Agent
```
/newprompt api-docs "Generate comprehensive API documentation with examples and testing guides" optional
```

### Mobile Analysis Agent
```
/newprompt mobile-analysis "Analyze mobile app projects for platform-specific requirements and optimizations" conditional
```

## Expected Outputs

### New Agent Created
- Complete agent prompt with established structure
- Comprehensive command file with dual output strategy
- Integration assessment and workflow positioning
- Cross-agent reference recommendations

### Integration Documentation
- Specific code updates for Claudio master agent
- Required changes to related agent prompts
- Documentation updates for README and CLAUDE.md
- Folder structure and output organization updates

### Quality Assurance
- Consistency with existing Claudio patterns
- Proper integration point identification
- Complete documentation and usage examples
- Maintained quality standards across all generated content

This command enables systematic expansion of the Claudio system while maintaining consistency, integration, and quality standards across all new agent additions.