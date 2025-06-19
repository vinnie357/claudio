# Design Command

## Description
Analyze existing UX/UI design systems and create comprehensive design specifications, style guides, and component libraries for software projects.

## Usage
```
/design <design_type> <target_path> [design_standard]
```

## Parameters
- `design_type`: Type of design analysis/creation:
  - `audit`: Comprehensive design audit of existing project
  - `system`: Create complete design system specification
  - `components`: Design component library documentation
  - `guidelines`: UX/UI guidelines and patterns
  - `accessibility`: Accessibility-focused design review
  - `responsive`: Responsive design analysis and specifications
- `target_path`: Path to project/design files to analyze
- `design_standard`: Optional design framework (material, apple-hig, bootstrap, custom)

## Context
Use the design agent prompt from `prompts/design/claude.md` to guide your design analysis and specification process. When design system research is needed, reference `prompts/research/claude.md` for framework-specific guidelines.

## Instructions
1. Analyze existing UI/UX patterns and components in target project
2. Evaluate current design consistency and user experience
3. Research applicable design standards (Material Design, Apple HIG, etc.)
4. Create comprehensive design specifications based on analysis type
5. Include accessibility requirements and responsive design considerations
6. **Direct Command**: Save to `design/<design_type>/<project_name>_design.md`
7. **Within Claudio**: Save to `<target_project>/.claudio/design/<design_type>.md`

## Design Types

### Design Audit (`audit`)
- Comprehensive review of existing design patterns
- Component inventory and consistency analysis
- UX flow evaluation and usability assessment
- Accessibility compliance review
- Design debt identification and prioritization

### Design System (`system`)
- Complete design system specification
- Visual design foundation (typography, colors, spacing)
- Component library architecture and documentation
- Design token structure and implementation guidelines
- Design system governance and maintenance plan

### Component Library (`components`)
- Detailed component specifications and documentation
- Component states, variants, and usage guidelines
- Implementation notes for development teams
- Component relationship mapping and dependencies
- Design-to-code handoff specifications

### UX Guidelines (`guidelines`)
- User experience patterns and best practices
- Information architecture recommendations
- Interaction design principles and micro-interactions
- User flow optimization and task completion patterns
- Content strategy and information hierarchy

### Accessibility Review (`accessibility`)
- WCAG compliance assessment and recommendations
- Color contrast analysis and improvements
- Keyboard navigation and screen reader compatibility
- Inclusive design principle implementation
- Accessibility testing and validation procedures

### Responsive Design (`responsive`)
- Multi-device design strategy and breakpoint analysis
- Component adaptation across screen sizes
- Mobile-first design approach and optimization
- Performance impact of responsive design decisions
- Cross-platform consistency guidelines

## Design Standards Integration

### Material Design (`material`)
- Google Material Design 3 implementation guidelines
- Material component specifications and customization
- Material Design token integration
- Android and web platform considerations

### Apple HIG (`apple-hig`)
- iOS and macOS Human Interface Guidelines alignment
- Apple design principles and pattern implementation
- Platform-specific component adaptations
- Accessibility and inclusive design requirements

### Custom Framework (`custom`)
- Organization-specific design system development
- Brand-aligned component library creation
- Custom design token architecture
- Scalable design system implementation

## Integration with Other Agents

### Research Integration
- Leverage research agent for design system best practices
- Request specific framework research (Material, Apple HIG, etc.)
- Integrate industry standards and emerging design trends
- Use research context for design decision justification

### PRD Integration
- Align design specifications with product requirements
- Incorporate user experience goals into design decisions
- Support functional requirements with appropriate UI patterns
- Ensure design supports business objectives and success criteria

### Plan Integration
- Provide design system development phases and timelines
- Identify design-dependent implementation tasks
- Plan design-to-development handoff processes
- Include design quality assurance in project phases

## Example Usage

### Complete Design Audit
```
/design audit ./my-webapp material
```
Analyzes existing webapp design against Material Design standards and creates comprehensive audit report.

### Design System Creation
```
/design system ./my-project custom
```
Creates complete custom design system specification for the project.

### Component Documentation
```
/design components ./frontend-app
```
Documents existing components and creates component library specifications.

## Expected Output Structure

### Design Audit Output
- Current state analysis and component inventory
- Design consistency evaluation and gap identification
- Accessibility compliance assessment
- Recommendations for improvement and standardization
- Implementation roadmap for design system adoption

### Design System Output
- Visual design foundation (typography, colors, spacing)
- Comprehensive component library documentation
- Design token architecture and implementation guidelines
- Usage guidelines and best practices
- Design system governance and maintenance procedures

### Integration Benefits
- **Consistency**: Establishes unified design language across project
- **Efficiency**: Reduces design and development time through reusable components
- **Accessibility**: Ensures inclusive design principles from the start
- **Scalability**: Creates design system that grows with the product
- **Quality**: Improves user experience through systematic design approach

When run as part of the Claudio workflow, design specifications integrate with discovery analysis, PRD user experience requirements, and implementation planning to create cohesive project documentation.