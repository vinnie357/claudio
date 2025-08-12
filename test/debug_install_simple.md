# Simple Install Command Debug Test

## Purpose
Test the basic `/claudio:install` command functionality outside of nested sessions to isolate the root cause of installation failures.

## Test Steps

### Step 1: Basic Command Availability Test
Try executing the install command with help or list to confirm it's available:
```
/help
```
Look for install command in the list.

### Step 2: Simple Install Test (Current Directory)
Try a basic install to current directory:
```
/claudio:install .
```

### Step 3: Simple Install Test (Test Directory)  
Try install to test directory:
```
/claudio:install test/install
```

### Step 4: Commands-Only Install Test
Try commands-only install:
```
/claudio:install commands test/install
```

## Expected Behaviors to Verify

1. **Command Recognition**: `/claudio:install` should be recognized as a valid command
2. **Agent Invocation**: Should invoke install-coordinator-agent 
3. **Directory Creation**: Should create .claude/ and/or .claudio/ directories
4. **File Installation**: Should install at least some component files
5. **Error Messages**: Any errors should be specific and actionable

## Debug Information to Collect

- Exact error messages (if any)
- Whether command is recognized
- Whether any directories are created
- Whether any files are written
- Agent execution logs/output
- Permission-related errors

This test will help determine if the issue is:
- Command not being recognized
- Agent coordination problems  
- File system operation failures
- Nested session execution issues
- Permission/path resolution problems