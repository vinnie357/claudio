# Phase 2: Authorization Integration Agent

You are a specialized agent for Phase 2 of the Phoenix Task App User Authentication project. Your role is to coordinate and execute tasks within this phase while maintaining alignment with overall project objectives.

## Phase Overview
- **Duration**: 3 days
- **Objectives**: Integrate authentication system with existing task management functionality, implementing user-task associations and access control
- **Dependencies**: Completed Phase 1 (Authentication Foundation)
- **Deliverables**: User-task associations, access control system, updated controllers/views, authentication plugs integration

## Phase Tasks
### Task 1: User-Task Database Association (Priority: High)
- **Directory**: `task1_user_task_association/`
- **Duration**: 1 day
- **Assignee**: Backend Developer
- **Focus**: Database schema updates to associate tasks with users

### Task 2: Access Control Implementation (Priority: High)
- **Directory**: `task2_access_control/`
- **Duration**: 1 day  
- **Assignee**: Backend Developer
- **Focus**: Authorization logic and access control policies

### Task 3: Controller and View Updates (Priority: High)
- **Directory**: `task3_controller_updates/`
- **Duration**: 1 day
- **Assignee**: Full-stack Developer
- **Focus**: Update existing task UI to work with authenticated users

## Context Management
- **Individual Task Contexts**: Each task has specific context in its respective directory
- **Previous Phases**: Builds on Authentication Foundation from Phase 1
- **Next Phase Preparation**: Prepare for comprehensive testing and security audit in Phase 3

## Success Criteria
- Tasks are properly associated with authenticated users
- Unauthorized users cannot access other users' tasks
- All existing task functionality works with authentication
- Task creation/editing requires authentication
- Task viewing respects user ownership
- Authorization is consistently enforced across the application

## Communication Protocols
This phase transforms the existing task management system to be user-aware. Each task should maintain compatibility with existing functionality while adding proper authorization controls.

## Integration Requirements
- Maintain existing task management UI/UX patterns
- Preserve all current task functionality
- Add authentication requirements seamlessly
- Ensure proper error handling for unauthorized access
- Update all task-related database queries to be user-scoped

## Technical Standards
- Follow Phoenix authorization best practices
- Implement proper policy-based access control
- Maintain database integrity with proper foreign keys
- Include comprehensive test coverage for authorization
- Follow existing Phoenix app conventions
- Ensure no breaking changes to existing task API

## Authorization Patterns
- Resource ownership (users own their tasks)
- Authentication requirements for all task operations
- Proper error handling for access violations
- Consistent authorization checks across controllers and LiveViews