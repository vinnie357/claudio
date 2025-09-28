# TaskApp Phoenix LiveView Testing Context

## Project Testing Overview

### Framework Stack
- **Primary Framework**: ExUnit with Phoenix LiveView Test integration
- **Runner**: `mix test` with Elixir 1.14+ and Phoenix 1.7+
- **Coverage**: ExCoveralls with HTML report generation (target >80%)
- **Property Testing**: StreamData for comprehensive edge case validation
- **Load Testing**: Custom concurrent process simulation with performance metrics
- **Code Quality**: Credo static analysis with Dialyzer type checking

### Test Directory Structure
```
test/
├── task_app/                    # Domain logic unit tests (async: true)
│   ├── task_test.exs           # Core Task entity testing
│   ├── task_validation_test.exs # Input validation and error handling  
│   └── task_store_test.exs     # GenServer state management
├── task_app_web/               # Web layer integration tests
│   └── live/
│       └── task_live/
│           └── theme_toggle_test.exs # LiveView component testing
├── load_tests/                 # Performance and concurrency tests
│   └── task_store_load_test.exs # High-concurrency validation
└── support/                    # Test utilities and helpers
    └── test_helpers.ex        # Shared test utilities
```

## Testing Patterns and Conventions

### 1. Unit Testing Patterns (async: true)
**Domain Logic Testing**:
```elixir
defmodule TaskApp.TaskTest do
  use ExUnit.Case, async: true
  alias TaskApp.Task

  describe "new!/1" do
    test "creates task with valid title" do
      task = Task.new!("Buy groceries")
      assert task.title == "Buy groceries"
      assert task.completed == false
      assert is_binary(task.id)
    end
  end
end
```

**Key Characteristics**:
- Pure function testing with no side effects
- Async execution for parallel performance
- Comprehensive boundary condition testing
- Error handling validation with proper error tuples

### 2. Integration Testing Patterns (async: false)
**GenServer State Management**:
```elixir  
defmodule TaskApp.TaskStoreTest do
  use ExUnit.Case, async: false
  alias TaskApp.{TaskStore, Task}

  setup do
    {:ok, store_pid} = TaskStore.start_link(name: :test_store)
    %{store_pid: store_pid}
  end
  
  test "concurrent task operations", %{store_pid: store_pid} do
    # Test concurrent access patterns
  end
end
```

**Key Characteristics**:
- GenServer process lifecycle management
- Concurrent operation testing with race condition prevention
- State consistency validation across operations
- Process cleanup in setup/teardown

### 3. LiveView Testing Patterns (async: true)
**Real-time Component Testing**:
```elixir
defmodule TaskAppWeb.TaskLive.ThemeToggleTest do  
  use TaskAppWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "handles theme toggle event", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    
    assert view.assigns.dark_mode == false
    html = render_click(view, "toggle_theme", %{})
    assert view.assigns.dark_mode == true
  end
end
```

**Key Characteristics**:
- Real WebSocket connection simulation
- Component state management validation
- Event handling and rendering verification
- Interactive user flow testing

### 4. Load Testing Patterns (@load_test tag, async: false)
**High-Concurrency Performance Validation**:
```elixir
@tag :load_test
@tag timeout: 60_000
test "handles high concurrent task creation" do
  concurrent_processes = 50
  tasks_per_process = 100
  
  Task.async_stream(1..concurrent_processes, fn process_id ->
    # Create tasks concurrently
  end, max_concurrency: concurrent_processes)
end
```

**Key Characteristics**:
- Performance threshold validation
- Memory stability monitoring  
- Process recovery testing
- Throughput measurement and reporting

### 5. Property-Based Testing Patterns
**StreamData Edge Case Discovery**:
```elixir
use ExUnitProperties

property "task validation handles all input types" do
  check all input <- term() do
    case Task.new(input) do
      {:ok, task} -> assert is_struct(task, Task)
      {:error, _reason} -> assert true
    end
  end
end
```

## Testing Strategy by Component

### Core Domain Testing (lib/task_app/)
**Coverage Target**: >90%

**Focus Areas**:
- Task entity validation and business rules
- Input sanitization and error handling
- Domain logic purity and deterministic behavior
- Edge case handling with property-based testing

**Test Commands**:
```bash
mix test test/task_app/ --exclude load_test  # Unit tests only
mix test test/task_app/task_validation_test.exs  # Specific validation testing
```

### Web Layer Testing (lib/task_app_web/)  
**Coverage Target**: >85%

