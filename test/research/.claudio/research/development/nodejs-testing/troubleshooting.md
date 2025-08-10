# Node.js Testing Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Tests Fail with "Cannot use import statement outside a module"

**Symptoms**:
- SyntaxError when running tests with `import` statements
- Tests work in development but fail in test environment
- Error occurs with modern ES modules syntax

**Diagnosis**:
```bash
# Check if package.json has module type
cat package.json | grep '"type"'

# Check Jest configuration
cat jest.config.js | grep -i "transform\|preset"
```

**Solution**:

For **Jest with ESM**:
```javascript
// package.json
{
  "type": "module",
  "scripts": {
    "test": "NODE_OPTIONS=--experimental-vm-modules jest"
  },
  "jest": {
    "preset": "@jest/preset-module",
    "extensionsToTreatAsEsm": [".js"],
    "testEnvironment": "node",
    "transform": {}
  }
}
```

For **Vitest** (recommended for ESM):
```javascript
// vitest.config.js
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    environment: 'node',
    globals: true
  }
});
```

**Prevention**: Use Vitest for new projects requiring ESM, or configure Jest properly for ESM from the start.

### Issue 2: Database Connection Errors in Tests

**Symptoms**:
- "Connection refused" errors when tests try to connect to database
- Tests pass individually but fail when run in parallel
- Intermittent failures in CI/CD pipeline

**Diagnosis**:
```bash
# Check if database is running
docker ps | grep postgres

# Check connection string
echo $DATABASE_URL

# Test database connectivity
npm run db:test-connection
```

**Solution**:

**Docker Compose Setup**:
```yaml
# docker-compose.test.yml
version: '3.8'
services:
  test-db:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: testdb
      POSTGRES_USER: testuser
      POSTGRES_PASSWORD: testpass
    ports:
      - "5433:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U testuser -d testdb"]
      interval: 5s
      timeout: 5s
      retries: 5
```

**Test Setup with Health Checks**:
```javascript
// test/setup.js
import { execSync } from 'child_process';
import { Client } from 'pg';

async function waitForDatabase() {
  const client = new Client({
    connectionString: 'postgres://testuser:testpass@localhost:5433/testdb'
  });
  
  for (let i = 0; i < 30; i++) {
    try {
      await client.connect();
      await client.end();
      return;
    } catch (err) {
      await new Promise(resolve => setTimeout(resolve, 1000));
    }
  }
  throw new Error('Database not ready after 30 seconds');
}

beforeAll(async () => {
  execSync('docker-compose -f docker-compose.test.yml up -d');
  await waitForDatabase();
});
```

**Prevention**: Always use health checks and proper wait strategies for database connections.

### Issue 3: Flaky Tests Due to Async Operations

**Symptoms**:
- Tests pass sometimes and fail other times
- Tests depend on timing or external resources
- Different results in local vs CI environments

**Diagnosis**:
```javascript
// Look for these patterns in your tests
setTimeout(() => {}, 100);  // Fixed timeouts
expect(someAsyncOperation()).toBe(true);  // Missing await
```

**Solution**:

**Proper Async Testing**:
```javascript
// Bad: Using setTimeout
it('should process async operation', (done) => {
  processData();
  setTimeout(() => {
    expect(result).toBe(expected);
    done();
  }, 100);
});

// Good: Proper await patterns
it('should process async operation', async () => {
  const result = await processData();
  expect(result).toBe(expected);
});

// Good: Using waitFor patterns
it('should update UI after async operation', async () => {
  await act(async () => {
    await processData();
  });
  
  await waitFor(() => {
    expect(screen.getByText('Success')).toBeInTheDocument();
  });
});
```

**Test Isolation with Database Transactions**:
```javascript
describe('User Service', () => {
  let transaction;
  
  beforeEach(async () => {
    transaction = await db.transaction();
  });
  
  afterEach(async () => {
    await transaction.rollback();
  });
  
  it('creates user successfully', async () => {
    const user = await userService.create({ email: 'test@example.com' });
    expect(user.id).toBeDefined();
  });
});
```

**Prevention**: Always use proper async/await patterns and isolate test data with transactions.

### Issue 4: Memory Leaks in Test Suites

**Symptoms**:
- Tests slow down over time
- "JavaScript heap out of memory" errors
- CI runs fail on large test suites

