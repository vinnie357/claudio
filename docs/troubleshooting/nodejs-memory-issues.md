# Fixing Node.js Memory Issues with Parallel Claude Agents

## Problem

When running multiple Claude sub-agents in parallel, you may encounter this error:

```
[96157:0x158018000] FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
```

This occurs because Node.js has a default heap memory limit of ~1.7GB, which gets exceeded when running multiple agents simultaneously.

## Quick Fix (One-liner)

```bash
export NODE_OPTIONS="--max-old-space-size=8192" && claude-code
```

## Permanent Solution

### For zsh users (most macOS users):
```bash
echo 'export NODE_OPTIONS="--max-old-space-size=8192"' >> ~/.zshrc && source ~/.zshrc
```

### For bash users (most Linux users):
```bash
echo 'export NODE_OPTIONS="--max-old-space-size=8192"' >> ~/.bashrc && source ~/.bashrc
```

### Manual configuration:
```bash
# Edit your shell config file
nano ~/.zshrc  # or ~/.bashrc for bash users

# Add this line at the end:
export NODE_OPTIONS="--max-old-space-size=8192"

# Save and reload your shell config
source ~/.zshrc  # or source ~/.bashrc
```

## Memory Allocation Guidelines

| Use Case | Agents | Recommended Setting | Command |
|----------|--------|-------------------|---------|
| Light usage | 1-3 agents | 4GB | `--max-old-space-size=4096` |
| Medium usage | 4-8 agents | 8GB | `--max-old-space-size=8192` |
| Heavy usage | 8+ agents | 12-16GB | `--max-old-space-size=12288` |

## Verification

Check if the memory increase worked:

```bash
node -e "console.log(v8.getHeapStatistics().heap_size_limit / 1024 / 1024, 'MB')"
```

**Expected output:** 
- Before: ~1700 MB
- After: 8192 MB (or your configured amount)

## Alternative Solutions

### 1. Limit Concurrent Agents (Recommended)

Instead of running unlimited parallel agents, use a queue system:

```javascript
const pLimit = require('p-limit');
const limit = pLimit(3); // Limit to 3 concurrent agents

const results = await Promise.all(
  tasks.map(task => limit(() => runAgent(task)))
);
```

### 2. Agent Lifecycle Management

```javascript
class AgentPool {
  constructor(maxAgents = 3) {
    this.maxAgents = maxAgents;
    this.activeAgents = [];
  }
  
  async runAgent(task) {
    while (this.activeAgents.length >= this.maxAgents) {
      await this.waitForSlot();
    }
    
    const agent = new Agent();
    this.activeAgents.push(agent);
    
    try {
      const result = await agent.process(task);
      return result;
    } finally {
      this.activeAgents = this.activeAgents.filter(a => a !== agent);
      agent.cleanup();
    }
  }
}
```

### 3. Memory Monitoring

```javascript
// Monitor memory usage in your application
setInterval(() => {
  const used = process.memoryUsage();
  console.log(`Memory usage: ${Math.round(used.rss / 1024 / 1024 * 100) / 100} MB`);
  
  if (used.heapUsed > 6000000000) { // 6GB threshold
    global.gc && global.gc(); // Trigger garbage collection
  }
}, 10000);
```

## Best Practices

1. **Start conservative**: Begin with 4GB and increase as needed
2. **Monitor system resources**: Don't exceed 80% of available RAM
3. **Implement proper cleanup**: Ensure agents release resources when done
4. **Use streaming responses**: Avoid loading large responses into memory
5. **Consider worker threads**: For CPU-intensive tasks instead of multiple processes

## Troubleshooting

### Still getting memory errors?

1. **Increase memory further**: Try `--max-old-space-size=12288` (12GB)
2. **Check system RAM**: Ensure you have enough physical memory
3. **Monitor agent count**: Use `ps aux | grep node` to see running processes
4. **Implement agent pooling**: Limit concurrent agents as shown above

### Environment-specific issues:

- **Docker**: Add memory limits to your container configuration
- **CI/CD**: Set NODE_OPTIONS in your pipeline environment variables
- **Cloud platforms**: Ensure your instance has sufficient memory allocated

## Why This Works

- **Default Node.js heap**: ~1.7GB on 64-bit systems
- **Parallel agent memory**: Each agent loads models, context, and data
- **Memory accumulation**: 3-4 agents can easily exceed default limits
- **Solution**: `--max-old-space-size` increases the V8 heap limit

The `8192` value allocates 8GB of heap space, providing sufficient memory for multiple parallel Claude agents while maintaining system stability.