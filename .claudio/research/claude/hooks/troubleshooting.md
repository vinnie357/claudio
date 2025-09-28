# Claude Hooks Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Hook Commands Not Executing
- **Symptoms**: Configured hooks appear to be ignored, no command execution occurs
- **Diagnosis**: Check Claude Code console output for hook parsing errors, verify JSON syntax
- **Solution**: 
  1. Validate JSON configuration syntax using `jq` or JSON validator
  2. Check file permissions on hook script files (`chmod +x script.sh`)
  3. Verify hook configuration location (`.claude/settings.json` in project or home directory)
  4. Test hook matcher patterns against actual event names
- **Prevention**: Use JSON schema validation and test hooks with simple echo commands first

### Issue 2: Hook Script Path Resolution Failures
- **Symptoms**: Error messages like "command not found" or "permission denied"
- **Diagnosis**: Hook scripts cannot be located or executed by the system
- **Solution**:
  1. Use absolute paths in hook commands: `/full/path/to/script.sh`
  2. Add script directories to PATH in hook commands: `PATH=$PATH:/scripts && script.sh`
  3. Specify full interpreter path: `/bin/bash /path/to/script.sh`
  4. Verify script file exists and has execute permissions
- **Prevention**: Always use absolute paths and test script execution manually

### Issue 3: Environment Variable Access Problems
- **Symptoms**: `$CLAUDE_PROJECT_DIR` or `$CLAUDE_TOOL_INPUT` appear empty or undefined
- **Diagnosis**: Environment variables not properly passed to hook execution context
- **Solution**:
  1. Quote variable usage in commands: `"$CLAUDE_PROJECT_DIR"`
  2. Add null checks in scripts: `[[ -n "$CLAUDE_PROJECT_DIR" ]] || exit 1`
  3. Use default values: `cd "${CLAUDE_PROJECT_DIR:-$(pwd)}"`
  4. Debug with: `env | grep CLAUDE` in hook commands
- **Prevention**: Always quote environment variables and include validation

### Issue 4: Hook Execution Timeouts
- **Symptoms**: Hooks terminate prematurely, incomplete operations, timeout errors
- **Diagnosis**: Hook commands exceed default or configured timeout limits
- **Solution**:
  1. Increase timeout in hook configuration: `"timeout": 60`
  2. Optimize slow commands (cache results, parallel execution)
  3. Break long operations into smaller async hooks
  4. Use background execution: `long_command.sh & disown`
- **Prevention**: Set realistic timeouts and monitor hook execution duration

### Issue 5: Hook Pattern Matching Failures
- **Symptoms**: Hooks trigger for wrong events or don't trigger when expected
- **Diagnosis**: Matcher patterns don't correctly target intended events
- **Solution**:
  1. Test regex patterns independently: `echo "Bash" | grep -E "^Bash$"`
  2. Use more specific patterns: `"Write.*\\.py$"` instead of `"Write"`
  3. Debug with catch-all pattern: `".*"` to see all events
  4. Check event names in Claude Code documentation
- **Prevention**: Test matcher patterns thoroughly before deployment

## Advanced Troubleshooting

### Performance Issues

#### Hook Execution Blocking AI Workflow
- **Symptoms**: Claude Code becomes unresponsive during hook execution
- **Root Cause**: Synchronous hook execution blocking main thread
- **Solution**:
  ```json
  {
    "type": "command",
    "command": "(long_operation.sh > /dev/null 2>&1 &)",
    "timeout": 1
  }
  ```
- **Monitoring**: Track hook execution times and optimize bottlenecks

#### Memory Usage from Hook Scripts
- **Symptoms**: System slowdown, high memory consumption during Claude sessions
- **Root Cause**: Hook scripts with memory leaks or excessive resource usage
- **Solution**:
  1. Add memory limits to hook scripts: `ulimit -m 100000 && script.sh`
  2. Monitor resource usage: `ps aux | grep hook_script`
  3. Implement cleanup in scripts: `trap 'cleanup' EXIT`
- **Prevention**: Profile hook scripts and implement resource monitoring

### Integration Problems

#### Git Integration Hook Conflicts
- **Symptoms**: Git operations fail or produce unexpected results when hooks execute
- **Root Cause**: Conflicting git hooks or repository state conflicts
- **Solution**:
  1. Check git hook directory: `ls .git/hooks/`
  2. Coordinate with existing git hooks
  3. Use git status checks: `git status --porcelain | wc -l`
  4. Implement git lock checking: `[[ -f .git/index.lock ]] && exit 1`
- **Recovery**: Clear git locks and reset repository state if needed