**Diagnosis**:
```bash
# Run tests with memory monitoring
node --inspect --max-old-space-size=4096 ./node_modules/.bin/jest

# Check for memory leaks
npm install --save-dev clinic
clinic doctor -- npm test
```

**Solution**:

**Proper Cleanup in Tests**:
```javascript
describe('Service Tests', () => {
  let server;
  let connections = [];
  
  beforeEach(async () => {
    server = await startTestServer();
  });
  
  afterEach(async () => {
    // Close all connections
    await Promise.all(connections.map(conn => conn.close()));
    connections = [];
    
    // Close server
    if (server) {
      await server.close();
    }
    
    // Clear all mocks
    jest.clearAllMocks();
    jest.clearAllTimers();
  });
});
```

**Mock Cleanup**:
```javascript
// In Jest setup file
afterEach(() => {
  jest.resetAllMocks();
  jest.clearAllTimers();
  jest.useRealTimers();
});

afterAll(() => {
  jest.restoreAllMocks();
});
```

**Prevention**: Always clean up resources, connections, and mocks in test teardown.

### Issue 5: Mock Functions Not Working as Expected

**Symptoms**:
- Mocked functions return undefined
- Original functions called instead of mocks
- Mock assertions fail unexpectedly

**Diagnosis**:
```javascript
// Check if mock is properly set up
console.log(jest.isMockFunction(myMockedFunction)); // Should be true
console.log(myMockedFunction.mock.calls); // Should show call history
```

**Solution**:

**Proper Mock Setup (Jest)**:
```javascript
// Module-level mocking
jest.mock('../services/emailService', () => ({
  sendEmail: jest.fn().mockResolvedValue({ success: true }),
  validateEmail: jest.fn().mockReturnValue(true)
}));

// Or with manual mock
import { emailService } from '../services/emailService';
jest.mocked(emailService.sendEmail).mockResolvedValue({ success: true });
```

**Vitest Mocking**:
```javascript
import { vi } from 'vitest';
import { emailService } from '../services/emailService';

// Mock the module
vi.mock('../services/emailService', () => ({
  emailService: {
    sendEmail: vi.fn().mockResolvedValue({ success: true }),
    validateEmail: vi.fn().mockReturnValue(true)
  }
}));
```

**Mock Cleanup Between Tests**:
```javascript
beforeEach(() => {
  // Clear mock history but keep implementation
  jest.clearAllMocks();
  
  // Or reset to original implementation
  // jest.restoreAllMocks();
});
```

**Prevention**: Always verify mocks are properly configured and cleared between tests.

## Advanced Troubleshooting

### Performance Issues

**Slow Test Execution**

**Identify Bottlenecks**:
```bash
# Profile Jest tests
jest --detectOpenHandles --forceExit --verbose

# Profile with timing
jest --verbose --testTimeout=30000
```

**Solutions**:
```javascript
// Optimize parallel execution
module.exports = {
  maxWorkers: process.env.CI ? 2 : '50%',
  testTimeout: 10000,
  // Run tests in parallel within files
  maxConcurrency: 5
};

// Use in-memory database for unit tests
const testConfig = {
  database: process.env.NODE_ENV === 'test' 
    ? ':memory:' 
    : 'real-database.db'
};
```

**Large Test Suites**:
```javascript
// Split tests by pattern
npm run test -- --testPathPattern=unit
npm run test -- --testPathPattern=integration
npm run test -- --testPathPattern=e2e

// Use test sharding in CI
jest --shard=1/4  # Run 1st quarter of tests
jest --shard=2/4  # Run 2nd quarter of tests
```

### Integration Problems

**External API Testing**

**Network Request Mocking**:
```javascript
// Using MSW (Mock Service Worker)
import { rest } from 'msw';
import { setupServer } from 'msw/node';

const server = setupServer(
  rest.post('/api/payment', (req, res, ctx) => {
    return res(ctx.json({ id: '12345', status: 'approved' }));
  })
);

beforeAll(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());
```

**Environment Configuration**:
```javascript
// test/config.js
export const testConfig = {
  apiUrl: process.env.TEST_API_URL || 'http://localhost:3001',
  database: {
    host: process.env.TEST_DB_HOST || 'localhost',
    port: process.env.TEST_DB_PORT || 5433,
    name: process.env.TEST_DB_NAME || 'testdb'
  }
};
```

