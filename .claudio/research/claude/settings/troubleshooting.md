# Claude Code Settings Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Configuration Not Loading or Being Ignored
- **Symptoms**: Changes to settings files don't take effect, Claude Code uses default behavior
- **Diagnosis**: Check configuration precedence hierarchy and file locations
- **Solution**: 
  1. Verify configuration file exists in expected location
  2. Check syntax with `claude config list` command
  3. Ensure higher-precedence settings aren't overriding your changes
  4. Validate JSON syntax in configuration files
- **Prevention**: Use `claude config get <key>` to verify active settings after changes

### Issue 2: Permission Denied Errors
- **Symptoms**: "Access denied" or "File not readable" errors when Claude Code tries to access files
- **Diagnosis**: Check `permissions.deny` and `permissions.allow` configurations
- **Solution**:
  1. Review current permissions: `claude config get permissions`
  2. Add required paths to `permissions.allow`: `claude config add permissions.allow "./required-path"`
  3. Remove overly restrictive entries from `permissions.deny`: `claude config remove permissions.deny "./wrongly-blocked-path"`
  4. Clear configuration cache if needed: `claude config reset-cache`
- **Prevention**: Use principle of least privilege but ensure necessary access is granted

### Issue 3: Authentication Failures
- **Symptoms**: "Invalid API key" or authentication errors despite correct credentials
- **Diagnosis**: Check environment variables and API key configuration
- **Solution**:
  1. Verify environment variable is set: `echo $ANTHROPIC_API_KEY`
  2. Check for typos in environment variable names
  3. Ensure API key has proper format and hasn't expired
  4. Test with different authentication method (Bedrock, Vertex AI)
  5. Clear cached credentials: `claude auth logout && claude auth login`
- **Prevention**: Use secure credential storage and regular key rotation

### Issue 4: Model Selection Not Working
- **Symptoms**: Claude Code uses wrong model despite configuration changes
- **Diagnosis**: Check model configuration and availability
- **Solution**:
  1. Verify model name spelling: `claude config get model`
  2. Check model availability in your region/environment
  3. Ensure enterprise policies allow the selected model
  4. Test with known working model first
  5. Check for model overrides in higher-precedence configurations
- **Prevention**: Use standardized model names and validate availability before setting

### Issue 5: Custom Subagents Not Loading
- **Symptoms**: Custom agents don't appear or aren't accessible
- **Diagnosis**: Check subagent paths and file permissions
- **Solution**:
  1. Verify agent file paths: `claude config get subagents.agentPaths`
  2. Check file permissions on agent files: `ls -la ./agents/`
  3. Validate agent file syntax and structure
  4. Ensure agent files have correct extensions (.md)
  5. Restart Claude Code after adding new agents
- **Prevention**: Follow naming conventions and validate agent file structure

## Advanced Troubleshooting

### Performance Issues

**Slow Configuration Loading:**
- **Diagnosis**: Check for large configuration files or complex permission patterns
- **Solutions**:
  - Optimize permission patterns using wildcards instead of explicit lists
  - Split large configurations into focused, smaller files
  - Use configuration caching when available
  - Remove unused configuration entries

**Memory Usage During Configuration:**
- **Diagnosis**: Monitor system resources during Claude Code startup
- **Solutions**:
  - Reduce number of custom subagents loaded simultaneously
  - Optimize hook scripts to be lightweight and fast
  - Use lazy loading for rarely used configurations

### Integration Problems

**Enterprise Policy Conflicts:**
- **Symptoms**: Local configurations don't work despite correct syntax
- **Diagnosis**: Enterprise policies are overriding local settings
- **Solutions**:
  - Contact IT administrator to review enterprise policies
  - Use `claude config list --show-source` to see configuration origins
  - Work within enterprise policy constraints for local customizations

**CI/CD Pipeline Configuration Issues:**
- **Symptoms**: Claude Code behaves differently in CI/CD than local development
- **Diagnosis**: Environment differences between local and CI/CD systems
- **Solutions**:
  - Ensure consistent environment variables across environments
  - Use environment-specific configuration files
  - Validate CI/CD system permissions and access controls
  - Test configuration changes in staging environment first

**Cloud Platform Integration Failures:**
- **Symptoms**: Bedrock or Vertex AI integration not working
- **Diagnosis**: Cloud platform authentication or configuration issues
- **Solutions**:
  - Verify cloud platform credentials and permissions
  - Check region availability for Claude models
  - Validate network connectivity to cloud endpoints
  - Test with basic cloud platform tools first

### Edge Cases

