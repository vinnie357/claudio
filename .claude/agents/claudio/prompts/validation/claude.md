# Claudio Validation Framework - Success Criteria Templates

This document provides standardized success criteria templates and validation frameworks for all Claudio validation agents. It ensures consistent quality assessment and reporting across the system.

## Validation Framework Overview

The Claudio validation system uses a three-tier success criteria framework:
- **SUCCESS**: Meets all quality standards and requirements
- **PARTIAL**: Meets basic requirements but has quality issues  
- **FAILED**: Does not meet minimum requirements

## Standard Success Criteria Framework

### SUCCESS Criteria Template
```markdown
### SUCCESS ([Validation Type] Complete and High Quality)
**[Criterion 1]**: ✅ [Specific success requirement]
**[Criterion 2]**: ✅ [Specific success requirement]
**[Criterion 3]**: ✅ [Specific success requirement]
**[Criterion 4]**: ✅ [Specific success requirement]
**[Criterion 5]**: ✅ [Specific success requirement]
**[Overall Quality]**: ✅ [Overall quality standard met]
```

### PARTIAL Criteria Template
```markdown
### PARTIAL ([Validation Type] Complete but Quality Issues)
**[Criterion 1]**: ✅/⚠️ [Mixed or adequate performance]
**[Criterion 2]**: ⚠️ [Quality issue but acceptable]
**[Criterion 3]**: ✅/⚠️ [Partial compliance]
**[Criterion 4]**: ⚠️ [Needs improvement but functional]
**[Criterion 5]**: ✅/⚠️ [Some aspects missing]
**[Overall Quality]**: ⚠️ [Adequate but could be improved]
```

### FAILED Criteria Template
```markdown
### FAILED ([Validation Type] Incomplete or Poor Quality)
**[Criterion 1]**: ❌ [Critical failure or missing]
**[Criterion 2]**: ❌ [Major deficiency]
**[Criterion 3]**: ❌ [Requirement not met]
**[Criterion 4]**: ❌ [Critical issue prevents use]
**[Criterion 5]**: ❌ [Missing essential component]
**[Overall Quality]**: ❌ [Does not meet minimum standards]
```

## Validation Report Structure Template

### Comprehensive Validation Report Template
```markdown
# [Validation Type] Validation Report

## Validation Summary
- **[Target]**: [target_identifier]
- **Validation Date**: [timestamp]
- **Overall Status**: [SUCCESS|PARTIAL|FAILED]
- **Quality Score**: [score/10]
- **[Type-Specific Metric]**: [measurement]

## [Primary Assessment Category] ([EXCELLENT|GOOD|FAIR|POOR])

### [Subcategory 1]
- **[Metric 1]**: [COMPREHENSIVE|ADEQUATE|BASIC|MISSING]
  - [Detail 1]: [Status and description]
  - [Detail 2]: [Status and description]
  - [Detail 3]: [Status and description]

### [Subcategory 2]
- **[Metric 2]**: [COMPREHENSIVE|ADEQUATE|BASIC|MISSING]
  - [Detail 1]: [Status and description]
  - [Detail 2]: [Status and description]

## [Secondary Assessment Category] ([EXCELLENT|GOOD|FAIR|POOR])

[Continue pattern for all assessment categories]

### ⚠️ ISSUES IDENTIFIED

#### Critical Issues (Must Fix)
[List critical issues that prevent success]

#### Warning Issues (Recommended to Address)
[List quality issues that should be improved]

## [Readiness Assessment]
- **Ready for [Next Phase]**: [YES|WITH_CONDITIONS|NO]
- **Quality Level**: [PRODUCTION_READY|NEEDS_IMPROVEMENT|REQUIRES_REWORK]
- **Confidence Score**: [score/10]

## Recommendations
[Specific actions to improve quality]

## Next Steps
[Immediate actions required before proceeding]
```

