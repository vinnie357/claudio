---
name: requirements-engineering
description: Activate when creating Product Requirements Documents (PRDs) with business objectives, functional requirements, success criteria, and implementation planning
license: MIT
---

# Requirements Engineering

Guide for creating comprehensive Product Requirements Documents (PRDs) that translate business needs into actionable technical specifications with measurable outcomes.

## When to Use This Skill

Activate when:
- Creating PRDs for new features or products
- Defining functional and non-functional requirements
- Establishing success criteria and KPIs
- Planning implementation phases and milestones
- Documenting user stories and acceptance criteria
- Conducting requirements analysis and gathering

## PRD Development Process

### Phase 1: Discovery and Analysis
1. Understand business context and objectives
2. Identify target users and stakeholder needs
3. Analyze existing systems and constraints
4. Define project scope and boundaries

### Phase 2: Requirements Definition
1. Create detailed functional requirements
2. Define non-functional requirements (performance, security, scalability)
3. Establish user experience requirements
4. Specify integration and compatibility needs

### Phase 3: Success Criteria and Metrics
1. Establish measurable success criteria
2. Define key performance indicators (KPIs)
3. Create acceptance criteria for each requirement
4. Specify testing and validation requirements

### Phase 4: Implementation Planning
1. Break down requirements into deliverable phases
2. Identify dependencies and critical path
3. Define milestones and checkpoints
4. Create risk mitigation strategies

## Functional Requirements Format

```markdown
### FR-001: [Requirement Title]
**Priority**: High/Medium/Low
**Description**: Detailed description of what the system must do
**User Story**: As a [user type], I want [functionality] so that [benefit]
**Acceptance Criteria**:
- [ ] Specific, testable criterion 1
- [ ] Specific, testable criterion 2
**Dependencies**: Related requirements or external dependencies
```

## Non-Functional Requirements Format

```markdown
### NFR-001: [Requirement Title]
**Category**: Performance/Security/Scalability/Usability/Reliability
**Description**: Specific non-functional requirement
**Measurement**: How success will be measured
**Acceptance Criteria**:
- [ ] Quantifiable criterion (e.g., response time < 200ms)
**Testing Method**: How this will be validated
```

## Success Metrics Format

```markdown
### Success Metric: [Metric Name]
**Objective**: What this metric measures
**Current Baseline**: Starting point
**Target**: Specific goal
**Measurement Method**: How and when to measure
**Definition of Success**: Criteria for meeting the goal
```

## PRD Types

### Feature PRD
- Problem statement and user needs
- Detailed functional requirements
- User stories with acceptance criteria
- Technical specifications
- Success metrics and KPIs

### Enhancement PRD
- Current state analysis
- Improvement objectives
- Migration/transition strategy
- Performance improvement metrics

### Integration PRD
- Systems integration overview
- Data flow requirements
- API specifications
- Error handling and recovery

### Migration PRD
- Current system assessment
- Migration objectives and scope
- Cutover strategy and timeline
- Risk mitigation and rollback plans

## Key Principles

- **Business-First**: Start with business objectives, derive technical requirements
- **Measurable Outcomes**: Every requirement should have clear success criteria
- **User-Centric**: Focus on user value and experience outcomes
- **Risk-Aware**: Identify and plan for potential challenges
- **Iterative Planning**: Structure requirements for phased delivery
- **Cross-Functional**: Consider technical, UX, business, and compliance aspects