#### CI/CD Pipeline Interference
- **Symptoms**: Build failures or deployment issues triggered by hook automation
- **Root Cause**: Hooks modifying files or triggering builds unexpectedly
- **Solution**:
  1. Add environment detection: `[[ "$CI" == "true" ]] && exit 0`
  2. Use different hook configurations for different environments
  3. Implement branch-aware hooks: `git branch --show-current`
- **Prevention**: Test hook behavior in all target environments

#### External API Integration Failures
- **Symptoms**: Network timeouts, authentication errors in hook API calls
- **Root Cause**: Network connectivity or API credential issues
- **Solution**:
  1. Add retry logic: `for i in {1..3}; do curl ... && break; sleep 1; done`
  2. Implement credential validation: `[[ -n "$API_KEY" ]] || exit 1`
  3. Add connectivity checks: `ping -c 1 api.service.com`
- **Fallback**: Graceful degradation when external services unavailable

### Edge Cases

#### Concurrent Hook Execution Conflicts
- **Symptoms**: File locks, race conditions, inconsistent results
- **Root Cause**: Multiple hooks executing simultaneously on shared resources
- **Solution**:
  1. Implement file locking: `flock /tmp/hook.lock -c 'critical_operation'`
  2. Use atomic operations where possible
  3. Add random delays: `sleep $((RANDOM % 5))`
- **Prevention**: Design hooks to be idempotent and stateless

#### Special Character Handling in Tool Input
- **Symptoms**: Hook commands fail with syntax errors when processing tool input
- **Root Cause**: Unescaped special characters in `$CLAUDE_TOOL_INPUT`
- **Solution**:
  1. Escape input: `escaped_input=$(printf '%q' "$CLAUDE_TOOL_INPUT")`
  2. Use base64 encoding: `echo "$CLAUDE_TOOL_INPUT" | base64`
  3. Write to temporary files instead of command line arguments
- **Prevention**: Always sanitize and validate tool input in hooks

#### Hook Configuration Inheritance Issues
- **Symptoms**: Unexpected hook behavior when global and project configs conflict
- **Root Cause**: Unclear precedence between global and local hook configurations
- **Solution**:
  1. Document configuration hierarchy clearly
  2. Test configurations in isolation
  3. Use specific matcher patterns to avoid conflicts
- **Debugging**: Compare global (`~/.claude/settings.json`) and local (`.claude/settings.json`) configs

## Diagnostic Tools

### Hook Execution Debugging
```bash
# Enable hook debugging
export CLAUDE_DEBUG_HOOKS=true

# Test hook configuration syntax
jq '.' .claude/settings.json

# Monitor hook execution
tail -f ~/.claude/logs/hooks.log

# Test environment variable access
echo "Project: $CLAUDE_PROJECT_DIR, Input: $CLAUDE_TOOL_INPUT"
```

### Configuration Validation
```bash
# Validate JSON syntax
python -m json.tool .claude/settings.json

# Test regex patterns
echo "Bash" | grep -E "^Bash$"
echo "Write file.py" | grep -E "Write.*\\.py$"

# Check script permissions
ls -la hook_scripts/
```

### Performance Monitoring
```bash
# Monitor hook execution time
time hook_script.sh

# Check system resources during hooks
top -p $(pgrep -f hook_script)

# Memory usage tracking
ps -o pid,vsz,rss,comm -p $(pgrep -f hook_script)
```

### Network and API Testing
```bash
# Test API connectivity
curl -v https://api.service.com/health

# Validate API credentials
curl -H "Authorization: Bearer $API_KEY" https://api.service.com/validate

# Check network latency
ping -c 5 api.service.com
```

## When to Escalate

### Signs That Expert Help is Needed

1. **Security Concerns**: Hook scripts accessing sensitive files or executing privileged operations
2. **Performance Degradation**: Claude Code performance significantly impacted by hook execution
3. **Data Loss Risk**: Hooks modifying critical files or repository state unpredictably
4. **Complex Integration Failures**: Multi-system integration issues requiring architectural changes
5. **Persistent Configuration Issues**: Hook configurations that work in isolation but fail in production

### Escalation Information to Gather

- **Hook configuration files**: Complete `.claude/settings.json` configurations
- **Error logs**: Claude Code console output and system logs
- **System information**: Operating system, Claude Code version, shell environment
- **Hook scripts**: Complete hook script files and their execution context
- **Reproduction steps**: Detailed steps to reproduce the issue consistently
- **Impact assessment**: Description of how the issue affects development workflow

### Expert Resources

- **Claude Code Documentation**: Official troubleshooting guides and configuration reference
- **Community Forums**: Developer community discussions and solution sharing
- **System Administration**: For complex environment and security issues
- **DevOps Engineering**: For CI/CD integration and automation architecture
- **Security Review**: For hooks involving sensitive operations or data access
