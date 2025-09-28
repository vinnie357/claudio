# Claude Slash Commands Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Command Not Found or Not Executing

**Symptoms**:
- Slash command appears as regular text instead of executing
- "Command not found" error messages
- Commands execute but with unexpected behavior

**Diagnosis**:
- Check if command file exists in correct location (`.claude/commands/` or `~/.claude/commands/`)
- Verify command file has `.md` extension
- Confirm command name matches filename (without extension)
- Validate command syntax and frontmatter format

**Solution**:
1. **Verify File Location**:
   ```bash
   ls .claude/commands/        # Check project commands
   ls ~/.claude/commands/      # Check personal commands
   ```

2. **Check File Format**:
   ```bash
   head -10 .claude/commands/your-command.md  # Verify frontmatter structure
   ```

3. **Validate Syntax**:
   - Ensure frontmatter is properly formatted with `---` delimiters
   - Check that command content follows proper Markdown structure
   - Verify no syntax errors in command definition

4. **Test with Simple Command**:
   ```markdown
   ---
   description: "Test command"
   ---
   
   This is a test command: $1
   ```

**Prevention**:
- Use consistent naming conventions for command files
- Validate command syntax before deployment
- Include proper frontmatter in all custom commands
- Test commands after creation or modification

### Issue 2: Argument Parsing Problems

**Symptoms**:
- Arguments not properly substituted in command output
- `$1`, `$2` appearing literally instead of being replaced
- Commands receiving wrong argument values
- `$ARGUMENTS` not capturing all provided arguments

**Diagnosis**:
- Check argument placeholder syntax (`$1`, `$2`, `$ARGUMENTS`)
- Verify argument count matches expected parameters
- Review command invocation syntax
- Test with different argument patterns

**Solution**:
1. **Fix Argument Placeholders**:
   ```markdown
   # Correct syntax
   Process argument: $1
   All arguments: $ARGUMENTS
   
   # Incorrect - will appear literally
   Process argument: \$1  # Escaped dollar sign
   ```

2. **Debug Argument Passing**:
   ```markdown
   ---
   description: "Debug arguments"
   argument-hint: "[arg1] [arg2] [arg3]"
   ---
   
   Argument 1: $1
   Argument 2: $2  
   Argument 3: $3
   All arguments: $ARGUMENTS
   Argument count debug information
   ```

3. **Handle Missing Arguments**:
   ```markdown
   ---
   description: "Command with argument validation"
   argument-hint: "[required] [optional]"
   ---
   
   If $1 is provided: process required argument $1
   If $2 is provided: process optional argument $2  
   If arguments are missing: provide usage guidance
   ```

**Prevention**:
- Always include `argument-hint` in frontmatter for clarity
- Test commands with various argument combinations
- Design commands to handle missing arguments gracefully
- Use consistent argument patterns across related commands

### Issue 3: Command File Permission and Access Issues

**Symptoms**:
- "Permission denied" errors when executing commands
- Commands not accessible across different projects
- File system access issues within commands

**Diagnosis**:
- Check file permissions on command files
- Verify directory permissions for `.claude/commands/`
- Confirm user has appropriate access rights
- Test file system operations within command context

**Solution**:
1. **Fix File Permissions**:
   ```bash
   chmod 644 .claude/commands/*.md        # Make command files readable
   chmod 755 .claude/commands/           # Ensure directory is accessible
   ```

2. **Verify Directory Structure**:
   ```bash
   mkdir -p .claude/commands             # Create directory if missing
   mkdir -p ~/.claude/commands           # Create personal commands directory
   ```

3. **Test File Access**:
   ```markdown
   ---
   description: "Test file access"
   ---
   
   Test current directory access
   List available files and verify permissions  
   Report any access issues or restrictions
   ```

**Prevention**:
- Set up proper directory structure during project initialization
- Include command directory creation in project setup scripts
- Document file permission requirements for team members
- Regular auditing of command file permissions and access

### Issue 4: Command Integration and Tool Access Issues

