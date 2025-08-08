# Workflow Integration Templates for New Command Generation

This document provides templates for integrating generated commands into Claudio workflow coordinators based on the `--claudio` flag specifications.

## Integration Points and Templates:

### 1. "after discovery workflow"

#### Claudio-Coordinator Update
```markdown
**Sequential Dependencies** (must complete in order):
1. **claudio:claudio-discovery-orchestrator**: Project analysis foundation (with directory filtering)
2. **claudio:{command_name}**: {command_purpose} based on discovery analysis
3. **claudio:claudio-prd-orchestrator**: Uses discovery output for requirements
4. **claudio:claudio-plan-orchestrator**: Uses PRD output for implementation planning
5. **claudio:claudio-task-orchestrator**: Uses plan output for task breakdown
```

#### Install-Coordinator Update
```markdown
### Phase 3: Workflow Validation (Project/Path Modes Only)
**For `/install /path/to/project` (full workflow mode):**
1. **Launch claudio:workflow-validator**: Validate complete workflow documents (discovery.md, prd.md, plan.md) for quality and completeness
2. **Launch claudio:{command_name}**: {command_purpose} validation and analysis
3. **Document Quality Check**: Ensure all analysis documents meet content quality standards before proceeding to installation
```

### 2. "after prd workflow"

#### Claudio-Coordinator Update
```markdown
**Sequential Dependencies** (must complete in order):
1. **claudio:claudio-discovery-orchestrator**: Project analysis foundation (with directory filtering)
2. **claudio:claudio-prd-orchestrator**: Uses discovery output for requirements
3. **claudio:{command_name}**: {command_purpose} based on requirements analysis
4. **claudio:claudio-plan-orchestrator**: Uses PRD output for implementation planning
5. **claudio:claudio-task-orchestrator**: Uses plan output for task breakdown
```

### 3. "after plan workflow"

#### Claudio-Coordinator Update
```markdown
**Sequential Dependencies** (must complete in order):
1. **claudio:claudio-discovery-orchestrator**: Project analysis foundation (with directory filtering)
2. **claudio:claudio-prd-orchestrator**: Uses discovery output for requirements
3. **claudio:claudio-plan-orchestrator**: Uses PRD output for implementation planning
4. **claudio:{command_name}**: {command_purpose} based on implementation plan
5. **claudio:claudio-task-orchestrator**: Uses plan output for task breakdown
```

### 4. "before task workflow"

#### Claudio-Coordinator Update
```markdown
**Sequential Dependencies** (must complete in order):
1. **claudio:claudio-discovery-orchestrator**: Project analysis foundation (with directory filtering)
2. **claudio:claudio-prd-orchestrator**: Uses discovery output for requirements
3. **claudio:claudio-plan-orchestrator**: Uses PRD output for implementation planning
4. **claudio:{command_name}**: {command_purpose} to prepare for task breakdown
5. **claudio:claudio-task-orchestrator**: Uses plan and {command_name} output for task breakdown
```

### 5. "parallel with discovery"

#### Claudio-Coordinator Update
```markdown
### Phase 2: Parallel Workflow Execution
Launch the following sub-agents using the Task tool:

**Parallel Discovery Phase**:
1. **claudio:claudio-discovery-orchestrator**: Project analysis foundation (with directory filtering)
2. **claudio:{command_name}**: {command_purpose} running parallel to discovery

**Sequential Dependencies** (must complete after parallel phase):
3. **claudio:claudio-prd-orchestrator**: Uses discovery and {command_name} output for requirements
4. **claudio:claudio-plan-orchestrator**: Uses PRD output for implementation planning
5. **claudio:claudio-task-orchestrator**: Uses plan output for task breakdown
```

### 6. "parallel with prd"

#### Claudio-Coordinator Update
```markdown
### Phase 2: Parallel Workflow Execution
Launch the following sub-agents using the Task tool:

**Sequential Phase**:
1. **claudio:claudio-discovery-orchestrator**: Project analysis foundation (with directory filtering)

**Parallel PRD Phase**:
2. **claudio:claudio-prd-orchestrator**: Uses discovery output for requirements
3. **claudio:{command_name}**: {command_purpose} running parallel to PRD generation

**Sequential Dependencies** (must complete after parallel phase):
4. **claudio:claudio-plan-orchestrator**: Uses PRD and {command_name} output for implementation planning
5. **claudio:claudio-task-orchestrator**: Uses plan output for task breakdown
```

## Phase Description Updates:

### Discovery Phase Integration
```markdown
### Phase {phase_number}: {Command Name} Analysis
**Execute {command_purpose}:**
1. **Launch claudio:{command_name}** to {detailed_command_purpose}
2. **Discovery Integration**: Use discovery.md findings for {discovery_usage}
3. **Analysis Enhancement**: Provide {analysis_type} analysis based on {research_source}
4. **Output Generation**: Generate {output_description} for subsequent workflow phases
5. **Validation**: Verify {command_name} analysis meets quality standards
```