**Configuration Inheritance Issues:**
- **Symptoms**: Unexpected configuration behavior with multiple inheritance levels
- **Diagnosis**: Complex interaction between different configuration sources
- **Solutions**:
  - Use `claude config list --verbose` to see full inheritance chain
  - Create minimal test configurations to isolate issues
  - Document configuration precedence for your specific setup

**File System Permission Edge Cases:**
- **Symptoms**: Inconsistent file access behavior across different operations
- **Diagnosis**: File system or OS-level permission interactions
- **Solutions**:
  - Check file system permissions independently: `ls -la`
  - Test with simplified permission configurations
  - Verify Claude Code process permissions
  - Consider case-sensitivity issues on different file systems

**Unicode and Special Character Issues:**
- **Symptoms**: Configuration files with special characters cause parsing errors
- **Diagnosis**: Character encoding or JSON parsing issues
- **Solutions**:
  - Ensure configuration files use UTF-8 encoding
  - Escape special characters properly in JSON strings
  - Use configuration commands instead of direct file editing for complex values
  - Validate JSON syntax with external tools

## Diagnostic Tools

### Built-in Diagnostic Commands

**Configuration Analysis:**
```bash
# View complete configuration with sources
claude config list --verbose

# Check specific configuration key
claude config get permissions --show-source

# Validate configuration syntax
claude config validate

# Export configuration for backup/analysis
claude config export --format json
```

**System Information:**
```bash
# Check Claude Code version and system info
claude --version --verbose

# Check model availability
claude models list

# Test authentication status
claude auth status
```

**Permission Testing:**
```bash
# Test file access permissions
claude test-permissions ./target-directory

# Check tool access permissions
claude test-tools --list-enabled
```

### External Diagnostic Tools

**JSON Validation Tools:**
```bash
# Validate JSON syntax
jq . ~/.claude/settings.json

# Python JSON validation
python -m json.tool ~/.claude/settings.json
```

**File Permission Analysis:**
```bash
# Check file permissions
ls -la ~/.claude/
find .claude/ -type f -name "*.json" -exec ls -la {} \;

# Check file system access
stat ~/.claude/settings.json
```

**Environment Variable Debugging:**
```bash
# Check environment variables
env | grep -E "(CLAUDE|ANTHROPIC)"

# Test environment variable accessibility
echo $ANTHROPIC_API_KEY | wc -c  # Should show character count, not 0
```

### Logging and Monitoring

**Enable Debug Logging:**
```json
{
  "logging": {
    "level": "debug",
    "destination": "./claude-debug.log",
    "includeConfiguration": true
  }
}
```

**Configuration Change Monitoring:**
```bash
# Monitor configuration file changes
fswatch ~/.claude/ | xargs -n1 echo "Config changed:"

# Track configuration access
strace -e openat claude config list 2>&1 | grep settings.json
```

## When to Escalate

### Signs That Expert Help is Needed

**Complex Enterprise Integration Issues:**
- Multiple enterprise policy conflicts across different organizational levels
- Integration failures affecting multiple teams or departments
- Security policy violations that require organizational review

**Performance Issues Affecting Productivity:**
- Configuration loading times exceeding 30 seconds consistently
- Memory usage growth indicating potential memory leaks
- System-wide performance degradation after configuration changes

**Security-Related Configuration Problems:**
- Suspected credential exposure or unauthorized access attempts
- Configuration changes that bypass intended security controls
- Audit trail inconsistencies or compliance concerns

**Data Integrity or Corruption Issues:**
- Configuration files becoming corrupted or unreadable
- Inconsistent behavior suggesting data corruption
- Loss of configuration settings across system restarts

### Escalation Information to Gather

**System Information:**
- Claude Code version and installation method
- Operating system and version details
- Enterprise environment details (if applicable)
- Network configuration and restrictions

**Configuration Details:**
- Full configuration export (with sensitive information redacted)
- Configuration change history and timeline
- Error logs and diagnostic output
- Reproduction steps and specific error messages

**Environment Context:**
- Development team size and structure
- Integration requirements and constraints
- Security and compliance requirements
- Timeline and business impact of the issue

### Contact Channels

**Community Support:**
- Claude Code community forums for general configuration questions
- GitHub issues for bug reports and feature requests
- Stack Overflow for development-related configuration problems

**Enterprise Support:**
- Dedicated enterprise support channels for business-critical issues
- Account management for license and deployment questions
- Security team consultation for compliance-related configuration issues

**Internal Escalation:**
- IT/DevOps teams for infrastructure and enterprise policy issues
- Security teams for permission and access control problems
- Development leads for team-wide configuration standardization
