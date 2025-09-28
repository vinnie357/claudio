# Dark Mode Implementation Standards

You are working with the shared standards context for the Dark Mode Implementation project. These standards ensure consistency, quality, and maintainability across all phases and tasks.

## Code Quality Standards

### Phoenix LiveView Conventions
- Follow Phoenix framework conventions for module structure
- Use descriptive function and variable names
- Implement proper error handling with {:ok, result} and {:error, reason} tuples
- Maintain separation of concerns between LiveView logic and presentation

### Elixir Style Guidelines
- Follow the official Elixir style guide
- Use pattern matching effectively for theme state handling
- Implement proper documentation with @doc attributes
- Use consistent naming conventions (snake_case for functions/variables)

### JavaScript Standards
- Use ES6+ features appropriately
- Implement proper error handling with try/catch blocks
- Follow consistent naming conventions (camelCase for variables/functions)
- Add comprehensive comments for complex logic

## Theme Implementation Standards

### Theme State Management
- **Theme Values**: Only use `"light"`, `"dark"`, `"auto"`
- **State Storage**: Always use socket assigns for theme state (`:theme`)
- **Default Behavior**: Default to `"auto"` theme on first visit
- **Error Handling**: Graceful fallback to `"light"` theme on errors

### CSS Class Conventions
- Use Tailwind's `dark:` prefix for dark mode styles
- Maintain consistent class ordering: base classes, then dark: variants
- Use semantic color names when possible
- Document custom color combinations

### Accessibility Requirements
- **Contrast Ratios**: Maintain WCAG AA compliance (4.5:1 for normal text)
- **High Contrast**: Support WCAG AAA compliance (7:1 for enhanced accessibility)
- **Keyboard Navigation**: All theme controls must be keyboard accessible
- **Screen Readers**: Provide appropriate ARIA labels and announcements

## Testing Standards

### Unit Testing
- Test all theme state management functions
- Mock localStorage for storage-related tests
- Use property-based testing for theme value validation
- Maintain >90% code coverage for theme-related code

### Integration Testing
- Test theme persistence across browser sessions
- Verify LiveView event handling for theme changes
- Test JavaScript hook communication with LiveView
- Validate accessibility with automated tools

### Browser Compatibility
- Test on Chrome, Firefox, Safari, and Edge
- Verify mobile browser compatibility
- Test localStorage availability and fallbacks
- Validate CSS transition support

## Performance Standards

### Theme Switching Performance
- Theme state changes: <100ms
- Visual transitions: <300ms
- localStorage operations: <10ms
- No memory leaks in state management

### Bundle Size Impact
- CSS additions: <5KB compressed
- JavaScript additions: <3KB compressed
- No duplicate color definitions
- Optimize Tailwind CSS purging

## Documentation Standards

### Code Documentation
- Document all public functions with @doc
- Include examples for complex theme logic
- Comment non-obvious implementation decisions
- Maintain up-to-date README sections

### User Documentation
- Clear instructions for theme switching
- Keyboard shortcuts documented
- Accessibility features explained
- Troubleshooting common issues

## Security Considerations

### Data Storage
- Never store sensitive information in localStorage
- Validate theme values before storage/usage
- Handle storage quota exceeded gracefully
- No user tracking through theme preferences

### Input Validation
- Validate all theme-related user inputs
- Sanitize values before state updates
- Handle malformed localStorage data
- Prevent injection through theme parameters

## Rollback Procedures

### Feature Rollback
- Document rollback steps for each phase
- Maintain backward compatibility during transitions
- Test rollback procedures in development
- Monitor for issues post-deployment

### Error Recovery
- Graceful degradation when theme system fails
- Clear error messages for users
- Automatic recovery to light theme on errors
- Logging for debugging theme issues

These standards apply to all phases and tasks within the Dark Mode Implementation project. Reference this document when implementing any theme-related functionality to ensure consistency and quality.