### Quick Status Template
```markdown
## Quick [Validation Type] Status

**Overall Result**: [SUCCESS|PARTIAL|FAILED]

**[Category] Quality**:
- [Aspect 1]: [EXCELLENT|GOOD|FAIR|POOR]
- [Aspect 2]: [EXCELLENT|GOOD|FAIR|POOR]
- [Aspect 3]: [EXCELLENT|GOOD|FAIR|POOR]

**Critical Issues**: [count] (must fix before proceeding)
**Quality Warnings**: [count] (recommended improvements)

**[Next Phase] Ready**: [YES|NO]
```

## Quality Assessment Scale

### Excellence Scale (Use Consistently)
- **EXCELLENT**: Exceeds expectations, best practices followed
- **GOOD**: Meets all requirements with good quality
- **FAIR**: Meets basic requirements but could be improved
- **POOR**: Does not meet requirements, significant issues

### Completeness Scale (Use Consistently)
- **COMPREHENSIVE**: Thorough, detailed, covers all aspects
- **ADEQUATE**: Covers requirements but not extensive
- **BASIC**: Minimal coverage, meets bare minimum
- **MISSING**: Not present or insufficient

### Status Indicators (Use Consistently)
- ✅ **SUCCESS**: Requirement fully met
- ⚠️ **WARNING**: Needs attention but acceptable
- ❌ **FAILED**: Critical issue, requirement not met

## Validation Type-Specific Templates

### Installation Validation Success Criteria
```markdown
### SUCCESS (Installation Complete and Functional)
**File Structure**: ✅ All required directories and files present
**File Integrity**: ✅ All files complete, readable, and contain expected content
**Namespace References**: ✅ All claudio:<agent> references work correctly
**Integration**: ✅ Commands can invoke agents successfully
**Permissions**: ✅ All files and directories accessible
**System Functionality**: ✅ Installed system executes without file-level errors
```

### Workflow Validation Success Criteria
```markdown
### SUCCESS (Workflow Documents Complete and High Quality)
**Document Existence**: ✅ All required documents present and substantial
**Content Quality**: ✅ All documents contain comprehensive, detailed analysis
**Cross-References**: ✅ All links and references work correctly
**Feasibility**: ✅ Plans and recommendations are realistic and actionable
**Integration**: ✅ Documents are consistent and well-integrated
**Actionability**: ✅ All recommendations include specific next steps
```

### Discovery Validation Success Criteria
```markdown
### SUCCESS (Discovery Analysis Comprehensive)
**Technology Analysis**: ✅ Comprehensive technology stack identification with details
**Architecture Assessment**: ✅ Thorough architecture and pattern analysis
**Capability Analysis**: ✅ Complete feature inventory and quality assessment
**Recommendations**: ✅ Specific, relevant, and actionable suggestions with rationale
**Actionability**: ✅ Clear next steps with priorities and expected outcomes
**Analysis Depth**: ✅ Sufficient detail for subsequent workflow phases
```

## Error Classification Framework

### Critical Errors (FAILED Status)
- Missing essential components
- System cannot function
- Major security or functional issues
- Cannot proceed to next phase

### Warning Issues (PARTIAL Status)
- Quality could be improved
- Non-essential components missing
- Minor inconsistencies
- Can proceed but should address issues

### Success Indicators (SUCCESS Status)
- All requirements met
- High quality implementation
- No blocking issues
- Ready for next phase

## Integration Guidelines

### Validator Agent Integration
1. **Receive Parameters**: Get validation target and context from coordinator
2. **Apply Framework**: Use appropriate success criteria template
3. **Assess Quality**: Evaluate against specific criteria
4. **Generate Report**: Use standard reporting template
5. **Return Status**: Provide clear SUCCESS/PARTIAL/FAILED status

### Coordinator Integration
1. **Call Appropriate Validator**: Match validator to validation need
2. **Process Results**: Interpret validation reports
3. **Make Decisions**: Proceed, fix issues, or stop based on results
4. **Report to User**: Provide clear status and next steps

This framework ensures consistent, reliable validation across all Claudio system components while maintaining high quality standards and clear user communication.