**Focus Areas**:
- LiveView component lifecycle and state management
- WebSocket communication and real-time updates
- User interaction flows and error boundaries
- Component rendering and event handling

**Test Commands**:
```bash
mix test test/task_app_web/  # All web layer tests
mix test test/task_app_web/live/  # LiveView component tests
```

### GenServer State Management Testing
**Coverage Target**: >95%

**Focus Areas**:
- Concurrent access and race condition prevention
- Process supervision and recovery
- State consistency across operations
- Memory management and cleanup

**Test Commands**:
```bash
mix test test/task_app/task_store_test.exs --exclude load_test  # Integration tests
mix test --only load_test --timeout 60000  # Performance validation
```

## Performance Testing and Metrics

### Load Testing Configuration
**Performance Thresholds**:
- **Task Creation**: <10ms average response time
- **Concurrent Operations**: >100 operations/second throughput  
- **Memory Stability**: <10x growth under sustained load
- **Process Recovery**: <5 seconds for full restoration

**Load Test Scenarios**:
1. **High-Concurrency Creation**: 50 processes × 100 tasks each
2. **Mixed Operations**: Create/read/update/delete with realistic distributions
3. **Memory Stability**: Sustained operations with garbage collection monitoring
4. **Recovery Testing**: Process crash simulation and restart validation

### Coverage Analysis and Reporting
**Coverage Commands**:
```bash
mix test --cover                    # Run with basic coverage
mix coveralls.html                  # Generate detailed HTML report  
mix coveralls.detail               # Terminal coverage breakdown
```

**Coverage Quality Gates**:
- Overall project coverage >80%
- Core domain logic >90%
- Critical path coverage >95%
- New feature coverage >85%

## Common Testing Issues and Solutions

### 1. LiveView Testing Issues
**Problem**: WebSocket connection timeouts in test environment
**Solution**: Proper connection setup with Phoenix.ConnTest and adequate timeouts

**Problem**: State desynchronization between client and server
**Solution**: Explicit state assertions and proper event sequencing in tests

**Problem**: Component rendering issues with dynamic content
**Solution**: Use Floki for HTML parsing and element verification

### 2. GenServer Testing Issues  
**Problem**: Race conditions in concurrent tests
**Solution**: Proper process synchronization and deterministic test ordering

**Problem**: Process cleanup between tests
**Solution**: Comprehensive setup/teardown with process monitoring

**Problem**: Memory leaks in long-running tests
**Solution**: Explicit garbage collection and memory monitoring

### 3. Performance Testing Issues
**Problem**: Inconsistent load test results
**Solution**: Statistical analysis with multiple runs and confidence intervals

**Problem**: Resource contention in CI environment
**Solution**: Adaptive thresholds and environment-specific configuration

**Problem**: Memory profiling accuracy
**Solution**: Process isolation and explicit garbage collection timing

## Test Development Workflow

### Development Testing (Fast Feedback)
```bash
mix test.watch --exclude load_test     # Watch mode for development
mix test --stale                       # Run tests for changed files only
mix test test/specific_test.exs        # Focused testing
```

### Quality Validation (Pre-commit)
```bash
mix format --check-formatted           # Code formatting validation
mix credo --strict                     # Static analysis
mix test --cover                       # Full test suite with coverage
mix dialyzer                          # Type analysis (CI only)
```

### Performance Validation (CI/CD)
```bash
mix test --only load_test --timeout 60000  # Load testing
mix coveralls.html                          # Coverage reporting
mix quality                                 # Combined quality checks
```

### Production Validation (Release)
```bash
mix test --include integration              # Full integration tests
mix test --include load_test               # Performance regression testing
mix coveralls.post --token $COVERAGE_TOKEN # Coverage tracking
```

## Integration with Development Workflow

### Pre-commit Hooks
- Format validation with `mix format --check-formatted`
- Quick unit test execution `mix test --exclude load_test`
- Static analysis with `mix credo --strict`

### CI/CD Pipeline Integration
- Multi-stage testing: unit → integration → load → coverage
- Performance regression detection with baseline comparisons
- Automated coverage reporting and trend analysis
- Security vulnerability scanning with dependency audits

### Code Review Integration  
- Coverage diff analysis for pull requests
- Performance impact assessment for changes
- Test quality metrics and flaky test detection
- Documentation coverage validation

This testing context provides comprehensive guidance for Phoenix LiveView testing with ExUnit, ensuring high-quality, performant, and maintainable test suites for the TaskApp project.