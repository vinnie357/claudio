# Task 1.4: Session Management Agent

You are a specialized agent focused exclusively on completing Task 1.4: Session Management. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Implement comprehensive session management system including authentication plugs, session persistence, logout functionality, and security configuration for the Phoenix application
- **Priority**: High
- **Estimated Effort**: 1 day
- **Dependencies**: Tasks 1, 2, and 3 completion (needs User schema, Auth context, and UI flows)

## Acceptance Criteria
- [ ] Authentication plugs for route protection
- [ ] Session persistence across application requests
- [ ] Secure logout functionality with session cleanup
- [ ] Session security configuration (timeouts, secure flags)
- [ ] Current user helpers and access functions
- [ ] Authentication state management in LiveView
- [ ] Session token management and rotation
- [ ] Integration with existing app middleware stack

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Requires User schema (Task 1), Auth context (Task 2), and Auth UI (Task 3)
- **External Resources**: Phoenix session documentation, security best practices
- **Integration Points**: Must work with existing TaskApp routing and middleware

## Implementation Guidelines
### Session Architecture
- Use Phoenix built-in session management
- Implement custom authentication plugs
- Create session helper modules
- Configure secure session options

### Core Components to Implement
```elixir
# Authentication Plugs
TaskAppWeb.Auth - main authentication plug
require_authenticated_user/2
redirect_if_user_is_authenticated/2
fetch_current_user/2

# Session Helpers
get_current_user/1
user_signed_in?/1
sign_in_user/2
sign_out_user/1

# LiveView Authentication
on_mount authentication hooks
handle session state in LiveView components
```

### Security Configuration
- Session timeout configuration
- Secure cookie flags (httpOnly, secure, sameSite)
- Session token rotation strategy
- CSRF protection integration
- Session storage optimization

## Technical Requirements
- **Technologies**: Phoenix sessions, Plug authentication
- **Security**: Secure session configuration, token rotation
- **Performance**: Efficient session lookup, minimal database queries
- **Integration**: Work with existing Phoenix pipeline and LiveView

## Session Management Features
### Authentication State
- Maintain current user in session
- Handle authentication across page loads
- Support remember-me functionality (optional)
- Clean session expiration handling

### Security Features
- Session fixation protection
- Automatic session cleanup on logout
- Token-based session validation
- Protection against session hijacking
- Proper CSRF integration

## Plug Implementation
### Authentication Plug Pipeline
- `fetch_current_user` - loads user from session
- `require_authenticated_user` - protects authenticated routes
- `redirect_if_user_is_authenticated` - handles already-authenticated users

### Route Protection Strategy
- Public routes (login, register, home)
- Protected routes (task management, user profile)
- Admin routes (if applicable)
- API endpoint protection

## Quality Requirements
- Session operations must be performant
- Security configuration follows Phoenix best practices
- Session state consistent across LiveView and traditional requests
- Proper error handling for expired/invalid sessions
- Comprehensive testing of authentication flows

## Completion Checklist
- [ ] Authentication plugs implemented and tested
- [ ] Session persistence working across requests
- [ ] Logout functionality complete with cleanup
- [ ] Security configuration properly set
- [ ] Current user helpers functional
- [ ] LiveView authentication integration complete
- [ ] Session token management implemented
- [ ] Route protection working correctly
- [ ] Integration tested with auth UI flows

## Deliverables
- `lib/task_app_web/auth.ex` - main authentication plug
- Updated `lib/task_app_web/router.ex` with authentication pipeline
- Session configuration in Phoenix config files
- LiveView authentication hooks
- Helper modules for session management
- Comprehensive test suite for session functionality

## Security Considerations
### Session Configuration
- Session timeout: Configure appropriate expiration
- Cookie security: httpOnly, secure, sameSite settings
- Token rotation: Implement secure token refresh
- Storage: Optimize session storage approach

### Attack Protection
- Session fixation prevention
- Cross-site request forgery (CSRF) protection
- Session hijacking mitigation
- Proper logout and cleanup procedures

## Integration Requirements
- Work with existing TaskApp middleware stack
- Support both traditional and LiveView requests
- Integrate with authentication UI flows from Task 3
- Prepare session context for Phase 2 authorization

## Testing Strategy
- Authentication plug testing
- Session persistence testing
- Security configuration validation
- Integration testing with auth flows
- Edge case testing (expired sessions, invalid tokens)
- Performance testing for session operations

## LiveView Integration
- Implement `on_mount` authentication hooks
- Handle authentication state in LiveView
- Manage session updates in real-time components
- Coordinate with existing TaskApp LiveView patterns

## Route Configuration
- Configure authenticated vs. public route scopes
- Set up proper redirects for authentication flows
- Handle authentication failures gracefully
- Integrate with existing app navigation

## Performance Considerations
- Minimize database queries for user lookup
- Efficient session storage and retrieval
- Optimize current_user access patterns
- Consider caching strategies for frequent operations

## Next Phase Preparation
Upon completion, this session foundation enables:
- **Phase 2**: User-based task authorization
- **Phase 2**: Task ownership and access control
- Complete authentication user experience with persistent sessions