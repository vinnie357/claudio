---
name: implementation-planning
description: Activate when creating detailed implementation plans with phases, tasks, dependencies, and resource allocation for software projects
license: MIT
---

# Implementation Planning

Guide for creating detailed implementation plans that break down complex projects into manageable phases with realistic dependencies and resource allocation.

## When to Use This Skill

Activate when:
- Breaking down projects into implementable phases
- Creating task lists with dependencies
- Planning resource allocation across phases
- Estimating project effort and complexity
- Identifying critical paths and risks
- Defining milestones and deliverables

## Planning Process

### Phase 1: Project Analysis
1. Understand project scope and requirements
2. Identify major components and features
3. Analyze technical complexity and dependencies
4. Assess team capabilities and constraints

### Phase 2: Task Decomposition
1. Break down features into implementable tasks
2. Identify dependencies between tasks
3. Group related tasks into logical phases
4. Define deliverables and success criteria

### Phase 3: Dependency Mapping
1. Identify task-to-task dependencies
2. Map external dependencies
3. Determine critical path
4. Plan for parallel execution where possible

### Phase 4: Resource Planning
1. Identify required skills and expertise
2. Allocate team members to phases
3. Plan for knowledge transfer
4. Define communication schedules

## Phase Structure Template

```markdown
## Phase [N]: [Phase Name]
**Duration**: [Estimate]
**Dependencies**: [Previous phases or external]

### Objectives
- Primary goal of this phase
- Key deliverables and outcomes

### Tasks
#### Task [N.1]: [Task Name]
- **Complexity**: Simple/Medium/Complex
- **Dependencies**: [Other tasks]
- **Description**: Detailed task description
- **Acceptance Criteria**:
  - [ ] Criterion 1
  - [ ] Criterion 2

### Deliverables
- [Specific deliverable 1]
- [Specific deliverable 2]

### Risks and Mitigation
- **Risk**: [Description]
  - **Probability**: High/Medium/Low
  - **Mitigation**: [Strategy]
```

## Task Complexity Levels

- **Simple**: Configuration changes, minor fixes, simple UI updates
- **Medium**: New feature components, API endpoints, database schema changes
- **Complex**: Major feature implementation, system integrations
- **Epic**: Complete subsystems, major architectural changes

## Standard Phase Templates

### Foundation Phase
- Development environment setup
- CI/CD pipeline configuration
- Database schema design
- Basic project structure
- Initial security setup

### Core Development Phase
- Core business logic implementation
- API development
- Database operations
- User interface development
- Component integration

### Integration and Testing Phase
- End-to-end testing
- Performance testing
- Security testing
- User acceptance testing
- Bug fixing

### Deployment Phase
- Production environment setup
- Deployment automation
- Monitoring and alerting
- Launch preparation
- Rollback planning

## Estimation Factors

When estimating, account for:
- **Base Implementation**: Core development time
- **Testing**: 25-40% of implementation
- **Code Review**: 10-20% of implementation
- **Documentation**: 10-15% of implementation
- **Integration**: 15-30% depending on complexity
- **Buffer**: 20-30% for uncertainty

## Key Principles

- **Realistic Estimates**: Base on actual complexity and capabilities
- **Phased Approach**: Structure work into logical, deliverable phases
- **Dependency Management**: Clearly identify and plan for dependencies
- **Risk Consideration**: Include buffer time and contingency plans
- **Measurable Milestones**: Define clear completion criteria
- **Iterative Refinement**: Plan for feedback and course correction
