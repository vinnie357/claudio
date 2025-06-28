# Plan Command

## Description
Create detailed implementation plans with time estimates, phases, dependencies, and resource allocation for software development projects.

## Usage
```
/plan <plan_type> <project_name> [duration_constraint]
```

## Parameters
- `plan_type`: Type of implementation plan:
  - `feature`: Single feature implementation plan
  - `project`: Complete project implementation plan
  - `migration`: System/data migration plan
  - `refactor`: Code refactoring and improvement plan
  - `integration`: System integration implementation plan
- `project_name`: Name of the project/feature to plan
- `duration_constraint`: Optional time constraint (e.g., "8 weeks", "3 months")

## Context
Use the implementation plan agent prompt from `prompts/plan/claude.md` to guide your planning process.

## Instructions
1. Analyze project scope and requirements
2. Break down work into distinct, manageable phases
3. Estimate time for each task and phase realistically
4. Identify dependencies and critical path
5. Allocate resources and define skill requirements
6. Include risk assessment and mitigation strategies
7. **Direct Command**: Save to `<target_project>/.claudio/reports/<project_name>_implementation_plan.md`
8. **Within Claudio**: Save to `<target_project>/.claudio/plan.md`

## Plan Types

### Feature Plan (`feature`)
- Feature breakdown and task identification
- Phase-based implementation approach
- Time estimates with buffer for uncertainty
- Testing and integration considerations
- Resource requirements and skill needs

### Project Plan (`project`)
- Complete project lifecycle planning
- Foundation, development, testing, and deployment phases
- Resource allocation across phases
- Risk management and contingency planning
- Success criteria and milestone definitions

### Migration Plan (`migration`)
- Current state analysis and migration scope
- Phased migration approach with rollback strategies
- Data integrity and validation requirements
- Downtime minimization and cutover planning
- Performance impact assessment

### Refactor Plan (`refactor`)
- Code quality assessment and improvement areas
- Incremental refactoring phases
- Backward compatibility considerations
- Performance improvement targets
- Testing strategy for refactored code

### Integration Plan (`integration`)
- System integration scope and approach
- API development and testing phases
- Data flow and synchronization requirements
- Error handling and monitoring setup
- Performance and scalability considerations

## Time Estimation Framework

### Task Complexity Levels
- **Simple**: 1-4 hours (config changes, minor fixes)
- **Medium**: 1-3 days (new components, API endpoints)
- **Complex**: 1-2 weeks (major features, integrations)
- **Epic**: 2+ weeks (complete subsystems, major changes)

### Standard Time Allocations
- Base implementation: 100%
- Testing: +25-40%
- Code review: +10-20%
- Documentation: +10-15%
- Integration: +15-30%
- Buffer/unknowns: +20-30%

## Example
```
/plan project user-management-system "12 weeks"
```
This would create a comprehensive 12-week implementation plan for a user management system with detailed phases and time estimates.

## Expected Output
- Detailed phase breakdown with timelines
- Realistic time estimates for all tasks
- Clear dependency identification
- Resource allocation and skill requirements
- Risk assessment with mitigation strategies
- Measurable success criteria for each phase
- Critical path analysis and milestone planning