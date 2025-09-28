# Claude Output Styles Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Style Not Activating
- **Symptoms**: Output style command executes but behavior remains unchanged
- **Diagnosis**: Check `.claude/settings.local.json` for `outputStyle` field
- **Solution**: 
  1. Verify style name spelling: `/output-style [exact-name]`
  2. Check style file exists in correct location
  3. Validate markdown frontmatter format
  4. Restart Claude Code session if settings cache is stale
- **Prevention**: Use tab completion for style names, validate file structure before activation

### Issue 2: Custom Style File Not Found
- **Symptoms**: Error message "Style not found" when activating custom style
- **Diagnosis**: Verify file location and naming conventions
- **Solution**:
  1. Check file placement: `~/.claude/output-styles/` or `.claude/output-styles/`
  2. Ensure `.md` file extension
  3. Verify frontmatter contains `name` field matching activation command
  4. Check file permissions are readable
- **Prevention**: Use consistent naming conventions, validate file structure after creation

### Issue 3: Style Changes Not Persisting
- **Symptoms**: Style reverts to default after Claude Code restart
- **Diagnosis**: Settings file write permissions or corruption
- **Solution**:
  1. Check `.claude/settings.local.json` write permissions
  2. Manually verify JSON structure validity
  3. Remove corrupted settings file to reset to defaults
  4. Re-activate preferred style after reset
- **Prevention**: Regular backup of settings file, avoid manual JSON editing

### Issue 4: Malformed Custom Style Markdown
- **Symptoms**: Custom style activates but behaves unexpectedly
- **Diagnosis**: Invalid frontmatter or system prompt structure
- **Solution**:
  1. Validate YAML frontmatter syntax
  2. Ensure required fields: `name` and `description`
  3. Check system prompt content for conflicting instructions
  4. Test with minimal style content first
- **Prevention**: Use `/output-style:new` for template generation, validate syntax before activation

### Issue 5: Style Conflicts Between User and Project Levels
- **Symptoms**: Unexpected behavior when styles exist at both levels
- **Diagnosis**: Project-level styles override user-level with same name
- **Solution**:
  1. Understand precedence: project overrides user
  2. Rename conflicting styles to avoid confusion
  3. Use project-specific naming conventions
  4. Document style hierarchy for team members
- **Prevention**: Establish naming conventions, clear documentation of style locations

## Advanced Troubleshooting

### Performance Issues

#### Slow Style Switching
- **Cause**: Large custom styles with complex system prompts
- **Solution**: Optimize system prompt length, remove unnecessary instructions
- **Monitoring**: Track response times before/after style changes
- **Best Practice**: Keep custom styles focused and concise

#### Memory Usage with Complex Styles
- **Cause**: Elaborate system prompts consuming context window
- **Solution**: Balance style complexity with context efficiency
- **Monitoring**: Monitor conversation length and context usage
- **Best Practice**: Use style-specific context management strategies

### Integration Problems

#### MCP Tool Compatibility
- **Symptoms**: MCP tools behaving differently with certain styles
- **Diagnosis**: Style system prompt conflicts with MCP tool expectations
- **Solution**: 
  1. Test MCP tools with each style individually
  2. Adjust style prompts to maintain tool compatibility
  3. Document known tool interactions
  4. Use style-specific tool usage patterns

#### Agent Coordination Issues
- **Symptoms**: Sub-agent invocations failing or producing unexpected results
- **Diagnosis**: Style modifications affecting agent communication patterns
- **Solution**:
  1. Test agent workflows with each active style
  2. Adjust style prompts to preserve agent coordination
  3. Document style-specific agent behavior
  4. Use compatible styles for agent-heavy workflows

### Edge Cases

#### Settings File Corruption
- **Symptoms**: Claude Code fails to start or settings-related errors
- **Diagnosis**: Invalid JSON in `.claude/settings.local.json`
- **Solution**:
  1. Backup current settings file
  2. Validate JSON structure with linter
  3. Reset to defaults if corrupted
  4. Manually recreate critical settings

#### Cross-Platform Path Issues
- **Symptoms**: Styles work on one platform but not another
- **Diagnosis**: Path separator or directory location differences
- **Solution**:
  1. Use platform-appropriate path separators
  2. Verify user directory resolution
  3. Test style location detection
  4. Use relative paths where possible

#### Version Compatibility
- **Symptoms**: Styles created for older Claude Code versions not working
- **Diagnosis**: API or system prompt format changes
- **Solution**:
  1. Update style format to current specifications
  2. Test with current Claude Code version
  3. Document version compatibility
  4. Maintain style versioning for teams

## Diagnostic Tools

### Built-in Diagnostics
```bash
/output-style                    # List available styles and current active
/output-style --status          # Check current style configuration
```

### Manual Verification
```bash
# Check settings file
cat .claude/settings.local.json | grep outputStyle

# List user-level styles
ls -la ~/.claude/output-styles/

# List project-level styles  
ls -la .claude/output-styles/

# Validate style file structure
head -10 ~/.claude/output-styles/custom-style.md
```

### Style Testing Protocol
1. **Activation Test**: Verify style activates without errors
2. **Behavior Test**: Confirm expected behavioral changes
3. **Integration Test**: Test with common Claude Code operations
4. **Persistence Test**: Verify style survives session restart
5. **Documentation Test**: Ensure style behavior matches documentation

### Settings Validation
```json
// Valid settings.local.json structure
{
  "outputStyle": "style-name",
  "other-settings": "value"
}
```

## When to Escalate

### Technical Support Scenarios
- **Persistent Settings Corruption**: Multiple failed attempts to maintain settings
- **Platform-Specific Failures**: Style system not working on specific operating systems
- **Integration Failures**: Styles breaking core Claude Code functionality
- **Performance Degradation**: Styles causing significant response time increases

### Community Support
- **Custom Style Development**: Complex style requirements needing community input
- **Best Practices**: Style usage patterns and workflow optimization
- **Style Sharing**: Contributing styles to community repositories
- **Integration Patterns**: Advanced integration with development workflows

### Documentation Updates
- **Missing Features**: Style capabilities not covered in official documentation
- **Behavior Changes**: Style behavior changes between Claude Code versions
- **Example Gaps**: Need for additional practical examples
- **Integration Guidance**: Specific tool or workflow integration documentation

### Signs Expert Help is Needed
1. Repeated failures despite following troubleshooting steps
2. Style system affecting core Claude Code stability
3. Complex custom style requirements beyond standard patterns  
4. Team-wide style deployment and management challenges
5. Performance issues not resolved by standard optimization
6. Integration failures with critical development tools
