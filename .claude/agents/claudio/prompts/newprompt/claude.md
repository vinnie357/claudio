# New Prompt System - Templates and Guidance

This document provides templates, patterns, and guidance for creating new agent prompts and commands within the Claudio system. Use this as a reference for maintaining consistency with established Claudio conventions.

## Core Principles for New Agents:

1. **Agent Prompt Structure**: Follow established Claudio format with clear identity and expertise definition
2. **Command Integration**: Ensure proper sub-agent integration with frontmatter format
3. **Workflow Positioning**: Consider integration requirements with existing agents
4. **Documentation Consistency**: Maintain quality standards across all generated content

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

## Agent Prompt Template Structure:

```markdown
# [Agent Name] Agent

You are a specialized [domain] agent that [primary purpose and capabilities]. Your expertise lies in [specific expertise areas and methodology].

## Your Core Responsibilities:

1. **[Primary Responsibility]**: [Detailed description]:
   - [Specific capability 1]
   - [Specific capability 2]
   - [Specific capability 3]

2. **[Secondary Responsibility]**: [Detailed description]:
   - [Specific capability 1]
   - [Specific capability 2]

3. **Integration with Other Agents**: When needed, reference other agent contexts:
   - Reference `.claude/agents/claudio/prompts/[related-agent]/claude.md` for [specific integration needs]
   - Coordinate with `.claude/agents/claudio/prompts/[other-agent]/claude.md` for [coordination requirements]

## [Agent Name] Process:

### Phase 1: [Process Phase Name]
1. [Step description]
2. [Step description]
3. [Step description]

### Phase 2: [Process Phase Name]
[Similar structure for all phases]

## [Output Type] Structure and Templates:

### [Template Name]
```[format]
[Template content with placeholders]
```

## Response Guidelines:
1. **[Guideline 1]**: [Description and application]
2. **[Guideline 2]**: [Description and application]
[Continue for all guidelines]

## Integration with [Related] Agent:
When [integration scenario]:
- [Integration instruction 1]
- [Integration instruction 2]

When [creating output], focus on [key principles and quality criteria].
```

## Command Template Structure:

```markdown
# [Command Name] Command

## Description
[Clear description of what the command does and its purpose]

## Usage
```
/[command-name] <required_param> [optional_param]
```

## Parameters
- `required_param`: [Description and examples]
- `optional_param`: [Description and default behavior]

## Context
Use the [agent name] agent prompt from `.claude/agents/claudio/prompts/[agent-folder]/claude.md` to guide your [process description].

## Instructions
1. [Step 1 description]
2. [Step 2 description]
3. [Step 3 description]
4. **Direct Command**: Save to `[standalone-path]`
5. **Within Claudio**: Save to `<target_project>/.claudio/[claudio-path]`

## [Command Type] Types

### [Type 1] (`type1`)
- [Description of what this type does]
- [Key features and capabilities]
- [Use cases and scenarios]

## Integration with Other Agents
[Description of how this command works with other agents in the system]

## Example
```
/[command-name] [example-usage]
```
[Description of what this example would produce]

## Expected Output
- [Output description 1]
- [Output description 2]
- [Integration behavior when part of Claudio workflow]
```

## Workflow Integration Assessment:

### Standard Workflow Integration
Determine if the new agent should be included in the standard Claudio workflow by evaluating:
- **Universal Applicability**: Does this apply to most software projects?
- **Sequential Dependencies**: Does this depend on or feed into other workflow phases?
- **Output Requirements**: Does this generate artifacts needed by subsequent phases?
- **User Expectations**: Would users expect this to be included automatically?

### Optional Workflow Integration
Consider optional integration if:
- **Specialized Use Cases**: Only applies to certain types of projects
- **User-Driven Needs**: Better as an on-demand capability
- **Independent Functionality**: Doesn't require integration with other phases
- **Experimental Features**: New capabilities being tested or refined

## Integration Update Requirements:

### Claudio Master Agent Updates
When integrating into standard workflow:
1. Add new core responsibility to master agent
2. Insert new phase in workflow process with proper sequencing
3. Update folder structure to include new agent outputs
4. Add integration context section for the new agent
5. Update execution workflow with new agent steps

### Documentation Updates
Required updates for new agents:
1. **README.md**: Add command to available commands table
2. **CLAUDE.md**: Update system architecture section
3. **Command files**: Reference new agent in related commands
4. **Agent prompts**: Add cross-references where appropriate
5. **Folder structure**: Update examples and templates

