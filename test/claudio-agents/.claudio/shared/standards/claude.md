# Dark Mode Implementation Standards

## Development Standards for Dark Mode Feature

### Code Quality Standards

#### CSS/Tailwind Standards
- **Dark Mode Strategy**: Use Tailwind's `class` strategy with `dark:` prefix
- **Color Naming**: Use semantic color names that adapt to theme (e.g., `text-gray-900 dark:text-white`)
- **Contrast Requirements**: All text must meet WCAG AA standards (4.5:1 for normal, 3:1 for large text)
- **Component Consistency**: All components must support both light and dark themes

#### JavaScript Standards
- **Theme Management**: Use functional programming approach for theme utilities
- **Error Handling**: Gracefully handle localStorage unavailability
- **Performance**: Theme detection and application should complete in <100ms
- **Browser Support**: Support all modern browsers (Chrome 80+, Firefox 75+, Safari 13+, Edge 80+)

#### Phoenix/Elixir Standards
- **LiveView Integration**: Theme state should integrate with Phoenix LiveView hooks
- **Server Awareness**: Server should have access to current theme preference when needed
- **Session Handling**: Theme preference should persist across LiveView updates
- **Performance**: No server-side performance impact from theme handling

### Design System Standards

#### Color Palette
```css
/* Light Theme Colors */
--bg-primary: white
--bg-secondary: #f8fafc
--text-primary: #1f2937
--text-secondary: #6b7280
--accent-primary: #3b82f6
--border-primary: #e5e7eb

/* Dark Theme Colors */
--bg-primary-dark: #1f2937
--bg-secondary-dark: #111827
--text-primary-dark: white
--text-secondary-dark: #d1d5db
--accent-primary-dark: #60a5fa
--border-primary-dark: #374151
```

#### Component Patterns
- **Cards**: Use `bg-white dark:bg-gray-800` with proper border colors
- **Forms**: Maintain consistent input styling across themes
- **Buttons**: Ensure all states (hover, active, disabled) work in both themes
- **Navigation**: Header and navigation elements adapt contextually

### Accessibility Standards

#### Contrast Requirements
- **Normal Text**: 4.5:1 minimum contrast ratio
- **Large Text**: 3:1 minimum contrast ratio
- **Interactive Elements**: Clear focus indicators in both themes
- **Error States**: Maintain visibility and accessibility in dark mode

#### User Experience
- **Theme Toggle**: Easy to discover and use
- **System Preference**: Respect user's system theme preference by default
- **Persistence**: Theme choice persists across sessions
- **Performance**: No visual flashing or delay when switching themes

### Testing Standards

#### Automated Testing
- **Unit Tests**: Cover all theme management functions
- **Integration Tests**: Test LiveView hook integration
- **Visual Tests**: Regression testing for component styling
- **Performance Tests**: Validate theme switching speed

#### Browser Testing
- **Desktop**: Chrome, Firefox, Safari, Edge (latest 2 versions)
- **Mobile**: iOS Safari, Chrome Mobile
- **Features**: Theme persistence, visual consistency, performance

#### Accessibility Testing
- **Contrast**: Automated contrast ratio validation
- **Focus**: Keyboard navigation testing in both themes
- **Screen Readers**: Ensure proper announcements for theme changes

### Implementation Guidelines

#### File Organization
```
assets/js/
├── theme-manager.js          # Core theme management utilities
├── liveview-hooks.js        # Phoenix LiveView theme hooks
└── app.js                   # Main application file

lib/task_app_web/
├── components/layouts/      # Layout components with dark mode
└── live/task_live/          # LiveView components with theme support
```

#### Documentation Requirements
- **Code Comments**: Document theme-related functions and decisions
- **User Documentation**: How to use dark mode feature
- **Developer Documentation**: How to extend dark mode to new components
- **Testing Documentation**: How to test theme functionality

### Security Considerations

#### Client-Side Storage
- **Data Validation**: Validate theme values from localStorage
- **Fallback Strategy**: Handle localStorage unavailability gracefully
- **XSS Prevention**: Sanitize any theme-related user inputs

#### Server Integration
- **CSP Headers**: Ensure Content Security Policy allows theme scripts
- **CSRF Protection**: Maintain CSRF protection for theme-related requests
- **Session Security**: Theme preference doesn't compromise session security