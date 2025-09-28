# Task 2.3: Controller and View Updates Agent

You are a specialized agent focused exclusively on completing Task 2.3: Controller and View Updates. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Update existing task controllers and LiveViews to integrate with authentication system and implement user-scoped operations while preserving existing functionality and user experience
- **Priority**: High
- **Estimated Effort**: 1 day
- **Dependencies**: Task 2.1 (User-Task Association) and Task 2.2 (Access Control) completion

## Acceptance Criteria
- [ ] Task controllers updated with authentication requirements and authorization
- [ ] Task LiveViews integrated with user authentication state
- [ ] Task creation automatically associates with current authenticated user
- [ ] Task listing shows only current user's tasks
- [ ] Task editing/deletion restricted to task owners
- [ ] Error handling for unauthorized access with user-friendly messages
- [ ] Navigation updates reflecting authentication state
- [ ] Existing task management UI/UX preserved and enhanced

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: User-task associations (Task 2.1), access control system (Task 2.2)
- **Phase Dependencies**: Authentication system from Phase 1
- **External Resources**: Phoenix controller patterns, LiveView authentication
- **Integration Points**: Existing TaskController, task LiveViews, authentication plugs

## Implementation Guidelines
### Controller Updates
Update existing task controllers with authorization:
```elixir
# TaskController updates
- Add authentication plugs
- Integrate authorization checks
- Update CRUD operations for user scoping
- Handle authorization failures gracefully
```

### LiveView Integration
Update task LiveViews for authenticated users:
```elixir
# Task LiveView updates
- Integrate with authentication session
- Show user-specific task data
- Handle authentication state changes
- Update real-time interactions for user scoping
```

### User Experience Enhancements
- Seamless authentication integration
- Preserve existing task management workflow
- Add user-specific features (task ownership display)
- Improve navigation with authentication awareness

## Technical Requirements
- **Controllers**: Integration with authorization plugs and user context
- **LiveViews**: Authentication state management and user-scoped data
- **Navigation**: Authentication-aware menu and routing
- **Error Handling**: User-friendly unauthorized access messages
- **Performance**: Efficient user-scoped data loading

## Controller Integration Specifications
### Authentication Integration
- Apply authentication plugs to all task routes
- Load current user context for all actions
- Integrate with authorization system from Task 2.2

### CRUD Operation Updates
```elixir
# Index: Show only user's tasks
def index(conn, _params) do
  tasks = TaskStore.get_user_tasks(conn.assigns.current_user)
  # existing render logic
end

# Show: Verify ownership
def show(conn, %{"id" => id}) do
  task = TaskStore.get_user_task!(conn.assigns.current_user, id)
  # existing render logic with authorization check
end

# Create: Associate with current user
def create(conn, %{"task" => task_params}) do
  TaskStore.create_user_task(conn.assigns.current_user, task_params)
  # existing create logic
end

# Update/Delete: Verify ownership through authorization
```

### Error Handling
- Handle authorization failures gracefully
- Provide clear error messages for users
- Maintain consistent error handling patterns
- Log security violations appropriately

## LiveView Integration Specifications
### Authentication State Management
- Access current user from session
- Handle authentication state changes
- Update UI based on authentication status
- Maintain real-time functionality with user scoping

### Task LiveView Updates
```elixir
# TaskLive.Index updates
- Load user-specific tasks only
- Handle real-time updates for user's tasks
- Show task ownership information
- Integrate with authentication helpers

# Task creation/editing
- Auto-associate tasks with current user
- Validate task ownership for editing
- Handle authorization failures in real-time
```

### UI Enhancements
- Display task ownership information
- Add user-specific navigation elements
- Show authentication status
- Improve task management workflow

## Quality Requirements
- All existing task functionality preserved
- Seamless authentication integration
- No regression in user experience
- Performance maintained or improved
- Comprehensive test coverage for all updated flows
- Accessibility maintained throughout updates

## Completion Checklist
- [ ] Task controllers updated with authentication/authorization
- [ ] Task LiveViews integrated with user authentication
- [ ] User-scoped task operations implemented
- [ ] Authorization error handling implemented
- [ ] Navigation updated for authenticated state
- [ ] UI enhancements for task ownership complete
- [ ] Performance validated for user-scoped operations
- [ ] Integration tested with authentication system
- [ ] All existing functionality verified working

## Deliverables
- Updated `lib/task_app_web/controllers/task_controller.ex`
- Updated `lib/task_app_web/live/task_live/index.ex`
- Updated task LiveView templates (.heex files)
- Updated navigation components
- Error handling templates for authorization failures
- Updated test files for controllers and LiveViews
- Integration documentation

## UI/UX Considerations
### Preserve Existing Experience
- Keep familiar task management interface
- Maintain existing workflows and interactions
- Preserve performance characteristics
- Keep responsive design intact

### Authentication Enhancements
- Clear indication of authentication status
- Smooth login/logout transitions
- User-friendly error messages
- Appropriate redirects after authentication

### Task Ownership Features
- Subtle indication of task ownership
- Clear feedback for authorization restrictions
- Intuitive navigation for authenticated users

## Navigation Updates
### Authentication-Aware Menus
- Show login/logout options appropriately
- Display current user information
- Provide authentication-related navigation
- Maintain existing task management access

### Route Protection
- Redirect unauthenticated users to login
- Handle deep-linking with authentication
- Preserve intended destination after login

## Performance Optimization
### User-Scoped Data Loading
- Efficient queries for user tasks
- Minimize N+1 query problems
- Optimize LiveView data subscriptions
- Cache user-specific data appropriately

### Real-Time Updates
- Scope real-time updates to user's tasks
- Optimize Phoenix PubSub usage
- Maintain LiveView performance

## Testing Strategy
- Controller integration tests with authentication
- LiveView tests with user sessions
- Authorization flow testing
- UI interaction testing with authenticated users
- Performance testing for user-scoped operations
- Regression testing for existing functionality

## Integration Requirements
- Seamless integration with Phase 1 authentication
- Use Task 2.2 authorization functions
- Work with Task 2.1 user-task associations
- Maintain compatibility with existing task data
- Support all existing task management features

## Error Handling Strategy
### Authorization Failures
- User-friendly error messages
- Appropriate redirects (login or error page)
- Logging for security monitoring
- Consistent error handling patterns

### Edge Cases
- Handle deleted tasks/users
- Manage concurrent user sessions
- Deal with network connectivity issues
- Handle authentication session expiry

## Security Considerations
- Ensure all task operations are properly authorized
- Prevent unauthorized data access through UI
- Validate user permissions at every interaction
- Maintain security through UI state changes

## Next Phase Preparation
Upon completion, this integration enables:
- **Phase 3**: Comprehensive testing of complete authentication system
- **Phase 3**: Security audit of integrated system
- Complete user-authenticated task management experience