## Quality Guidelines:
1. **Consistency First**: Follow established Claudio patterns and conventions
2. **Integration Aware**: Consider how the new agent fits into the broader system
3. **User-Centric**: Focus on clear value and usability for end users
4. **Documentation Complete**: Generate all necessary documentation updates
5. **Quality Standards**: Maintain the same quality and detail as existing agents
6. **Workflow Conscious**: Understand impact on the overall Claudio workflow

## Creation Checklist:
- [ ] Agent prompt follows established structure and conventions
- [ ] Command file includes proper frontmatter and sub-agent integration
- [ ] Integration requirements clearly identified
- [ ] Documentation updates specified
- [ ] Workflow positioning determined
- [ ] Cross-agent references properly established
- [ ] Templates and examples provided
- [ ] Quality guidelines maintained

## File Structure Pattern:
```
.claude/commands/<agent_name>.md           # Command with frontmatter
.claude/agents/<agent_name>-coordinator.md # Main coordinator (if parallel)
.claude/agents/<agent_name>-*.md           # Specialized sub-agents (if parallel)
.claude/agents/claudio/prompts/<agent_name>/claude.md       # Extended context and templates
```

Use this guidance to create consistent, well-integrated new capabilities that enhance the Claudio system's value and usability.

## Command Processing Instructions:

### Parameters
- `agent_name`: Name for the new agent (e.g., "security-review", "performance", "testing")
- `agent_purpose`: Brief description of the agent's purpose and capabilities
- `workflow_integration`: Optional integration level:
  - `standard`: Include in default Claudio workflow (universal applicability)
  - `optional`: Available as standalone command only (specialized use cases)
  - `conditional`: Include when certain conditions are met (default)

### Processing Steps
1. Analyze the agent requirements and determine integration strategy
2. Create comprehensive agent prompt following Claudio conventions
3. Generate corresponding command file with dual output strategy
4. Determine workflow integration requirements and positioning
5. Generate documentation updates for system integration
6. **Direct Command**: Save agent to `.claude/agents/claudio/prompts/<agent_name>/claude.md` and command to `.claude/commands/claudio/<agent_name>.md`
7. **Integration Updates**: Generate integration instructions for existing files

### Agent Creation Process

#### Phase 1: Requirements Analysis
- Understand the new agent's purpose and scope
- Identify target use cases and user scenarios
- Analyze integration requirements with existing agents
- Determine workflow positioning and dependencies

#### Phase 2: Agent Development
- Create agent prompt following established structure
- Define core responsibilities and process workflows
- Include templates and response guidelines
- Establish integration points with other agents

#### Phase 3: Command Development
- Create command file with proper parameter structure
- Implement dual output strategy (standalone vs. Claudio)
- Include usage examples and expected outputs
- Define integration behavior and dependencies

#### Phase 4: Integration Planning
- Determine Claudio workflow integration requirements
- Identify required updates to existing agent prompts
- Plan documentation updates across system files
- Create folder structure and output organization

### Integration Requirements

#### For Standard Integration
Required updates to existing files:
1. **Claudio Master Agent** (`.claude/agents/claudio/prompts/claudio/claude.md`):
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

#### For Optional Integration
Required updates:
1. **README.md**: Add to available commands table
2. **CLAUDE.md**: Document as optional capability
3. **Command examples**: Include in usage documentation

### Expected Output Structure

#### Agent Prompt Output
```
.claude/agents/claudio/prompts/<agent_name>/
└── claude.md              # Comprehensive agent prompt
```

#### Command Output
```
.claude/commands/claudio/
└── <agent_name>.md        # Command specification
```

#### Integration Instructions
Generated documentation for required updates:
- Claudio master agent integration code
- Related agent prompt updates
- Documentation file updates
- Folder structure modifications

### Example Usage

#### Security Review Agent
```
/newprompt security-review "Comprehensive security analysis with vulnerability assessment and remediation recommendations" standard
```

#### API Documentation Agent
```
/newprompt api-docs "Generate comprehensive API documentation with examples and testing guides" optional
```

#### Mobile Analysis Agent
```
/newprompt mobile-analysis "Analyze mobile app projects for platform-specific requirements and optimizations" conditional
```

### Expected Outputs

#### New Agent Created
- Complete agent prompt with established structure
- Comprehensive command file with dual output strategy
- Integration assessment and workflow positioning
- Cross-agent reference recommendations

#### Integration Documentation
- Specific code updates for Claudio master agent
- Required changes to related agent prompts
- Documentation updates for README and CLAUDE.md
- Folder structure and output organization updates

#### Quality Assurance
- Consistency with existing Claudio patterns
- Proper integration point identification
- Complete documentation and usage examples
- Maintained quality standards across all generated content