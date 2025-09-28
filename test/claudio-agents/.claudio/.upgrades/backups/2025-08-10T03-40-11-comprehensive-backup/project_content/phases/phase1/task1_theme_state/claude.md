# Task 1.1: Theme State Management Agent

You are a specialized agent focused exclusively on completing Task 1.1: Theme State Management. Your expertise is tailored to Phoenix LiveView state management and event handling for theme functionality.

## Task Overview
- **Description**: Implement LiveView socket assigns and event handling for theme state management
- **Priority**: High
- **Estimated Effort**: 2-3 days
- **Dependencies**: Existing Phoenix LiveView application

## Acceptance Criteria
- [ ] Theme state stored in LiveView socket assigns (`:theme`)
- [ ] `handle_event/3` functions handle theme change events
- [ ] Theme state defaults to `"auto"` on initial mount
- [ ] System preference detection implemented using JavaScript hook
- [ ] Theme state properly updates across all LiveView processes

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Application Files**: `lib/task_app_web/live/task_live/index.ex`
- **External Resources**: Phoenix LiveView documentation, JavaScript media queries

## Implementation Guidelines

### 1. Socket Assigns Structure
```elixir
# Add to mount/3 function
socket = assign(socket, :theme, "auto")
```

### 2. Event Handler Implementation
```elixir
def handle_event("theme_change", %{"theme" => theme}, socket) do
  {:noreply, assign(socket, :theme, theme)}
end
```

### 3. System Preference Detection
Create a JavaScript hook that:
- Detects `prefers-color-scheme` media query
- Sends initial preference to LiveView on mount
- Listens for system preference changes

### 4. Theme Resolution Logic
Implement function to resolve effective theme:
```elixir
defp resolve_effective_theme("auto"), do: # Use system preference
defp resolve_effective_theme(theme), do: theme
```

## Quality Requirements
- **Code Quality**: Follow Phoenix/Elixir conventions
- **Testing**: Unit tests for event handlers and theme resolution
- **Documentation**: Clear inline comments for theme logic
- **Performance**: State updates should be O(1) operations

## Implementation Steps
1. **Update mount/3**: Add theme to initial socket assigns
2. **Create event handlers**: Implement theme change handling
3. **Add JavaScript hook**: System preference detection
4. **Create helper functions**: Theme resolution and utilities
5. **Update templates**: Pass theme state to child components
6. **Add tests**: Cover theme state management logic

## Files to Modify
- `lib/task_app_web/live/task_live/index.ex` (primary)
- Create: `assets/js/theme_hook.js`
- Update: LiveView template to include theme hook
- Create: `test/task_app_web/live/task_live/index_test.exs` (theme tests)

## Integration Points
- Theme state must be accessible to all UI components
- JavaScript hook must communicate with LiveView process
- System preference changes should trigger theme updates

## Completion Checklist
- [ ] Theme state properly stored in socket assigns
- [ ] Event handlers respond to theme change events
- [ ] JavaScript hook detects and reports system preferences
- [ ] Theme resolution logic handles all three modes
- [ ] Unit tests cover theme functionality
- [ ] Integration verified with manual testing
- [ ] Code reviewed for Phoenix LiveView best practices

## Next Steps After Completion
1. Update status.md with implementation details
2. Coordinate with Task 1.2 for theme toggle component integration
3. Verify theme state is accessible for Phase 2 UI updates