### Edge Cases

**Timezone-Related Test Failures**

```javascript
// Mock Date for consistent testing
beforeAll(() => {
  jest.useFakeTimers();
  jest.setSystemTime(new Date('2024-01-01T00:00:00.000Z'));
});

afterAll(() => {
  jest.useRealTimers();
});

// Or use a library like timekeeper
import timekeeper from 'timekeeper';

beforeAll(() => {
  timekeeper.freeze(new Date('2024-01-01'));
});

afterAll(() => {
  timekeeper.reset();
});
```

**File System Operations in Tests**:
```javascript
import { tmpdir } from 'os';
import { mkdtemp, rm } from 'fs/promises';
import { join } from 'path';

describe('File Operations', () => {
  let tempDir;
  
  beforeEach(async () => {
    tempDir = await mkdtemp(join(tmpdir(), 'test-'));
  });
  
  afterEach(async () => {
    if (tempDir) {
      await rm(tempDir, { recursive: true });
    }
  });
  
  it('should create and read file', async () => {
    const filePath = join(tempDir, 'test.txt');
    await writeFile(filePath, 'test content');
    const content = await readFile(filePath, 'utf8');
    expect(content).toBe('test content');
  });
});
```

**Process Environment Isolation**:
```javascript
describe('Environment Tests', () => {
  const originalEnv = process.env;
  
  beforeEach(() => {
    // Create clean environment copy
    process.env = { ...originalEnv };
  });
  
  afterEach(() => {
    // Restore original environment
    process.env = originalEnv;
  });
  
  it('should handle custom environment variables', () => {
    process.env.CUSTOM_VAR = 'test-value';
    expect(getConfigValue('CUSTOM_VAR')).toBe('test-value');
  });
});
```

## Diagnostic Tools

### Built-in Debugging Tools

**Jest Debugging**:
```bash
# Run specific test with debugging
node --inspect-brk ./node_modules/.bin/jest --runInBand specific-test.js

# Run with coverage and verbose output
jest --coverage --verbose --detectOpenHandles
```

**Vitest Debugging**:
```bash
# Run with debugging
vitest --inspect-brk

# Run specific test file
vitest run path/to/test.js

# Watch mode with UI
vitest --ui
```

### External Tools

**Memory Analysis**:
```bash
# Install clinic.js for performance analysis
npm install --save-dev clinic

# Profile memory usage
clinic doctor -- npm test

# Check for memory leaks
clinic bubbleprof -- npm test
```

**Code Coverage Analysis**:
```bash
# Generate detailed coverage report
npm test -- --coverage --coverageReporters=html

# Coverage with threshold enforcement
jest --coverage --coverageThreshold='{"global":{"branches":80,"functions":80,"lines":80}}'
```

**Test Impact Analysis**:
```bash
# Find tests affected by changes
jest --changedSince=main --passWithNoTests

# Test only related files
jest --findRelatedTests src/utils/helper.js
```

## When to Escalate

### Signs That Expert Help is Needed

**Technical Complexity**:
- Multiple test frameworks need integration
- Custom test runners or complex CI/CD pipeline setup
- Performance optimization beyond standard practices
- Complex mocking scenarios with circular dependencies

**Architectural Decisions**:
- Choosing between testing strategies for large codebases
- Designing test infrastructure for microservices
- Implementing mutation testing or advanced coverage metrics
- Setting up sophisticated test data management

**Critical Issues**:
- Persistent memory leaks affecting production deployments
- Test suite taking longer than 10-15 minutes to run
- Frequent CI/CD failures due to test instability
- Security vulnerabilities in test infrastructure

**Team-Level Challenges**:
- Establishing testing standards across multiple teams
- Training developers on advanced testing techniques
- Migrating large legacy test suites
- Implementing test-driven development practices

### Escalation Resources

**Community Support**:
- Stack Overflow for specific technical issues
- GitHub Issues for framework-specific bugs
- Discord/Slack communities for real-time help

**Professional Support**:
- Framework maintainers for critical bugs
- DevOps consultants for CI/CD optimization
- Testing experts for strategy and architecture advice

**Internal Escalation**:
- Senior developers for complex architectural decisions
- DevOps team for infrastructure and performance issues
- Security team for test environment security concerns
EOF < /dev/null