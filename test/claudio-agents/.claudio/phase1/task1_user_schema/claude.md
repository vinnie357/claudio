# Task 1.1: User Schema and Database Setup Agent

You are a specialized agent focused exclusively on completing Task 1.1: User Schema and Database Setup. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Create comprehensive database schema and migration for user authentication, including all necessary database structures for secure user management
- **Priority**: High
- **Estimated Effort**: 1 day
- **Dependencies**: Phoenix app database configuration, Ecto setup

## Acceptance Criteria
- [ ] User migration file created with proper fields (email, password_hash, inserted_at, updated_at)
- [ ] User schema module implemented with validations and changesets
- [ ] Database seeding scripts created for development/testing
- [ ] User factory created for test data generation
- [ ] Migration runs successfully without errors
- [ ] Schema supports unique email constraints
- [ ] Password field properly handles hashing (no plaintext storage)

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **External Resources**: Phoenix/Ecto documentation, database best practices
- **Integration Points**: Must align with existing TaskApp schema patterns

## Implementation Guidelines
### Database Migration
- Use Phoenix generators where appropriate (`mix phx.gen.auth`)
- Follow existing migration naming conventions in the project
- Include proper indexes for email lookup performance
- Add timestamps for audit trail

### User Schema
- Implement proper Ecto changesets for data validation
- Include email format validation
- Add password confirmation handling
- Support case-insensitive email matching
- Follow Phoenix authentication best practices

### Testing Infrastructure
- Create user factory in `test/support/factories.ex`
- Include valid and invalid user scenarios
- Add database constraints testing
- Ensure factory works with existing test setup

## Technical Requirements
- **Technologies**: Phoenix, Ecto, PostgreSQL
- **Database**: Add users table with proper constraints
- **Security**: No plaintext password storage, email uniqueness
- **Performance**: Index email field for login lookup efficiency

## Quality Requirements
- All migrations must be reversible
- Schema changes must not break existing functionality
- Comprehensive test coverage for validations
- Follow existing Phoenix app code style
- Documentation for any custom validations

## Completion Checklist
- [ ] Migration file created and tested (up/down)
- [ ] User schema module implemented with validations
- [ ] Factory created and functional
- [ ] Tests written and passing
- [ ] Database seeding scripts working
- [ ] Integration verified with existing app structure
- [ ] Code reviewed against Phoenix best practices

## Deliverables
- `priv/repo/migrations/[timestamp]_create_users.exs`
- `lib/task_app/accounts/user.ex` (or similar schema location)
- `test/support/factories.ex` updates
- `priv/repo/seeds.exs` updates for user data
- Test files covering all validation scenarios

## Next Task Preparation
Upon completion, this schema foundation enables:
- Task 2: Authentication Context Module (can begin immediately)
- Task 3: Registration and Login UI (needs this schema for forms)
- Task 4: Session Management (needs user model for session handling)