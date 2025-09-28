# TaskApp Testing Guide

This guide provides comprehensive information about the testing strategy, tools, and workflows for the TaskApp Phoenix LiveView application.

## Table of Contents

- [Testing Philosophy](#testing-philosophy)
- [Test Structure](#test-structure)
- [Testing Tools](#testing-tools)
- [Running Tests](#running-tests)
- [Test Categories](#test-categories)
- [Best Practices](#best-practices)
- [CI/CD Integration](#cicd-integration)
- [Performance Testing](#performance-testing)
- [Troubleshooting](#troubleshooting)

## Testing Philosophy

TaskApp follows a comprehensive testing approach that includes:

- **Unit Tests**: Test individual functions and modules in isolation
- **Integration Tests**: Test interactions between different components
- **LiveView Tests**: Test user interactions and real-time features
- **API Tests**: Test REST endpoints and HTTP responses
- **Property-Based Tests**: Test system invariants with generated data
- **Load Tests**: Test system behavior under high load
- **Performance Tests**: Measure and validate system performance

## Test Structure

```
test/
├── test_helper.exs                 # Test configuration and setup
├── support/                       # Test utilities and helpers
│   ├── conn_case.ex               # Phoenix connection test case
│   ├── test_helpers.ex            # Custom test helper functions
│   └── factories.ex               # Test data factories (ExMachina)
├── task_app/                      # Core business logic tests
│   ├── task_test.exs              # Task module unit tests
│   ├── task_store_test.exs        # TaskStore GenServer tests
│   ├── task_validation_test.exs   # Validation logic tests
│   └── task_store_integration_test.exs # Integration & performance tests
├── task_app_web/                  # Web layer tests
│   ├── controllers/
│   │   └── task_controller_test.exs # API endpoint tests
│   └── live/
│       └── task_live/
│           └── index_test.exs      # LiveView interaction tests
├── property_tests/                # Property-based tests
│   └── task_property_test.exs     # StreamData property tests
└── load_tests/                    # Load and stress tests
    └── task_store_load_test.exs   # High concurrency tests
```

## Testing Tools

### Core Testing Framework
- **ExUnit**: Elixir's built-in testing framework
- **Phoenix.ConnTest**: HTTP connection testing
- **Phoenix.LiveViewTest**: LiveView interaction testing

### Additional Testing Libraries
- **Mock**: Function mocking for isolation
- **ExCoveralls**: Test coverage analysis
- **ExMachina**: Test data factories
- **StreamData**: Property-based testing
- **Floki**: HTML parsing for LiveView tests

### Development Tools
- **mix_test_watch**: Automatic test running on file changes
- **Credo**: Code analysis and style checking
- **Dialyxir**: Static analysis with Dialyzer

## Running Tests

### Basic Test Commands

```bash
# Run all tests
mix test

# Run specific test file
mix test test/task_app/task_test.exs

# Run tests with coverage
mix test --cover

# Generate detailed coverage report
mix coveralls.html

# Run tests in watch mode (auto-rerun on changes)
mix test.watch

# Run only failed tests from last run
mix test --failed

# Run tests matching a pattern
mix test --only property_test
```

### Test Categories

```bash
# Unit tests only
mix test test/task_app/

# Integration tests
mix test test/task_app/task_store_integration_test.exs

# Web layer tests
mix test test/task_app_web/

# Property-based tests
mix test test/property_tests/

# Load tests (run with caution - resource intensive)
mix test test/load_tests/ --only load_test

# Performance benchmarks
mix test --only performance
```

### Environment-Specific Testing

```bash
# Run with specific configuration
MIX_ENV=test mix test

# CI environment simulation
CI=true mix test

# Load test configuration
LOAD_TEST=true mix test test/load_tests/
```

## Test Categories

### 1. Unit Tests (`test/task_app/`)

**Purpose**: Test individual functions and modules in isolation.

**Key Features**:
- Fast execution
- No external dependencies
- Focused on business logic
- High code coverage

**Example**:
```elixir
test "creates a task with valid title" do
  task = Task.new!("Buy groceries")
  
  assert task.title == "Buy groceries"
  assert task.completed == false
  assert is_binary(task.id)
end
```

### 2. Integration Tests (`task_store_integration_test.exs`)

**Purpose**: Test interactions between multiple components.

**Key Features**:
- GenServer state management
- Concurrent operations
- Data consistency validation
- Error handling

**Example**:
```elixir
test "handles concurrent task additions", %{store_pid: store_pid} do
  task_count = 20
  
  concurrent_tasks = 
    Task.async_stream(1..task_count, fn i ->
      task = Task.new!("Concurrent task #{i}")
      GenServer.call(store_pid, {:add_task, task})
    end, max_concurrency: 10)
    |> Enum.to_list()
  
  assert length(concurrent_tasks) == task_count
end
```

### 3. LiveView Tests (`task_live/index_test.exs`)

**Purpose**: Test user interactions and real-time UI updates.

**Key Features**:
- User interaction simulation
- DOM element verification
- Form submission testing
- Real-time updates

**Example**:
```elixir
test "can add a new task", %{conn: conn} do
  {:ok, view, _html} = live(conn, "/")
  
  view
  |> form("form[phx-submit='add_task']", %{task_title: "Test task"})
  |> render_submit()
  
  assert has_element?(view, "[data-task-title]", "Test task")
end
```

### 4. API Tests (`task_controller_test.exs`)

**Purpose**: Test REST API endpoints and HTTP responses.

**Key Features**:
- HTTP status code validation
- JSON response structure
- Error handling
- Authentication (if applicable)

**Example**:
```elixir
test "creates valid task", %{conn: conn} do
  task_params = %{"task" => %{"title" => "New API task"}}
  
  conn = post(conn, "/api/tasks", task_params)
  
  assert %{"task" => task} = json_response(conn, 201)
  assert task["title"] == "New API task"
end
```

### 5. Property-Based Tests (`task_property_test.exs`)

**Purpose**: Test system invariants with automatically generated data.

**Key Features**:
- Automated test case generation
- Edge case discovery
- Invariant validation
- Comprehensive input coverage

**Example**:
```elixir
property "task creation with valid titles always succeeds" do
  check all title <- valid_title_generator() do
    case Task.new(title) do
      {:ok, task} ->
        assert task.title == String.trim(title)
        assert task.completed == false
      {:error, _reason} ->
        flunk("Valid title should not fail: #{inspect(title)}")
    end
  end
end
```

### 6. Load Tests (`task_store_load_test.exs`)

**Purpose**: Test system behavior under high concurrent load.

**Key Features**:
- High concurrency simulation
- Performance benchmarking
- Memory usage monitoring
- System stability validation

**Example**:
```elixir
test "handles high concurrent task creation" do
  concurrent_processes = 50
  tasks_per_process = 100
  
  {execution_time_ms, _results} = TestHelpers.measure_time(fn ->
    # Execute concurrent operations...
  end)
  
  assert execution_time_ms < 10_000
end
```

## Best Practices

### 1. Test Organization

- **One test file per module**: Keep tests close to the code they test
- **Descriptive test names**: Use clear, specific descriptions
- **Group related tests**: Use `describe` blocks for logical grouping
- **Setup and teardown**: Use appropriate setup for test isolation

### 2. Test Data Management

```elixir
# Use factories for consistent test data
task = build(:task, title: "Specific test case")

# Create isolated stores for GenServer tests
{store_pid, _store_name} = TestHelpers.start_isolated_store()

# Use property-based testing for edge cases
check all title <- valid_title_generator() do
  # Test logic
end
```

### 3. Async Testing

```elixir
# Use async: true for independent tests
defmodule TaskApp.TaskTest do
  use ExUnit.Case, async: true
  # Tests can run in parallel
end

# Use async: false for tests that share state
defmodule TaskApp.TaskStoreLoadTest do
  use ExUnit.Case, async: false
  # Tests run sequentially
end
```

### 4. Error Testing

```elixir
# Test both success and failure cases
test "validates task title" do
  # Valid case
  assert {:ok, _task} = Task.new("Valid title")
  
  # Invalid cases
  assert {:error, :title_empty} = Task.new("")
  assert {:error, :title_too_long} = Task.new(String.duplicate("a", 101))
end
```

### 5. Performance Assertions

```elixir
# Include performance assertions in critical paths
{time_ms, result} = TestHelpers.measure_time(fn ->
  # Operation to measure
end)

assert time_ms < 100, "Operation took #{time_ms}ms, expected < 100ms"
```

## CI/CD Integration

### GitHub Actions Workflow

The project includes a comprehensive CI/CD pipeline (`.github/workflows/ci.yml`):

**Test Matrix**:
- Multiple Elixir versions (1.15.7, 1.16.2)
- Multiple OTP versions (25.3, 26.2)
- Automated dependency caching
- Parallel job execution

**Quality Checks**:
- Code formatting validation
- Static analysis with Credo
- Type checking with Dialyzer
- Security audit
- Test coverage reporting

**Performance Validation**:
- Dedicated performance test job
- Load test execution
- Memory usage monitoring

### Running CI Locally

```bash
# Simulate CI environment
CI=true mix ci

# Run all quality checks
mix quality

# Generate coverage report
mix test.coverage
```

## Performance Testing

### Metrics and Thresholds

Performance tests validate the following metrics:

| Operation | Threshold | Measurement |
|-----------|-----------|-------------|
| Task Creation | < 10ms avg | Individual task creation time |
| Task Retrieval | < 5ms | Single task lookup |
| Bulk Operations | > 100/sec | Concurrent operations throughput |
| Memory Usage | < 1KB/task | Memory per task stored |
| Stats Calculation | < 50ms | Statistics computation time |

### Load Testing Scenarios

1. **Light Load**: 100 tasks, 50 concurrent ops
2. **Medium Load**: 1,000 tasks, 200 concurrent ops  
3. **Heavy Load**: 5,000 tasks, 500 concurrent ops
4. **Stress Test**: 10,000 tasks, 1,000 concurrent ops

### Running Performance Tests

```bash
# Run all performance tests
mix test --only performance

# Run specific load test
mix test test/load_tests/task_store_load_test.exs

# Monitor system resources during testing
mix test --only load_test --trace
```

## Coverage Goals

- **Overall Coverage**: > 80%
- **Unit Tests**: > 90%
- **Integration Tests**: > 85%
- **LiveView Tests**: > 75%
- **Property Tests**: Invariant validation

```bash
# Generate coverage report
mix coveralls.html

# View detailed coverage
open cover/excoveralls.html
```

## Troubleshooting

### Common Issues

**1. GenServer Timeout Errors**
```elixir
# Solution: Increase timeout for heavy operations
GenServer.call(store_pid, :get_all_tasks, 10_000)
```

**2. Async Test Failures**
```elixir
# Solution: Use proper test isolation
setup do
  {store_pid, _name} = TestHelpers.start_isolated_store()
  %{store_pid: store_pid}
end
```

**3. LiveView Element Not Found**
```elixir
# Solution: Wait for element to appear or check correct selector
assert has_element?(view, "[data-testid='task-item']")
```

**4. Memory Leaks in Load Tests**
```elixir
# Solution: Proper cleanup and garbage collection
on_exit(fn ->
  if Process.alive?(store_pid), do: GenServer.stop(store_pid)
end)
```

### Debug Mode

```bash
# Run tests with debug output
mix test --trace

# Run single test with full output
mix test test/task_app/task_test.exs:15 --trace

# Debug LiveView interactions
mix test test/task_app_web/live/task_live/index_test.exs --trace
```

### Performance Issues

```bash
# Profile test execution
mix test --slowest 10

# Memory usage analysis
mix test --only load_test --trace
```

## Contributing

When adding new features:

1. **Write tests first** (TDD approach)
2. **Include property tests** for complex logic
3. **Add performance tests** for critical paths
4. **Update this documentation** for new test categories
5. **Ensure CI passes** before submitting PRs

## Additional Resources

- [ExUnit Documentation](https://hexdocs.pm/ex_unit/ExUnit.html)
- [Phoenix Testing Guide](https://hexdocs.pm/phoenix/testing.html)
- [LiveView Testing](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html)
- [Property-Based Testing with StreamData](https://hexdocs.pm/stream_data/StreamData.html)
- [ExCoveralls Configuration](https://hexdocs.pm/excoveralls/readme.html)