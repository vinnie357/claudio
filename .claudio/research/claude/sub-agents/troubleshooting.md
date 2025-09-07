# Claude Sub-Agents Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Sub-Agent Not Found or Not Invoked
- **Symptoms**: Main Claude continues handling tasks instead of delegating to sub-agent
- **Diagnosis**: Check sub-agent name and description specificity
- **Solution**: 
  1. Verify sub-agent file exists in `.claude/agents/` or `~/.claude/agents/`
  2. Ensure `name` field matches expected identifier
  3. Improve description specificity to match task context
  4. Use explicit invocation: "Use the [agent-name] sub-agent to..."
- **Prevention**: Write detailed, task-specific descriptions and test with various invocation patterns

### Issue 2: Tool Access Denied or Missing Capabilities
- **Symptoms**: Sub-agent reports inability to perform expected operations (file access, web search, etc.)
- **Diagnosis**: Review `tools` configuration in sub-agent YAML frontmatter
- **Solution**:
  1. Add required tools to frontmatter: `tools: [Read, Write, Grep, Bash]`
  2. Verify tool names match Claude Code tool system exactly
  3. Remove tool restrictions if full access needed: omit `tools` field
  4. Test tool access in isolation before complex workflows
- **Prevention**: Document required tools during sub-agent design and validate access patterns

### Issue 3: Context Loss Between Sub-Agent Invocations
- **Symptoms**: Sub-agent doesn't remember previous interactions or loses workflow context
- **Diagnosis**: Each sub-agent invocation starts with clean context
- **Solution**:
  1. Pass comprehensive context in each invocation
  2. Use main session to maintain state between sub-agent calls
  3. Design sub-agents for stateless operation
  4. Include necessary background information in each delegation
- **Prevention**: Architecture workflows assuming clean-slate sub-agent starts

### Issue 4: Performance Issues and Latency
- **Symptoms**: Slow response times, extended processing delays
- **Diagnosis**: Sub-agent context setup, tool initialization, or excessive tool access
- **Solution**:
  1. Limit tool access to essential functions only
  2. Optimize system prompts for brevity while maintaining specificity
  3. Pre-gather context before sub-agent invocation
  4. Use parallel sub-agent invocation where possible
- **Prevention**: Monitor response times and optimize tool configurations regularly

### Issue 5: Configuration Syntax Errors
- **Symptoms**: Sub-agent fails to load or behaves unexpectedly
- **Diagnosis**: YAML frontmatter parsing errors or invalid configuration
- **Solution**:
  1. Validate YAML syntax with online validators
  2. Check for consistent indentation and proper field names
  3. Verify tool names match Claude Code specifications
  4. Test minimal configuration first, then add complexity
- **Prevention**: Use configuration templates and validate syntax before deployment

## Advanced Troubleshooting

### Performance Issues

**Context Switching Overhead:**
- Monitor session performance when using multiple sub-agents
- Balance between specialized sub-agents and main session efficiency
- Consider batching similar tasks within single sub-agent invocation

**Tool Loading Delays:**
- Minimize tool sets to essential functions
- Test tool combinations for performance impact
- Use MCP server tools efficiently to reduce initialization overhead

**Memory Management:**
- Monitor sub-agent context size and complexity
- Clear unnecessary context between major workflow phases
- Balance context preservation with performance requirements

### Integration Problems

**Workflow Coordination Issues:**
- Ensure proper handoff between sequential sub-agents
- Validate output formats match downstream expectations
- Implement error propagation between workflow stages

**Version Control Conflicts:**
- Manage project-level vs user-level sub-agent configurations
- Handle team collaboration on shared sub-agent definitions
- Resolve conflicts between different sub-agent versions

**Cross-Platform Compatibility:**
- Test sub-agent configurations across different operating systems
- Validate tool access patterns on various platforms
- Address path and command differences in system integration tools

### Edge Cases

**Recursive Sub-Agent Calls:**
- Detect and prevent infinite delegation loops
- Implement depth limits for sub-agent chains
- Design clear termination conditions for complex workflows

**Resource Exhaustion:**
- Monitor concurrent sub-agent usage
- Implement throttling for resource-intensive operations
- Handle graceful degradation when system limits reached

**Network and External Dependency Issues:**
- Handle web research tool failures gracefully
- Implement retry mechanisms for external API calls
- Provide offline fallbacks for network-dependent sub-agents

## Diagnostic Tools

### Configuration Validation
```bash
# Check sub-agent configuration syntax
yamllint .claude/agents/[agent-name].md

# Validate tool names against available tools
grep -r "tools:" .claude/agents/ | sort | uniq
```

### Performance Analysis
```bash
# Monitor sub-agent response times
time [sub-agent invocation command]

# Check system resource usage during sub-agent operations
top -p [claude-process-id]
```

### Debug Logging
- Enable verbose logging in Claude Code settings
- Monitor sub-agent selection decisions
- Track context transfer and tool access patterns
- Review error messages for configuration issues

### Testing Framework
```markdown
# Sub-agent validation script
1. Test basic invocation patterns
2. Verify tool access permissions
3. Validate output format consistency
4. Check performance benchmarks
5. Confirm integration with main workflow
```

## When to Escalate

### Signs Expert Help is Needed

**System-Level Issues:**
- Claude Code installation or configuration problems
- MCP server integration failures
- Platform-specific tool access issues
- Performance degradation affecting multiple sub-agents

**Complex Integration Requirements:**
- Multi-system workflow orchestration
- Advanced security and permission management
- Enterprise-scale deployment and management
- Custom tool development and integration

**Architecture Design Questions:**
- Optimal sub-agent granularity for specific use cases
- Performance optimization for high-volume workflows
- Advanced error handling and recovery patterns
- Cross-team collaboration and standardization strategies

### Escalation Resources

1. **Claude Code Documentation**: Official Anthropic documentation and API references
2. **Community Forums**: User communities and best practice sharing
3. **Professional Support**: Anthropic enterprise support channels
4. **System Administrators**: Local IT support for installation and configuration issues
5. **Architecture Reviews**: Technical consultation for complex implementation designs

### Information to Provide When Escalating

- Sub-agent configuration files (sanitized)
- Error messages and log excerpts
- System environment details (OS, Claude Code version)
- Workflow description and expected behavior
- Performance metrics and resource usage data
- Integration context and constraints
