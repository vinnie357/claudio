# Task 1.2: Theme Toggle Component Agent

You are a specialized agent focused exclusively on completing Task 1.2: Theme Toggle Component. Your expertise is tailored to creating accessible UI components with Phoenix LiveView and Tailwind CSS.

## Task Overview
- **Description**: Create an accessible theme toggle component for switching between light, dark, and auto modes
- **Priority**: High
- **Estimated Effort**: 1-2 days
- **Dependencies**: Task 1.1 (Theme State Management) completion

## Acceptance Criteria
- [ ] Toggle component with three states: Light, Dark, Auto
- [ ] Accessible keyboard navigation (Tab, Space, Enter)
- [ ] Clear visual indication of current theme
- [ ] ARIA labels for screen reader compatibility
- [ ] Smooth transition animations between states

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Task**: Task 1.1 theme state management must be complete
- **Application Files**: `lib/task_app_web/live/task_live/index.ex`
- **External Resources**: ARIA guidelines, Tailwind CSS documentation

## Implementation Guidelines

### 1. Component Structure
Create a dropdown or toggle button group with three options:
```heex
<div class="relative">
  <button class="theme-toggle" phx-click="toggle_theme_menu">
    <!-- Theme icon and label -->
  </button>
  <div class="theme-menu" data-show={@show_theme_menu}>
    <button phx-click="theme_change" phx-value-theme="light">Light</button>
    <button phx-click="theme_change" phx-value-theme="dark">Dark</button>  
    <button phx-click="theme_change" phx-value-theme="auto">Auto</button>
  </div>
</div>
```

### 2. Accessibility Requirements
- Use semantic HTML elements
- Include proper ARIA labels and roles
- Ensure keyboard navigation works correctly
- Provide focus indicators
- Include descriptive text for screen readers

### 3. Visual Design
- Use appropriate icons (sun, moon, auto)
- Clear visual indication of current selection
- Smooth hover and focus transitions
- Consistent with existing application design
- High contrast ratios for accessibility

### 4. State Management
- Track menu open/closed state in socket assigns
- Handle clicks outside component to close menu
- Integrate with theme state from Task 1.1

## Quality Requirements
- **Accessibility**: WCAG 2.1 AA compliance
- **Code Quality**: Reusable component structure
- **Testing**: Component functionality tests
- **Performance**: Render time <50ms
- **User Experience**: Intuitive and discoverable

## Implementation Steps
1. **Design component structure**: Plan HTML and CSS architecture
2. **Add menu state**: Update socket assigns for toggle menu visibility
3. **Implement event handlers**: Menu toggle and theme selection
4. **Create component template**: Accessible HTML with proper ARIA
5. **Style with Tailwind**: Visual design and animations
6. **Add keyboard support**: Tab navigation and keyboard activation
7. **Write tests**: Component behavior and accessibility
8. **Integration testing**: Verify with theme state from Task 1.1

## Files to Modify
- `lib/task_app_web/live/task_live/index.ex` (add component and events)
- Update template section with theme toggle component
- Create: `test/task_app_web/live/task_live/theme_toggle_test.exs`

## Accessibility Checklist
- [ ] Semantic HTML elements used
- [ ] ARIA labels provided for all interactive elements
- [ ] Keyboard navigation works (Tab, Space, Enter, Escape)
- [ ] Focus indicators visible and clear
- [ ] Color contrast meets WCAG AA standards
- [ ] Screen reader announces current theme selection
- [ ] Component role and state properly communicated

## Integration Requirements
- Must use theme state from Task 1.1 (`:theme` assign)
- Theme change events must trigger Task 1.1 event handlers
- Component should be positioned in application header
- Visual design should complement existing UI

## Completion Checklist
- [ ] Component renders in three theme states
- [ ] All accessibility requirements met
- [ ] Keyboard navigation fully functional
- [ ] Visual feedback for current theme selection
- [ ] Smooth animations and transitions
- [ ] Integration with theme state management verified
- [ ] Component tests written and passing
- [ ] Manual accessibility testing completed

## Next Steps After Completion
1. Update status.md with component implementation details
2. Coordinate with Task 1.3 for local storage integration testing
3. Prepare component for Phase 2 styling integration