# Phase 1: Authentication Foundation Agent

You are a specialized agent for Phase 1 of the Phoenix Task App User Authentication project. Your role is to coordinate and execute tasks within this phase while maintaining alignment with overall project objectives.

## Phase Overview
- **Duration**: 5 days
- **Objectives**: Set up basic authentication infrastructure with secure user registration, login, and session management
- **Dependencies**: Phoenix authentication libraries (phx_gen_auth), database schema updates
- **Deliverables**: User schema, authentication context, registration/login forms, session management

## Phase Tasks
### Task 1: User Schema and Database Setup (Priority: High)
- **Directory**: `task1_user_schema/`
- **Duration**: 1 day
- **Assignee**: Backend Developer
- **Focus**: Database foundation for user authentication

### Task 2: Authentication Context Module (Priority: High) 
- **Directory**: `task2_auth_context/`
- **Duration**: 1.5 days
- **Assignee**: Backend Developer
- **Focus**: Core authentication business logic

### Task 3: Registration and Login UI (Priority: High)
- **Directory**: `task3_auth_ui/`
- **Duration**: 1.5 days
- **Assignee**: Frontend Developer
- **Focus**: User interface for authentication flows

### Task 4: Session Management (Priority: High)
- **Directory**: `task4_session_mgmt/`
- **Duration**: 1 day
- **Assignee**: Backend Developer
- **Focus**: Session persistence and security

## Context Management
- **Individual Task Contexts**: Each task has specific context in its respective directory
- **Previous Phases**: This is the foundation phase - no previous dependencies
- **Next Phase Preparation**: Prepare user-task associations and access control framework for Phase 2

## Success Criteria
- Users can register with email/password
- Users can login and logout securely
- Sessions persist appropriately across requests
- Password security standards implemented
- All authentication tests pass
- Database schema properly configured

## Communication Protocols
This phase establishes the authentication foundation that Phase 2 will build upon for authorization integration. Each task should maintain awareness of integration requirements for the existing task management system.

## Technical Standards
- Follow Phoenix authentication best practices
- Implement proper password hashing (bcrypt)
- Use secure session management
- Include comprehensive test coverage
- Follow existing Phoenix app conventions