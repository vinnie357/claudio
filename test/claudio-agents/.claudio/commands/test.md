# Test Command

## Command
`/claudio:test`

## Purpose
Executes comprehensive testing strategy for Phoenix LiveView applications with ExUnit, LiveView testing, and coverage reporting.

## Usage
```
/claudio:test [test_path] [--coverage] [--watch] [--verbose]
```

## Arguments
- `test_path`: Specific test file or directory to run
- `--coverage`: Run tests with ExCoveralls coverage reporting
- `--watch`: Run tests in watch mode for continuous testing
- `--verbose`: Enable verbose test output with detailed reporting

## Agent Reference
Uses `claudio:test-runner-agent subagent` for test execution coordination

## Phoenix LiveView Test Integration

### ExUnit Configuration
```elixir
# Optimized for Phoenix LiveView testing
- ExUnit.start([capture_log: true])
- Phoenix.Ecto.SQL.Sandbox.mode(TaskApp.Repo, :manual)
- LiveView test helpers and assertions
- Custom test utilities for TaskApp components
```

### Test Categories
- **Unit Tests**: Individual module and function testing
- **Integration Tests**: Phoenix controller and LiveView integration
- **Component Tests**: Phoenix.Component and LiveView component testing
- **Feature Tests**: End-to-end functionality testing with LiveView sessions

### Coverage Configuration
```elixir
# ExCoveralls setup for comprehensive coverage
- HTML coverage reports in cover/ directory
- Minimum coverage thresholds for Phoenix applications
- Module-level coverage tracking
- Integration with CI/CD pipeline
```

## Phoenix-Specific Test Patterns

### LiveView Testing
```elixir
# LiveView test helpers
import Phoenix.LiveViewTest

test "LiveView component interaction" do
  {:ok, view, html} = live(conn, "/path")
  assert html =~ "Expected content"
  
  # Test LiveView events
  assert view |> element("button") |> render_click() =~ "Updated content"
end
```

### Component Testing
```elixir
# Phoenix.Component testing
import TaskAppWeb.CoreComponents

test "custom component rendering" do
  assigns = %{message: "Test message"}
  html = rendered_to_string(~H"<.custom_component message={@message} />")
  assert html =~ "Test message"
end
```

### Database Testing
```elixir
# Ecto.Sandbox integration
setup :verify_on_exit!

setup do
  :ok = Ecto.Adapters.SQL.Sandbox.checkout(TaskApp.Repo)
end
```

## Mix Integration

### Test Aliases
```elixir
# Enhanced Mix aliases for testing
"test": "test --trace",
"test.coverage": "coveralls.html",
"test.watch": "test.watch --stale",
"test.ci": ["format --check-formatted", "credo --strict", "test"]
```

### Quality Integration
- **Credo**: Code quality checks before test execution
- **Dialyxir**: Static analysis integration with testing workflow
- **Format Check**: Ensures code formatting standards in CI

## Output Structure
```
test_results/
├── coverage/
│   ├── coverage.html        # HTML coverage report
│   ├── coverage.xml         # XML coverage for CI
│   └── coverage.json        # JSON coverage data
├── reports/
│   ├── junit.xml           # JUnit format for CI integration
│   └── detailed_results.txt # Detailed test output
└── metrics/
    ├── test_timing.json    # Test performance metrics
    └── coverage_trends.json # Coverage tracking over time
```

## Integration Benefits
- **Phoenix Ecosystem**: Native integration with Phoenix and LiveView testing
- **Development Workflow**: Seamless integration with existing Mix aliases
- **Quality Assurance**: Comprehensive testing with coverage and quality metrics
- **CI/CD Ready**: Formats and reporting suitable for continuous integration