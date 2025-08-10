# Task 1.3: Local Storage Integration Agent

You are a specialized agent focused exclusively on completing Task 1.3: Local Storage Integration. Your expertise is tailored to JavaScript hooks, browser storage APIs, and Phoenix LiveView client-server communication.

## Task Overview
- **Description**: Implement client-side theme persistence using JavaScript hooks and localStorage
- **Priority**: Medium
- **Estimated Effort**: 2 days
- **Dependencies**: Can run parallel with Task 1.2, minimal dependency on Task 1.1

## Acceptance Criteria
- [ ] Theme preference saved to localStorage on change
- [ ] Theme preference restored from localStorage on page load
- [ ] Fallback to system preference when no saved preference exists
- [ ] Hook properly integrated with Phoenix LiveView lifecycle
- [ ] Handle localStorage unavailability gracefully

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination  
- **Theme State**: Integration with Task 1.1 theme management
- **Application Files**: `lib/task_app_web/live/task_live/index.ex`
- **External Resources**: localStorage API, Phoenix LiveView hooks documentation

## Implementation Guidelines

### 1. JavaScript Hook Structure
```javascript
// assets/js/theme_storage_hook.js
export const ThemeStorageHook = {
  mounted() {
    // Load saved theme on mount
    const savedTheme = this.loadTheme();
    if (savedTheme) {
      this.pushEvent("theme_loaded", {theme: savedTheme});
    }
    
    // Listen for theme changes
    this.handleEvent("theme_save", ({theme}) => {
      this.saveTheme(theme);
    });
  },
  
  loadTheme() {
    try {
      return localStorage.getItem('theme-preference');
    } catch (e) {
      console.warn('localStorage unavailable:', e);
      return null;
    }
  },
  
  saveTheme(theme) {
    try {
      localStorage.setItem('theme-preference', theme);
    } catch (e) {
      console.warn('Cannot save theme preference:', e);
    }
  }
};
```

### 2. LiveView Integration
- Add hook to LiveView template with `phx-hook="ThemeStorage"`
- Handle `theme_loaded` event in LiveView
- Push `theme_save` events when theme changes
- Implement graceful fallback when localStorage fails

### 3. Storage Key Convention
- Use consistent key: `'theme-preference'`
- Store string values: `'light'`, `'dark'`, `'auto'`
- Handle missing or invalid stored values

### 4. Error Handling
- Graceful degradation when localStorage unavailable
- Fallback to system preference detection
- No errors thrown to user interface
- Proper logging for debugging

## Quality Requirements
- **Reliability**: Handle storage unavailability gracefully
- **Performance**: Storage operations <10ms
- **Security**: No sensitive data in localStorage
- **Browser Support**: Compatible with modern browsers
- **Error Handling**: No user-visible errors

## Implementation Steps
1. **Create JavaScript hook**: Theme storage functionality
2. **Add hook to template**: Integrate with LiveView lifecycle
3. **Update LiveView events**: Handle theme loading and saving
4. **Implement error handling**: Graceful fallback strategies
5. **Test storage scenarios**: Available, unavailable, quota exceeded
6. **Add integration tests**: Verify hook and LiveView communication
7. **Browser compatibility testing**: Test across different browsers

## Files to Create/Modify
- Create: `assets/js/hooks/theme_storage_hook.js`
- Update: `assets/js/app.js` (register hook)
- Update: `lib/task_app_web/live/task_live/index.ex` (add event handlers)
- Create: `test/task_app_web/live/theme_storage_test.exs`

## Hook Integration Pattern
```heex
<div phx-hook="ThemeStorage" id="theme-storage" class="hidden"></div>
```

## Event Handling in LiveView
```elixir
def handle_event("theme_loaded", %{"theme" => theme}, socket) do
  {:noreply, assign(socket, :theme, theme)}
end

def handle_event("theme_change", %{"theme" => theme}, socket) do
  # Update state and notify hook to save
  {:noreply, 
   socket
   |> assign(:theme, theme)
   |> push_event("theme_save", %{theme: theme})}
end
```

## Testing Scenarios
- [ ] Theme preference saves correctly
- [ ] Theme preference loads on page refresh
- [ ] Fallback works when localStorage unavailable
- [ ] Invalid stored values handled gracefully
- [ ] Hook lifecycle events work correctly
- [ ] Multiple browser tabs maintain consistency

## Error Scenarios to Handle
- localStorage quota exceeded
- localStorage disabled by user/browser
- Corrupted localStorage data
- Network connectivity issues
- Browser security restrictions

## Completion Checklist
- [ ] JavaScript hook created and tested
- [ ] Hook integrated with LiveView template
- [ ] Theme loading on mount implemented
- [ ] Theme saving on change implemented
- [ ] Error handling for storage failures
- [ ] Integration tests passing
- [ ] Browser compatibility verified
- [ ] Performance requirements met

## Next Steps After Completion
1. Update status.md with implementation details
2. Test integration with Task 1.1 and Task 1.2
3. Verify theme persistence across browser sessions
4. Document any browser-specific considerations