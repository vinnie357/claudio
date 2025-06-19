# PRD Command

## Description
Create comprehensive Product Requirements Documents (PRDs) with clear requirements, success criteria, and implementation plans for software projects.

## Usage
```
/prd <prd_type> <project_name> [additional_context]
```

## Parameters
- `prd_type`: Type of PRD to generate:
  - `feature`: New feature development PRD
  - `enhancement`: Product improvement/enhancement PRD
  - `integration`: System integration PRD
  - `migration`: Data/system migration PRD
  - `full`: Complete product PRD with all components
- `project_name`: Name of the project/feature for the PRD
- `additional_context`: Optional additional context or requirements

## Context
Use the PRD agent prompt from `prompts/prd/claude.md` to guide your requirements documentation process. When enhanced documentation is needed, reference the documentation standards from `prompts/documentation/claude.md`.

## Instructions
1. Analyze the project context and business objectives
2. Define clear functional and non-functional requirements
3. Establish measurable success criteria and KPIs
4. Create detailed user stories with acceptance criteria
5. Plan implementation phases and dependencies
6. Include risk analysis and mitigation strategies
7. **Direct Command**: Save to `prd/documents/<project_name>_prd.md`
8. **Within Claudio**: Save to `<target_project>/.claudio/prd.md`

## PRD Types

### Feature PRD (`feature`)
- Problem statement and user needs
- Detailed functional requirements
- User stories with acceptance criteria
- Technical specifications
- Success metrics and KPIs
- Implementation timeline

### Enhancement PRD (`enhancement`)
- Current state analysis
- Improvement objectives
- Requirements for enhancements
- Migration/transition strategy
- Performance improvement metrics
- Rollback plans

### Integration PRD (`integration`)
- Systems integration overview
- Data flow requirements
- API specifications
- Error handling and recovery
- Performance and security requirements
- Testing and validation strategy

### Migration PRD (`migration`)
- Current system assessment
- Migration objectives and scope
- Data migration requirements
- Cutover strategy and timeline
- Risk mitigation and rollback plans
- Success criteria and validation

### Full PRD (`full`)
- Complete product requirements document
- Executive summary and business case
- Comprehensive requirements specification
- Implementation roadmap
- Resource and budget planning
- Stakeholder alignment framework

## Example
```
/prd feature user-authentication "OAuth2 integration with social login"
```
This would create a comprehensive PRD for a user authentication feature with OAuth2 and social login capabilities.

## Expected Output
- Structured PRD with clear requirements
- Measurable success criteria and KPIs
- Detailed user stories and acceptance criteria
- Technical specifications and constraints
- Implementation timeline and milestones
- Risk analysis and mitigation strategies
- Integration with documentation standards when appropriate