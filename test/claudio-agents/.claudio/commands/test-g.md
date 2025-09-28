# Test Generation Command

## Command
`/claudio:test-g`

## Purpose
Generates comprehensive test suites for Phoenix LiveView applications based on existing code structure and component analysis.

## Usage
```
/claudio:test-g [target] [--type] [--coverage] [--integration]
```

## Arguments
- `target`: Target module, component, or feature to generate tests for
- `--type`: Test type ("unit", "integration", "component", "feature", "all")
- `--coverage`: Generate tests optimized for maximum coverage
- `--integration`: Focus on integration and LiveView interaction tests

## Agent Reference
Uses `claudio:test-generator-agent subagent` to analyze code and generate comprehensive test suites

## Phoenix LiveView Test Generation

### Code Analysis
```elixir
# Analyzes existing Phoenix modules for test generation
- Phoenix controllers and their actions
- LiveView modules and event handlers
- Phoenix.Component modules and render functions
- Ecto schemas and changesets
- Business logic modules and functions
```

### Test Template Generation
```elixir
# Generates Phoenix-specific test templates
- ExUnit test modules with proper setup
- LiveView test cases with live/3 helpers
- Component test cases with Phoenix.Component testing
- Database test cases with Ecto.Sandbox
- Mock and factory setup with ExMachina patterns
```

### Generated Test Categories

#### Unit Tests
```elixir
# Generated for individual modules
defmodule TaskAppWeb.ComponentsTest do
  use ExUnit.Case, async: true
  import TaskAppWeb.CoreComponents
  
  describe "custom_component/1" do
    test "renders with default attributes" do
      # Generated test implementation
    end
    
    test "handles edge cases and error states" do
      # Generated test implementation  
    end
  end
end
```

#### LiveView Tests
```elixir
# Generated for LiveView modules
defmodule TaskAppWeb.LiveViewTest do
  use TaskAppWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  
  describe "live view functionality" do
    test "initial render displays correct content", %{conn: conn} do
      # Generated LiveView test implementation
    end
    
    test "handles user interactions correctly", %{conn: conn} do
      # Generated event testing implementation
    end
  end
end
```

#### Integration Tests
```elixir
# Generated for feature workflows
defmodule TaskAppWeb.IntegrationTest do
  use TaskAppWeb.ConnCase, async: false
  use Oban.Testing, repo: TaskApp.Repo
  
  describe "complete user workflows" do
    test "user can complete full task workflow", %{conn: conn} do
      # Generated end-to-end test implementation
    end
  end
end
```

## Test Generation Strategy

### Coverage Optimization
- **Function Coverage**: Tests for all public functions and edge cases
- **Branch Coverage**: Tests for all conditional logic paths
- **Integration Coverage**: Tests for component interaction patterns
- **Error Coverage**: Tests for error handling and edge cases

### Phoenix Patterns
```elixir
# Generated tests follow Phoenix testing best practices
- Proper use of Phoenix.ConnTest for controllers
- LiveView testing with Phoenix.LiveViewTest
- Component testing with render helpers
- Database testing with Ecto.Sandbox
- Authentication testing with Guardian/Pow patterns
```

### Quality Integration
```elixir
# Generated tests include quality checks
- Credo compliance in generated test code
- Dialyxir type checking compatibility
- ExCoveralls coverage tracking
- Property-based testing with StreamData where applicable
```

## Output Structure
```
test/
├── unit/
│   ├── components_test.exs     # Generated component tests
│   ├── business_logic_test.exs # Generated business logic tests
│   └── utilities_test.exs      # Generated utility function tests
├── integration/
│   ├── liveview_test.exs       # Generated LiveView integration tests
│   ├── controllers_test.exs    # Generated controller integration tests
│   └── workflows_test.exs      # Generated workflow tests
├── support/
│   ├── test_helpers.ex         # Generated test helper functions
│   ├── factories.ex           # Generated ExMachina factories
│   └── fixtures.ex            # Generated test fixtures
└── generated_test_report.md    # Test generation summary
```

## Integration Benefits
- **Phoenix Ecosystem**: Tests generated specifically for Phoenix LiveView patterns
- **Development Acceleration**: Comprehensive test suite foundation generated automatically
- **Quality Assurance**: Tests include coverage optimization and quality standards
- **Maintenance Ready**: Generated tests follow maintainable patterns and documentation standards