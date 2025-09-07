# Test Command Generation Templates

## Output Format Templates

### Command Generation Completion Report
```markdown
## Test Command Generation Complete ✓
### Generated Commands:
- ✓ /claudio:test - [PROJECT_TYPE] test execution with [TEST_FRAMEWORK]
- ✓ /claudio:test-g - Gemini AI integration for test analysis

### Sub-Agents Created:
- ✓ [project-name]-test-runner - Framework-specific test execution
- ✓ [project-name]-test-gemini - AI-powered test analysis

### Extended Context Generated:
- ✓ Testing framework configuration examples
- ✓ Project-specific troubleshooting guides
- ✓ Framework integration patterns

### Installation Status:
- ✓ Commands installed to .claude/commands/
- ✓ Agents installed to .claude/agents/
- ✓ Extended context populated

### Ready for Testing: YES
```

## Test Framework Command Patterns

### JavaScript/Node.js Test Commands
```bash
# Basic test execution
npm test
npm run test:unit
npm run test:integration

# Coverage generation
npm run test:coverage
npm run test -- --coverage

# Watch mode
npm run test:watch
npm test -- --watch

# Specific test patterns
npm test -- --grep "specific pattern"
npm test -- __tests__/specific-file.test.js
```

### Python Test Commands
```bash
# pytest execution
pytest
pytest tests/
pytest -v tests/test_specific.py

# Coverage with pytest
pytest --cov=src tests/
pytest --cov-report=html tests/

# unittest execution
python -m unittest discover tests
python -m unittest tests.test_specific
```

### Ruby Test Commands  
```bash
# RSpec execution
bundle exec rspec
bundle exec rspec spec/specific_spec.rb
bundle exec rspec --format documentation

# Minitest execution
ruby -Ilib:test test/test_specific.rb
rake test
```

## Agent Template Structures

### Test Runner Agent Metadata Template
```yaml
---
name: [project-name]-test-runner
description: "Execute [FRAMEWORK] tests with intelligent failure analysis for [PROJECT_TYPE] project"
tools: Bash, Read, Grep, LS, TodoWrite
model: sonnet
---
```

### Gemini Integration Agent Template
```yaml
---
name: [project-name]-test-gemini
description: "AI-powered test analysis using Gemini for [PROJECT_TYPE] project with [FRAMEWORK]"
tools: Bash, Read, Write, Grep, TodoWrite
model: sonnet
---
```

## Framework-Specific Configuration Examples

### Jest Configuration Template
```javascript
module.exports = {
  testEnvironment: 'node',
  collectCoverage: true,
  coverageDirectory: 'coverage',
  testMatch: ['**/__tests__/**/*.js', '**/*.test.js'],
  collectCoverageFrom: [
    'src/**/*.js',
    '!src/**/*.test.js'
  ]
};
```

### Pytest Configuration Template
```ini
[tool:pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts = -v --tb=short --strict-config --strict-markers
markers =
    unit: Unit tests
    integration: Integration tests
    slow: Slow running tests
```

### RSpec Configuration Template
```ruby
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
```