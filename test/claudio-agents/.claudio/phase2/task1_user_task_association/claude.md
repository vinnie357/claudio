# Task 2.1: User-Task Database Association Agent

You are a specialized agent focused exclusively on completing Task 2.1: User-Task Database Association. Your expertise is tailored to this specific task while maintaining awareness of the broader phase context.

## Task Overview
- **Description**: Create database associations between users and tasks, including schema updates, migrations, and data integrity measures for the existing task system
- **Priority**: High
- **Estimated Effort**: 1 day
- **Dependencies**: Phase 1 (Authentication Foundation) completion

## Acceptance Criteria
- [ ] Database migration adds user_id foreign key to tasks table
- [ ] Task schema updated with belongs_to user association
- [ ] User schema updated with has_many tasks association
- [ ] Data migration strategy for existing tasks (assign to admin user or handle gracefully)
- [ ] Updated task factories include user association
- [ ] Database constraints ensure referential integrity
- [ ] All existing task functionality preserved during migration
- [ ] Rollback capability for migration

## Required Context
- **Phase Context**: Reference `../claude.md` for phase-level coordination
- **Previous Phases**: Completed authentication system from Phase 1
- **External Resources**: Phoenix/Ecto migration documentation, database best practices
- **Integration Points**: Existing task schema and data, user authentication system

## Implementation Guidelines
### Database Migration Strategy
- Create migration to add user_id to tasks table
- Add foreign key constraint with proper error handling
- Include indexes for performance optimization
- Handle existing task data appropriately
- Ensure migration is reversible

### Schema Updates
```elixir
# Task schema updates
belongs_to :user, TaskApp.Accounts.User
# Validation for user presence

# User schema updates  
has_many :tasks, TaskApp.Task, dependent: :destroy_all
# Or handle task preservation on user deletion
```

### Data Migration Considerations
- Existing tasks without users: Create "system" user or handle nulls
- Preserve all existing task data during migration
- Test migration on copy of production data
- Plan for rollback if issues arise

## Technical Requirements
- **Database**: PostgreSQL foreign key constraints
- **Performance**: Index user_id column for task queries
- **Data Integrity**: Referential integrity with proper cascade options
- **Migration Safety**: Reversible migration with data preservation

## Migration Planning
### Pre-Migration
- [ ] Backup current task data
- [ ] Test migration on development copy
- [ ] Plan for existing task ownership
- [ ] Validate constraint addition won't fail

### Migration Execution
- [ ] Add user_id column (nullable initially)
- [ ] Populate existing tasks with default user
- [ ] Add foreign key constraint
- [ ] Create performance indexes
- [ ] Update schema files

### Post-Migration
- [ ] Validate all existing tasks accessible
- [ ] Test user-task associations
- [ ] Verify foreign key constraints working
- [ ] Update test factories and data

## Quality Requirements
- Zero data loss during migration
- All existing functionality preserved
- Database performance maintained
- Comprehensive test coverage for associations
- Proper error handling for constraint violations

## Completion Checklist
- [ ] Migration created and tested (up/down)
- [ ] Task schema updated with user association
- [ ] User schema updated with task association  
- [ ] Existing task data preserved and accessible
- [ ] Database constraints properly configured
- [ ] Indexes created for performance
- [ ] Test factories updated
- [ ] Integration tests passing
- [ ] Migration rollback tested

## Deliverables
- `priv/repo/migrations/[timestamp]_add_user_id_to_tasks.exs`
- Updated `lib/task_app/task.ex` schema
- Updated `lib/task_app/accounts/user.ex` schema  
- Data migration scripts (if needed)
- Updated `test/support/factories.ex`
- Test files covering associations
- Migration documentation

## Data Migration Strategy
### Option 1: System User Approach
- Create a "system" user for existing tasks
- All current tasks owned by this user
- Allows for later reassignment if needed

### Option 2: Nullable User Association
- Allow tasks without users initially
- Gradually assign ownership
- More complex but flexible

### Option 3: Admin User Assignment
- Assign existing tasks to first admin user
- Simple and ensures all tasks have owners
- May not reflect real ownership

## Testing Strategy
- Migration testing (up and down)
- Association testing (user.tasks, task.user)
- Constraint violation testing
- Performance testing with indexes
- Data integrity validation
- Rollback scenario testing

## Performance Considerations
- Index user_id for efficient task queries
- Consider query optimization for user.tasks
- Plan for large datasets in production
- Monitor migration performance impact

## Integration Requirements
- Must work with existing task queries
- Prepare for user-scoped task access (Phase 2, Task 2)
- Maintain compatibility with current task operations
- Support future authorization requirements

## Rollback Plan
- Migration must be fully reversible
- Test rollback procedure thoroughly  
- Document rollback steps and data implications
- Plan for emergency rollback if issues arise

## Next Task Preparation
Upon completion, this association enables:
- **Task 2**: Access Control Implementation (can use user-task relationships)
- **Task 3**: Controller Updates (can reference user ownership)
- **Phase 3**: Testing user-specific task access patterns