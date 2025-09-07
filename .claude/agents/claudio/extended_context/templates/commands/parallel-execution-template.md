# Parallel Execution Command Template

This template demonstrates the critical parallel execution pattern required for performance optimization in Claudio commands.

## Template Structure

```markdown
---
description: "{COMMAND_DESCRIPTION}"
argument-hint: "{ARGUMENT_HINT}"
---

{COMMAND_PURPOSE_STATEMENT}

**🚀 CRITICAL: This command uses parallel execution for optimal performance**

**Parallel Operations:**
{PARALLEL_OPERATIONS_LIST}

**Usage:**
- `/{COMMAND_NAME}` - {DEFAULT_USAGE}
- `/{COMMAND_NAME} {EXAMPLE_ARGS}` - {EXAMPLE_USAGE}

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
{PARALLEL_TASK_INVOCATIONS}

Then read outputs from all parallel operations, validate them, and create comprehensive report.

**Performance Benefits**: {PERFORMANCE_BENEFITS}
**Coordination Strategy**: {COORDINATION_STRATEGY}
```

## Variable Reference

- `{COMMAND_NAME}` - The slash command name
- `{COMMAND_DESCRIPTION}` - Brief description emphasizing parallel nature
- `{ARGUMENT_HINT}` - Parameter format hint
- `{COMMAND_PURPOSE_STATEMENT}` - What this parallel operation accomplishes
- `{PARALLEL_OPERATIONS_LIST}` - List of operations that run in parallel
- `{DEFAULT_USAGE}` - Default usage example
- `{EXAMPLE_ARGS}` - Example arguments
- `{EXAMPLE_USAGE}` - Usage with arguments example
- `{PARALLEL_TASK_INVOCATIONS}` - Specific parallel Task tool calls
- `{PERFORMANCE_BENEFITS}` - Performance gains from parallelization
- `{COORDINATION_STRATEGY}` - How parallel results are coordinated

## Example Usage

**Multi-Perspective Code Review:**
```markdown
---
description: "Comprehensive code review using multiple specialized reviewers in parallel"
argument-hint: "[--files <pattern>] [--focus <security|performance|style|all>]"
---

Execute comprehensive code review using multiple specialized review agents running in parallel for optimal performance.

**🚀 CRITICAL: This command uses parallel execution for optimal performance**

**Parallel Operations:**
1. Security vulnerability analysis (security-threat-modeler)
2. Performance bottleneck identification (performance-analyzer)
3. Code quality and style assessment (code-quality-analyzer)
4. Architecture and design review (design-analyzer)

**Usage:**
- `/review` - Review entire project with all perspectives
- `/review --files "src/**/*.js" --focus security` - Security-focused review of JavaScript files

## Implementation

I will use TodoWrite to track progress, then make parallel Task calls:

**🚀 CRITICAL: Run multiple Task invocations in a SINGLE message**
- Task with subagent_type: "security-threat-modeler" - pass the file patterns and security focus parameters
- Task with subagent_type: "performance-analyzer" - pass the performance analysis scope and file patterns
- Task with subagent_type: "code-quality-analyzer" - pass the quality assessment parameters
- Task with subagent_type: "design-analyzer" - pass the architecture review parameters

Then read outputs from all parallel operations, validate them, and create comprehensive code review report.

**Performance Benefits**: 4x faster execution compared to sequential review, parallel analysis completion in ~2-3 minutes vs 8-12 minutes sequential
**Coordination Strategy**: Results consolidated into unified review with priority-ranked findings and cross-perspective insights
```

## Critical Parallel Execution Requirements

### 🚀 MANDATORY Pattern Elements

1. **Single Message Multiple Tasks**:
   ```
   Run multiple Task invocations in a SINGLE message
   ```

2. **Parallel Task Calls**:
   ```markdown
   - Task with subagent_type: "agent-1" - pass arguments
   - Task with subagent_type: "agent-2" - pass arguments  
   - Task with subagent_type: "agent-3" - pass arguments
   ```

3. **Performance Documentation**:
   - Document speed improvements
   - Explain coordination benefits
   - Show time comparisons where applicable

4. **TodoWrite Integration**:
   - Always use TodoWrite for progress tracking
   - Mark parallel execution phases clearly
   - Track completion of all parallel operations

## When to Use This Template

- Independent operations that can run simultaneously  
- Analysis tasks requiring multiple perspectives
- Operations with significant time savings potential
- Commands processing large datasets or multiple files
- Workflows with non-dependent parallel stages

## Pattern Benefits

- **Performance**: Significant execution time reduction
- **Efficiency**: Better resource utilization
- **User Experience**: Faster command completion
- **Scalability**: Handles larger workloads effectively
- **Reliability**: Independent failure isolation

## Anti-Patterns to Avoid

- ❌ Sequential execution when parallel is possible
- ❌ Multiple messages for parallel Task calls
- ❌ Missing TodoWrite progress tracking
- ❌ No performance benefit documentation
- ❌ Dependent operations run in parallel