### PRD Phase Integration
```markdown
### Phase {phase_number}: {Command Name} Validation
**Execute {command_purpose}:**
1. **Launch claudio:{command_name}** to {detailed_command_purpose}
2. **Requirements Integration**: Use prd.md requirements for {prd_usage}
3. **Compliance Analysis**: Validate requirements against {validation_criteria}
4. **Enhancement**: Provide {enhancement_type} recommendations
5. **Output Integration**: Integrate results with planning phase
```

### Planning Phase Integration
```markdown
### Phase {phase_number}: {Command Name} Planning Enhancement
**Execute {command_purpose}:**
1. **Launch claudio:{command_name}** to {detailed_command_purpose}
2. **Plan Integration**: Use plan.md for {plan_usage}
3. **Implementation Analysis**: Analyze implementation approach for {analysis_focus}
4. **Risk Assessment**: Evaluate {risk_areas} based on {command_name} analysis
5. **Task Preparation**: Prepare enhanced input for task breakdown phase
```

## Output Format Integration:

### Sequential Integration Output
```markdown
## Workflow Results
- ✓ Discovery Analysis: [status]
- ✓ {Command Name}: [status] - {command_purpose}
- ✓ Requirements Definition: [status]  
- ✓ Implementation Planning: [status]
- ✓ Task Organization: [status]
- ✓ Structure Creation: [status]
- ✓ Test Command Generation: [status]
- ✓ **Final Validation: [status]** - Comprehensive workflow validation completed
```

### Parallel Integration Output
```markdown
## Workflow Results
- ✓ Discovery Analysis: [status]
- ✓ {Command Name} (Parallel): [status] - {command_purpose}
- ✓ Requirements Definition: [status]  
- ✓ Implementation Planning: [status]
- ✓ Task Organization: [status]
- ✓ Structure Creation: [status]
- ✓ Test Command Generation: [status]
- ✓ **Final Validation: [status]** - Comprehensive workflow validation completed
```

## Validation Integration:

### Workflow Validator Update
```markdown
#### {Command Name} Document Quality
- **{Command Output}**: [COMPREHENSIVE|ADEQUATE|BASIC|MISSING]
  - Analysis depth: [Detailed|Basic|Missing]
  - Integration quality: [Excellent|Good|Poor]
  - Actionability: [Clear|Unclear|Missing]
```

### Install Validator Update
```markdown
### Commands ([count] files installed)
- claudio.md ✓
- discovery.md ✓
- {command_name}.md ✓
- [list all with status indicators]
```

## Integration Logic by Position:

### Sequential Integration Logic
```markdown
# Sequential Integration for {command_name}
# Position: {workflow_position}
# Integration Point: Line {line_number} in claudio-coordinator.md

def integrate_sequential_command(position, command_name, purpose):
    if position == "after discovery workflow":
        insert_after_line("**claudio:claudio-discovery-orchestrator**", 
                         f"**claudio:{command_name}**: {purpose}")
    elif position == "after prd workflow":
        insert_after_line("**claudio:claudio-prd-orchestrator**", 
                         f"**claudio:{command_name}**: {purpose}")
    # ... additional position logic
```

### Parallel Integration Logic
```markdown
# Parallel Integration for {command_name}
# Position: {workflow_position}
# Integration Point: Parallel execution phase

def integrate_parallel_command(position, command_name, purpose):
    if "parallel with discovery" in position:
        add_to_parallel_group("discovery_phase", command_name, purpose)
    elif "parallel with prd" in position:
        add_to_parallel_group("prd_phase", command_name, purpose)
    # ... additional parallel logic
```

## Error Handling for Integration:

### Integration Validation
```markdown
## Workflow Integration Validation

### Position Validation
- **Valid Positions**: after discovery, after prd, after plan, before task, parallel with [phase]
- **Invalid Position Handling**: Provide clear error and suggest valid alternatives
- **Conflict Detection**: Check for conflicting integrations and suggest resolutions

### Coordinator Update Validation
- **Syntax Validation**: Ensure coordinator file syntax remains valid after integration
- **Reference Validation**: Verify all command references are properly formatted
- **Phase Numbering**: Update phase numbers correctly after integration
- **Cross-Reference Updates**: Update all related files consistently

### Rollback Logic
- **Integration Failure**: Provide rollback to original coordinator state
- **Validation Failure**: Undo integration changes and report specific issues
- **Conflict Resolution**: Provide guidance for resolving integration conflicts
```

This template system ensures generated commands can be seamlessly integrated into Claudio workflows at the appropriate points with proper validation and error handling.