# Command Design Best Practices

## Overview

This document outlines established best practices for designing effective Claude Code slash commands. These practices ensure consistency, usability, and maintainability across different systems.

## Configuration Best Practices

### YAML Frontmatter Standards

**Required Fields:**
```yaml
---
description: "Clear, concise description of what the command does"
argument-hint: "[required-arg] [--optional-flag] [optional-arg]"
---
```

**Best Practice Examples:**
```yaml
# Good - Clear and specific
description: "Generate conventional commit message suggestions based on git changes"
argument-hint: "[--scope <scope>] [--type <type>]"

# Poor - Vague and unhelpful  
description: "Does git stuff"
argument-hint: "args"
```

### Description Guidelines

**Effective Descriptions:**
- Start with an action verb (Generate, Create, Analyze, etc.)
- Be specific about what the command does
- Mention key outputs or results
- Keep under 80 characters when possible
- Use consistent terminology across related commands

**Examples:**
- ✅ "Analyze codebase for security vulnerabilities and generate report"
- ✅ "Deploy application to staging environment with health checks"
- ❌ "Security stuff"
- ❌ "Deploy things"

### Argument Hint Standards

**Format Convention:**
- Required arguments: `<arg-name>`
- Optional arguments: `[arg-name]`
- Flags: `--flag-name`
- Multiple options: `--option <value1|value2|value3>`

**Examples:**
```yaml
# Simple command
argument-hint: "<file-path>"

# Complex command with options
argument-hint: "<project-name> [--template <react|vue|angular>] [--typescript]"

# Flag-heavy command
argument-hint: "[--force] [--dry-run] [--verbose]"
```

## Command Naming Conventions

### Naming Patterns

**Primary Commands:**
- Use clear, descriptive names
- Prefer full words over abbreviations
- Use kebab-case for multi-word commands
- Keep names under 15 characters when possible

**Abbreviation Guidelines:**
- Use well-known abbreviations (e.g., `git`, `npm`, `api`)
- Be consistent across related commands
- Provide full-name alternatives for clarity

**Examples:**
- ✅ `/deploy` - Clear and concise
- ✅ `/analyze-security` - Descriptive multi-word
- ✅ `/gcms` - Well-known abbreviation (Git Commit Message Suggestions)
- ❌ `/asec` - Unclear abbreviation
- ❌ `/do-the-deployment-thing` - Too verbose

### Command Families

**Grouping Related Commands:**
```
/git-commit
/git-status  
/git-push
/git-pull
```

**Namespace Patterns:**
```
/deploy-staging
/deploy-production
/deploy-status
```

## Agent Integration Patterns

### Agent Reference Standards

**Direct Agent Reference:**
```markdown
Use the security-analyzer specialist agent to scan for vulnerabilities.
```

**Conditional Agent Selection:**
```markdown
Use the appropriate deployment agent based on the target environment:
- staging-deployment for staging deployments
- production-deployment for production deployments
```

### Parameter Passing Best Practices

**Clear Parameter Mapping:**
```markdown
Pass the following parameters to the deployment agent:
- project-name: ${project-name}
- environment: ${environment}
- force-deploy: ${force-flag}
```

**Context Preservation:**
```markdown
Maintain the following context for the agent:
- Current git branch and commit
- User permissions and access levels
- Previous deployment history
```

## Error Handling Patterns

### User-Friendly Error Messages

**Good Error Patterns:**
```markdown
If the project directory doesn't exist:
"❌ Project directory not found at '${path}'. Please check the path and try again."

If required dependencies are missing:
"❌ Required dependencies not installed. Run 'npm install' first."
```

**Error Recovery Guidance:**
```markdown
If authentication fails:
1. Check your API token with /auth-status
2. Refresh tokens with /auth-refresh
3. Contact admin if issues persist
```

### Graceful Degradation

**Fallback Behaviors:**
- Provide alternative approaches when primary method fails
- Offer manual steps when automation fails
- Suggest related commands that might help

## Documentation Standards

### Command Documentation Structure

```markdown
# Command Purpose
Brief description of what the command does and when to use it.

## Usage
/command-name <required-args> [optional-args]

## Examples
/command-name my-project --environment staging
/command-name my-project --force --verbose

## Parameters
- project-name: Name of the project to deploy
- --environment: Target environment (staging|production)
- --force: Skip confirmation prompts
- --verbose: Show detailed output

## Common Issues
- Issue description and solution
- Another issue and its resolution
```

### Help Integration

**Inline Help:**
```markdown
For detailed usage information, see the extended documentation at:
.claude/agents/claudio/extended_context/command-help/deploy.md
```

**Progressive Disclosure:**
- Basic usage in command description
- Common options in argument hints
- Advanced features in extended documentation
- Troubleshooting in separate help files

## Performance Best Practices

### Efficient Command Design

**Resource Optimization:**
- Use appropriate agent tools for the task
- Minimize file system operations
- Cache frequently accessed data
- Implement timeout handling

**User Experience:**
- Provide progress indicators for long-running operations
- Show immediate feedback for user actions
- Use parallel processing when appropriate
- Implement cancellation support

### Scalability Considerations

**System Load Management:**
- Limit concurrent operations
- Implement queuing for resource-intensive tasks
- Provide resource usage monitoring
- Support graceful degradation under load

## Security Best Practices

### Access Control

**Permission Checking:**
```markdown
Before executing deployment:
1. Verify user has deployment permissions
2. Check target environment access
3. Validate API token scope
```

**Sensitive Data Handling:**
- Never log sensitive parameters
- Mask secrets in output
- Use secure parameter passing
- Implement audit logging

### Input Validation

**Parameter Sanitization:**
- Validate all user inputs
- Sanitize file paths and names
- Check for injection attempts
- Implement type checking

## Testing and Quality Assurance

### Command Testing Framework

**Test Coverage Requirements:**
- Basic functionality tests
- Error condition handling
- Parameter validation tests
- Integration tests with agents
- Performance benchmarks

**Automated Testing:**
```bash
# Run command tests
/test-command deploy

# Validate command configuration
/validate-command-config deploy

# Check integration quality
/test-command-integration deploy
```

### Quality Gates

**Pre-deployment Checks:**
- Configuration validation passes
- All tests pass
- Documentation is complete
- Security review completed
- Performance benchmarks met

These best practices ensure high-quality, maintainable command implementations that provide excellent user experiences across different Claude Code systems.