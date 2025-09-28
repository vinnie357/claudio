# Task 1.3: Registration and Login UI Agent

You are a specialized agent focused exclusively on completing Task 1.3: Registration and Login UI. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Create user-facing registration and login forms using Phoenix LiveView, with comprehensive form validation, error handling, and seamless integration with the authentication context
- **Priority**: High
- **Estimated Effort**: 1.5 days
- **Dependencies**: Task 1 (User Schema) completion; Task 2 (Auth Context) for full integration

## Acceptance Criteria
- [ ] User registration form with email/password fields
- [ ] User login form with email/password fields
- [ ] Client-side and server-side form validation
- [ ] Error handling with user-friendly messages
- [ ] Success feedback and redirects
- [ ] Password confirmation field for registration
- [ ] Form accessibility standards compliance
- [ ] Integration with existing app navigation and layout

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Uses User schema (Task 1), integrates with Auth context (Task 2)
- **External Resources**: Phoenix LiveView documentation, form validation patterns
- **Integration Points**: Must align with existing TaskApp UI patterns and components

## Implementation Guidelines
### LiveView Components Structure
- Create `lib/task_app_web/live/auth_live/` directory structure
- Registration LiveView: `register.ex` and `register.html.heex`
- Login LiveView: `login.ex` and `login.html.heex`
- Shared components in existing components directory

### Form Implementation
- Use Phoenix LiveView form helpers
- Implement real-time validation feedback
- Handle form submissions with proper error states
- Provide clear user feedback for all interactions
- Follow existing app's form styling patterns

### UI/UX Requirements
- Clean, consistent design matching existing app
- Responsive design for mobile/desktop
- Loading states during form submission
- Clear error messaging without technical details
- Accessible form labels and structure
- Password visibility toggle option

## Technical Requirements
- **Technologies**: Phoenix LiveView, Phoenix HTML helpers
- **Styling**: Follow existing TaskApp CSS/styling approach
- **Validation**: Client-side (LiveView) + server-side (context)
- **Accessibility**: WCAG compliance, proper ARIA labels
- **Security**: CSRF protection, proper form tokens

## Form Specifications
### Registration Form
- Email field (with format validation)
- Password field (with strength requirements)
- Password confirmation field
- Terms/privacy acknowledgment (if required)
- Submit button with loading state

### Login Form  
- Email field
- Password field
- Remember me option (if implementing)
- Submit button with loading state
- "Forgot password?" link (for future implementation)

## Integration Requirements
- Use Authentication context functions from Task 2
- Integrate with existing app routing
- Follow existing navigation patterns
- Handle authentication state changes
- Redirect authenticated users appropriately

## Quality Requirements
- Form validation provides immediate, helpful feedback
- Error messages are user-friendly and actionable
- All form interactions work without JavaScript (progressive enhancement)
- Comprehensive test coverage for form interactions
- Responsive design testing across devices

## Completion Checklist
- [ ] Registration LiveView implemented and functional
- [ ] Login LiveView implemented and functional
- [ ] Form validation working (client and server)
- [ ] Error handling comprehensive and user-friendly
- [ ] Integration with authentication context complete
- [ ] UI matches existing app design patterns
- [ ] Accessibility requirements met
- [ ] Tests written and passing
- [ ] Responsive design validated

## Deliverables
- `lib/task_app_web/live/auth_live/register.ex`
- `lib/task_app_web/live/auth_live/register.html.heex`
- `lib/task_app_web/live/auth_live/login.ex`
- `lib/task_app_web/live/auth_live/login.html.heex`
- Updated router configuration
- CSS/styling updates as needed
- Test files for LiveView components

## Routing Integration
- Add routes to `lib/task_app_web/router.ex`
- Configure proper scopes for authenticated/unauthenticated users
- Handle redirects after successful authentication
- Integrate with existing app navigation

## Testing Strategy
- LiveView integration tests
- Form validation testing
- Error handling scenarios
- Success flow testing
- Accessibility testing
- Cross-browser compatibility

## UI/UX Considerations
- Match existing TaskApp visual design
- Provide clear feedback for all user actions
- Handle edge cases gracefully (network errors, etc.)
- Consider user flow from registration → first login
- Maintain consistent messaging and tone

## Next Task Preparation
Upon completion, these forms enable:
- **Task 4**: Session Management (needs login/logout flows)
- **Phase 2**: User can authenticate before accessing tasks
- Full authentication user experience testing