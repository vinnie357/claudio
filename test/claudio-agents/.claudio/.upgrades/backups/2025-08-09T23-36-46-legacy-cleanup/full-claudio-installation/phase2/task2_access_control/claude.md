# Task 2.2: Access Control Implementation Agent

You are a specialized agent focused exclusively on completing Task 2.2: Access Control Implementation. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Implement comprehensive authorization system including ownership validation, access control policies, and security plugs to ensure users can only access their own tasks
- **Priority**: High
- **Estimated Effort**: 1 day
- **Dependencies**: Task 2.1 (User-Task Database Association) completion

## Acceptance Criteria
- [ ] Authorization policy module created for task access control
- [ ] Task ownership validation functions implemented
- [ ] Access control plugs for all task operations (CRUD)
- [ ] Task context functions updated for user-scoped queries
- [ ] Authorization helper functions for controllers and LiveViews
- [ ] Proper error handling for unauthorized access attempts
- [ ] Integration with Phoenix authentication system
- [ ] Performance-optimized user-scoped database queries

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Tasks**: Requires user-task associations from Task 2.1
- **Phase Dependencies**: Authentication system from Phase 1
- **External Resources**: Phoenix authorization patterns, policy-based access control
- **Integration Points**: Task context, controllers, LiveViews, authentication plugs

## Implementation Guidelines
### Authorization Policy Structure
Create policy-based authorization system:
```elixir
# TaskApp.Authorization.TaskPolicy
authorize_task_access(current_user, task, action)
can_create_task?(user)
can_view_task?(user, task)
can_edit_task?(user, task)
can_delete_task?(user, task)
```

### Access Control Plugs
Implement controller plugs for route protection:
```elixir
# TaskApp.Auth.AuthorizeTasks
ensure_task_owner/2
authorize_task_action/2
load_user_task/2
```

### User-Scoped Queries
Update task context for user-specific operations:
```elixir
# All task queries scoped to current user
get_user_tasks(user)
get_user_task!(user, task_id)
create_user_task(user, attrs)
update_user_task(user, task, attrs)
delete_user_task(user, task)
```

## Technical Requirements
- **Authorization**: Policy-based access control system
- **Performance**: Efficient user-scoped database queries
- **Security**: Prevent unauthorized access at multiple layers
- **Integration**: Work with existing authentication system
- **Error Handling**: Graceful handling of authorization failures

## Authorization Layers
### 1. Route-Level Protection
- Ensure user is authenticated for all task routes
- Load current user context for authorization

### 2. Resource-Level Authorization
- Verify task ownership before any operation
- Implement consistent authorization checks

### 3. Query-Level Scoping
- All task database queries scoped to current user
- Prevent accidental data leakage

### 4. UI-Level Controls
- Show/hide actions based on user permissions
- Provide appropriate feedback for unauthorized actions

## Security Implementation
### Authorization Policies
- Resource ownership validation
- Action-based permissions (view, edit, delete)
- Role-based access (if applicable)
- Consistent policy application

### Access Control Plugs
- Pre-action authorization checks
- Resource loading with ownership validation
- Automatic error responses for violations
- Integration with authentication pipeline

### Database Query Scoping
- User-scoped task queries throughout application
- Prevent cross-user data access
- Optimize queries for user-specific operations
- Maintain query performance

## Quality Requirements
- Authorization consistently applied across all task operations
- No unauthorized access possible through any route
- Performance impact minimized through efficient queries
- Clear error messages for authorization failures
- Comprehensive test coverage for all authorization scenarios

## Completion Checklist
- [ ] Authorization policy module implemented
- [ ] Access control plugs created and tested
- [ ] Task context updated with user-scoped queries
- [ ] Authorization helpers implemented
- [ ] Integration with authentication system complete
- [ ] Error handling for unauthorized access
- [ ] Performance optimization completed
- [ ] Security testing passed
- [ ] All authorization scenarios tested

## Deliverables
- `lib/task_app/authorization/task_policy.ex`
- `lib/task_app_web/plugs/authorize_tasks.ex`
- Updated `lib/task_app/task_store.ex` or task context
- Authorization helper functions
- Updated controller integration points
- Comprehensive test suite for authorization
- Security configuration documentation

## Authorization Patterns
### Ownership-Based Access Control
- Users can only access their own tasks
- Task ownership validated on every operation
- Consistent ownership checks across the application

### Action-Based Permissions
- Create: Authenticated users can create tasks
- Read: Users can view only their own tasks
- Update: Users can edit only their own tasks
- Delete: Users can delete only their own tasks

### Policy Integration
- Centralized authorization logic in policy modules
- Reusable authorization functions
- Clear separation of authorization concerns

## Performance Optimization
### Query Scoping
- Add user_id to all task queries by default
- Use database indexes for efficient filtering
- Minimize N+1 query problems
- Optimize for common access patterns

### Caching Considerations
- Cache user permissions where appropriate
- Consider authorization result caching
- Balance security with performance

## Error Handling
### Authorization Failures
- Clear, actionable error messages
- Appropriate HTTP status codes (403 Forbidden)
- Logging of authorization violations
- User-friendly error pages

### Edge Cases
- Handle missing resources gracefully
- Deal with deleted users/tasks appropriately
- Manage concurrent access scenarios

## Integration Requirements
- Work seamlessly with Phase 1 authentication
- Prepare for Task 2.3 controller updates
- Maintain compatibility with existing task operations
- Support LiveView authorization patterns

## Testing Strategy
- Unit tests for authorization policies
- Integration tests for access control plugs
- Security tests for unauthorized access attempts
- Performance tests for user-scoped queries
- End-to-end tests for complete authorization flows

## Security Considerations
- Defense in depth: multiple authorization layers
- Fail-safe: deny access when in doubt
- Audit trail: log authorization decisions
- Regular security review of authorization logic

## Next Task Preparation
Upon completion, this authorization foundation enables:
- **Task 2.3**: Controller and View Updates (can use authorization functions)
- **Phase 3**: Security testing with proper access controls
- Complete user-based task isolation