**Symptoms**:
- Commands cannot access expected tools or external resources
- Integration with git, build systems, or other tools fails
- File operations within commands produce errors
- Network or external resource access problems

**Diagnosis**:
- Verify tool availability in current environment
- Check network connectivity and resource accessibility
- Test individual tool commands outside of slash command context
- Review command implementation for proper tool integration

**Solution**:
1. **Verify Tool Availability**:
   ```markdown
   ---
   description: "Environment diagnostic"
   ---
   
   Check git availability: git --version
   Check node availability: node --version
   Check python availability: python --version
   List available development tools
   ```

2. **Test Tool Integration**:
   ```markdown
   ---
   description: "Tool integration test"
   argument-hint: "[tool-name]"
   ---
   
   Test $1 tool integration
   Execute basic $1 commands to verify functionality
   Report integration status and any configuration issues
   ```

3. **Debug File Operations**:
   ```markdown
   ---
   description: "File operation diagnostic"
   argument-hint: "[target-path]"
   ---
   
   Test file read access to $1
   Test file write access to directory containing $1
   Report file system permissions and access capabilities
   ```

**Prevention**:
- Document tool dependencies for custom commands
- Include environment setup instructions in project documentation
- Test commands in clean environments before deployment
- Implement graceful error handling for missing tools or resources

### Issue 5: Performance and Context Issues

**Symptoms**:
- Commands execute slowly or timeout
- Context window limitations affecting command execution  
- Memory usage issues with complex commands
- Commands losing context between executions

**Diagnosis**:
- Monitor command execution time and resource usage
- Review command complexity and context requirements
- Check for inefficient operations or excessive file access
- Analyze context usage patterns and memory consumption

**Solution**:
1. **Optimize Command Performance**:
   ```markdown
   ---
   description: "Optimized command pattern"
   ---
   
   Minimize file operations and focus on essential tasks
   Use efficient argument processing
   Provide concise but complete output
   Cache results when appropriate
   ```

2. **Manage Context Usage**:
   ```markdown
   ---
   description: "Context-aware command"
   ---
   
   Focus on specific task: $1
   Provide targeted analysis without excessive context
   Use memory files for persistent state when needed
   ```

3. **Implement Progress Tracking**:
   ```markdown
   ---
   description: "Long-running command with progress"
   ---
   
   Phase 1: Initial setup for $1
   Phase 2: Main processing
   Phase 3: Results compilation and output
   Provide progress updates at each phase
   ```

**Prevention**:
- Design commands with performance considerations from the start
- Implement appropriate scoping and context management
- Test commands with large projects and datasets
- Monitor and optimize command performance regularly

## Advanced Troubleshooting

### Command Development and Testing

**Development Environment Setup**:
```markdown
---
description: "Command development helper"
argument-hint: "[command-name]"
---

Create development template for new command: $1
Include debugging features and test cases
Provide validation checklist for command quality
Generate usage documentation template
```

**Testing Framework for Commands**:
```markdown
---
description: "Command testing suite"
argument-hint: "[command-pattern]"
---

Test commands matching pattern: $1
Validate argument handling and edge cases
Check integration points and dependencies
Report test results with specific recommendations
```

### Integration Debugging

**MCP Integration Issues**:
- **Symptom**: Dynamic MCP commands not appearing or functioning
- **Solution**: Verify MCP server configuration and tool availability
- **Debug**: Test MCP connection independently of slash commands
- **Prevention**: Regular MCP server health checks and validation

**Version Control Integration Problems**:
```markdown
---
description: "Git integration diagnostic"
---

Check git repository status and configuration
Test git command accessibility and permissions
Verify branch and remote repository connectivity
Report git integration status and recommendations
```

**Build System Integration Issues**:
```markdown
---
description: "Build system diagnostic"
argument-hint: "[build-type]"
---

Detect and validate $1 build system configuration
Test build command execution and output capture
Check build dependencies and environment setup
Provide build system optimization recommendations
```

