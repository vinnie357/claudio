# Cross-Phase Coordination

You are working with the coordination context for the Dark Mode Implementation project. This context manages dependencies, communication, and handoffs between phases to ensure smooth project execution.

## Phase Dependencies and Handoffs

### Phase 1 → Phase 2 Handoff
**Phase 1 Deliverables Required:**
- [ ] Theme state management in LiveView socket assigns
- [ ] Theme change event handlers functional
- [ ] Theme toggle component operational
- [ ] Local storage persistence working
- [ ] System preference detection active

**Handoff Verification:**
```elixir
# Verify theme state is properly managed
assert socket.assigns.theme in ["light", "dark", "auto"]

# Verify event handling works
{:noreply, updated_socket} = handle_event("theme_change", %{"theme" => "dark"}, socket)
assert updated_socket.assigns.theme == "dark"
```

**Phase 2 Prerequisites:**
- Theme toggle component must be accessible and functional
- Theme state must propagate to all UI components
- localStorage integration must persist theme across sessions

### Phase 2 → Phase 3 Handoff
**Phase 2 Deliverables Required:**
- [ ] All UI components themed for light and dark modes
- [ ] Accessibility standards maintained across themes
- [ ] No visual artifacts during theme switching
- [ ] Responsive design working in both themes

**Handoff Verification:**
- Visual regression testing across all components
- Accessibility audit with automated tools
- Manual testing of all user interactions

**Phase 3 Prerequisites:**
- Complete UI theme implementation available for enhancement
- Performance baseline established for optimization
- All components ready for advanced features

### Phase 3 → Phase 4 Handoff
**Phase 3 Deliverables Required:**
- [ ] Theme transition animations implemented
- [ ] Auto-switching functionality operational
- [ ] Enhanced accessibility features active
- [ ] Performance impact assessed and optimized

**Handoff Verification:**
- All advanced features functional
- Performance benchmarks within acceptable ranges
- Accessibility compliance verified

**Phase 4 Prerequisites:**
- Complete feature set ready for comprehensive testing
- All functionality implemented and initially verified
- Performance baseline established for optimization

## Cross-Phase Communication Protocols

### Status Reporting
Each phase must update their `phase_status.md` with:
- Current progress and completion percentage
- Blockers that affect subsequent phases
- Dependencies ready for handoff
- Issues that require cross-phase coordination

### Dependency Management
**Shared Resources:**
- Theme utilities from `shared/utilities/claude.md`
- Coding standards from `shared/standards/claude.md`
- Common patterns and configurations

**Interface Contracts:**
- Theme state structure: `%{theme: "light" | "dark" | "auto"}`
- Event naming: `"theme_change"`, `"theme_loaded"`, `"theme_save"`
- CSS class conventions: `dark:` prefix, `theme-*` utilities

## Integration Testing Coordination

### Phase Integration Points
1. **Phase 1 Internal Integration:**
   - Theme state ↔ Toggle component
   - Toggle component ↔ Local storage
   - System preference ↔ Theme state

2. **Phase 1 → Phase 2 Integration:**
   - Theme state propagation to UI components
   - Theme toggle accessibility with UI updates

3. **Phase 2 → Phase 3 Integration:**
   - Themed components with transition animations
   - UI components with auto-switching behavior

4. **Phase 3 → Phase 4 Integration:**
   - Complete feature set for comprehensive testing
   - Advanced features with performance optimization

### Continuous Integration Requirements
- All phases must pass integration tests before handoff
- Regression testing must verify previous phase functionality
- Performance benchmarks must be maintained throughout

## Resource Coordination

### Shared Development Environment
- Consistent Elixir/Phoenix versions across all phases
- Standardized testing setup and utilities
- Common linting and formatting configurations

### Code Review Coordination
- Cross-phase code reviews for interface changes
- Architecture reviews at major phase transitions
- Performance impact reviews for resource-intensive features

### Documentation Coordination
- Keep shared documentation current across phases
- Update API documentation for interface changes
- Maintain integration examples for phase handoffs

## Risk Management Coordination

### Cross-Phase Risk Assessment
1. **Theme State Consistency Risk:**
   - Risk: Theme state inconsistencies between components
   - Mitigation: Centralized state management with validation
   - Monitoring: Automated testing of state propagation

2. **Performance Degradation Risk:**
   - Risk: Feature additions impact performance
   - Mitigation: Continuous performance monitoring
   - Monitoring: Benchmarking at each phase completion

3. **Accessibility Regression Risk:**
   - Risk: New features break accessibility compliance
   - Mitigation: Automated and manual accessibility testing
   - Monitoring: Accessibility audit at each handoff

### Escalation Procedures
- **Phase Blocker:** Issues blocking phase completion
- **Integration Failure:** Handoff verification failures
- **Performance Regression:** Unacceptable performance impact
- **Accessibility Violation:** WCAG compliance failures

## Quality Gates and Checkpoints

### Phase Completion Criteria
Each phase must meet all criteria before handoff:
- [ ] All task acceptance criteria met
- [ ] Integration tests passing
- [ ] Performance benchmarks within range
- [ ] Accessibility standards maintained
- [ ] Code review completed
- [ ] Documentation updated

### Cross-Phase Verification
- Manual testing of complete user workflows
- Automated regression testing of previous functionality
- Performance impact assessment
- Accessibility compliance verification

This coordination context ensures smooth collaboration between phases and maintains project quality throughout the implementation process.