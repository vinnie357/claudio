# Phase 2: UI Component Dark Mode Integration Context

You are working on Phase 2 of the Dark Mode Feature implementation. This phase focuses on updating all UI components to properly support dark mode styling using the infrastructure from Phase 1.

## Phase Objectives:
- Update layout components to support dark mode classes
- Enhance task interface with comprehensive dark mode styling
- Style form elements for consistent dark mode experience
- Create and integrate theme toggle UI component

## Key Deliverables:
- **Layout Components**: Dark mode styling for headers, navigation, and main layouts
- **Task Interface**: Dark mode support for task cards, stats, and interactive elements
- **Form Elements**: Dark mode styling for inputs, buttons, and form validation
- **Theme Toggle**: User-facing control for theme switching

## Timeline: 2 days
## Resources: 2 developers (1 UI/UX focused, 1 component integration)

## Task Breakdown:

### Task 1: Layout Components Dark Mode (Day 1 - 4 hours)
**Objective**: Update root layout and app layout components for dark mode
**Assignee**: UI/UX Developer
**Deliverables**:
- Update `root.html.heex` with dark mode body classes
- Enhance `app.html.heex` header and navigation with dark styling
- Add dark mode styles for flash messages and notifications
- Update brand colors and logo for dark theme

**Acceptance Criteria**:
- ✅ Root layout supports theme class application
- ✅ Header components have proper dark mode styling
- ✅ Navigation elements adapt to theme changes
- ✅ Flash messages display correctly in both themes
- ✅ Brand elements maintain readability in dark mode

### Task 2: Task Interface Dark Mode Enhancement (Day 1 - 6 hours)
**Objective**: Enhance existing task components with improved dark mode styling
**Assignee**: Component Integration Developer
**Deliverables**:
- Audit current dark mode classes in `task_live/index.ex`
- Enhance task card styling for better dark mode contrast
- Improve statistics cards dark mode presentation
- Update task action buttons for dark theme consistency

**Acceptance Criteria**:
- ✅ Task cards have enhanced readability in dark mode
- ✅ Completed vs pending tasks clearly distinguishable in dark theme
- ✅ Statistics cards maintain visual hierarchy in dark mode
- ✅ Interactive elements have proper hover/focus states for dark theme
- ✅ Color palette follows accessibility guidelines

### Task 3: Form Elements Dark Mode Styling (Day 2 - 4 hours)
**Objective**: Create consistent dark mode styling for all form elements
**Assignee**: UI/UX Developer
**Deliverables**:
- Dark mode styling for text inputs and form fields
- Error state styling for dark theme
- Button states and variants for dark mode
- Form validation feedback dark mode styling

**Acceptance Criteria**:
- ✅ Input fields maintain proper contrast ratios in dark mode
- ✅ Error messages clearly visible and accessible in dark theme
- ✅ Button states (disabled, hover, active) work properly in dark mode
- ✅ Form focus indicators meet accessibility standards
- ✅ Placeholder text maintains proper contrast

### Task 4: Theme Toggle Component (Day 2 - 4 hours)
**Objective**: Create user-facing theme toggle control
**Assignee**: Component Integration Developer
**Deliverables**:
- Theme toggle component with icon or switch design
- Integration with header or navigation area
- Smooth theme transition animations
- Accessibility features for theme control

**Acceptance Criteria**:
- ✅ Toggle component clearly indicates current theme
- ✅ Click/tap interaction smoothly switches themes
- ✅ Component includes proper ARIA labels for accessibility
- ✅ Visual feedback confirms theme change
- ✅ Component positioning doesn't interfere with existing UI

## Integration Context:
Reference related phases and dependencies:
- **Previous Phase**: Consumes theme management infrastructure from Phase 1
- **Next Phase**: Phase 3 will test and validate all component integrations
- **Dependencies**: Requires completed theme toggle functionality from Phase 1

## Standards and Guidelines:
Reference shared project standards:
- Code Standards: ../shared/standards/claude.md
- Utilities: ../shared/utilities/claude.md  
- Project Resources: ../shared/resources/claude.md

## Success Criteria:
- All UI components render correctly in both light and dark modes
- Theme transitions are smooth and visually consistent
- No accessibility issues with color contrast or focus indicators
- User can easily discover and use the theme toggle feature
- Component styling follows established design system patterns