### Edge Cases and Complex Scenarios

**Multi-Project Command Conflicts**:
- **Issue**: Commands with same name across different projects causing conflicts
- **Solution**: Implement project-specific command namespacing
- **Prevention**: Establish naming conventions that include project context

**Command Chaining and Dependencies**:
- **Issue**: Commands that depend on output from other commands
- **Solution**: Design commands with proper input validation and dependency handling
- **Example**:
```markdown
---
description: "Dependent command with validation"
argument-hint: "[prerequisite-result] [operation]"
---

Validate prerequisite result: $1
If validation passes: execute operation $2
If validation fails: provide guidance for prerequisite completion
```

**Large Project Performance Issues**:
- **Issue**: Commands executing slowly on large codebases
- **Solution**: Implement selective processing and smart caching
- **Pattern**:
```markdown
---
description: "Scalable project command"
argument-hint: "[scope] [filter]"
---

Focus analysis on scope: $1 (file|directory|module)
Apply filter criteria: $2 to reduce processing overhead
Provide targeted results with option to expand scope
```

## Diagnostic Tools

### Built-in Diagnostic Commands

**System Status Check**:
- Use `/help` to verify available commands and system status
- Use `/config` to review current configuration settings  
- Use `/model` to verify active model and capabilities

**Custom Diagnostic Commands**:
```markdown
---
description: "Comprehensive system diagnostic"
---

Check Claude Code version and capabilities
Verify command directory structure and permissions
Test tool integrations and external dependencies
Report system health and configuration status
```

### Command Validation Tools

**Syntax Validation**:
```markdown
---
description: "Command syntax validator"
argument-hint: "[command-file]"
---

Parse command file: $1
Validate frontmatter structure and required fields
Check argument placeholder syntax and usage
Report syntax issues and provide correction guidance
```

**Integration Testing**:
```markdown
---
description: "Command integration tester"
argument-hint: "[command-name] [test-args]"
---

Execute command $1 with test arguments: $2
Monitor execution for errors and performance issues
Validate output format and content accuracy
Provide integration test results and recommendations
```

### Performance Monitoring

**Execution Time Analysis**:
```markdown
---
description: "Command performance profiler"
argument-hint: "[command-pattern]"
---

Profile commands matching pattern: $1
Measure execution time and resource usage
Identify performance bottlenecks and optimization opportunities
Generate performance report with improvement recommendations
```

**Context Usage Monitoring**:
```markdown
---
description: "Context usage analyzer"
---

Analyze current context usage and efficiency
Monitor token consumption patterns
Identify context optimization opportunities
Provide recommendations for context management
```

## When to Escalate

### Signs That Expert Help is Needed

**Technical Issues Requiring Expert Intervention**:
- Command execution causing system instability or crashes
- Persistent permission or security issues affecting team workflow
- Complex integration requirements with enterprise systems
- Performance issues affecting productivity across multiple team members

**Development Process Issues**:
- Need for custom MCP server development or advanced tool integration
- Requirements for commands that modify Claude Code core behavior
- Complex workflow automation requiring advanced scripting
- Security review needed for commands accessing sensitive systems

**Team Coordination Issues**:
- Conflicts between project and personal command libraries
- Need for enterprise-level command management and deployment
- Requirements for audit trails and command usage tracking
- Integration with existing team development and deployment pipelines

### Escalation Resources

**Technical Support Channels**:
- Claude Code documentation and community resources
- Anthropic support channels for system-level issues
- MCP documentation for advanced tool integration
- Community forums for command sharing and best practices

**Internal Escalation**:
- Senior developers for complex command design and architecture
- DevOps teams for integration with CI/CD and deployment systems
- Security teams for commands accessing sensitive resources
- Team leads for workflow standardization and process integration

**Documentation and Research**:
- Official Claude Code documentation for authoritative guidance
- Community command libraries for proven implementation patterns
- Team knowledge bases for organization-specific patterns
- Performance optimization guides for large-scale deployments
