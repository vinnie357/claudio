# TaskApp - Phoenix LiveView Task Management System

A modern, real-time task management application demonstrating Phoenix LiveView best practices with comprehensive testing, robust state management, and responsive design.

## Features

- Real-time task management with Phoenix LiveView
- Interactive task creation, completion, and deletion
- Live statistics dashboard with total, completed, and pending counts
- Complete REST API for external integrations
- Dark mode support with persistent theme preferences
- Comprehensive input validation and error handling
- In-memory state management using GenServer
- Responsive design optimized for mobile and desktop
- Extensive test coverage including load and performance testing

## Quick Start

### Prerequisites

- [Elixir](https://elixir-lang.org/install.html) 1.14 or higher
- [Erlang/OTP](https://www.erlang.org/downloads) 25 or higher
- [Node.js](https://nodejs.org/) (for asset compilation)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd claudio-agents

# Install Elixir dependencies
mix deps.get

# Install and setup assets
mix assets.setup

# Build assets
mix assets.build

# Start the Phoenix server
mix phx.server
```

### Verify Installation

Once started, visit:
- **Main Application**: http://localhost:4000
- **Live Dashboard**: http://localhost:4000/dev/dashboard (development only)

You should see the task management interface ready for interaction.

## Project Structure

```
lib/
├── task_app/                    # Core business logic
│   ├── application.ex          # Application supervisor tree
│   ├── task.ex                # Task entity with validation
│   └── task_store.ex          # GenServer-based state store
│
├── task_app_web/               # Web layer
│   ├── controllers/
│   │   └── task_controller.ex  # REST API endpoints
│   ├── live/
│   │   └── task_live/
│   │       └── index.ex        # Main LiveView interface
│   ├── components/
│   │   ├── core_components.ex  # Reusable UI components
│   │   └── layouts.ex         # Page layouts
│   └── router.ex             # Route definitions
│
test/                          # Comprehensive test suite
├── task_app/                  # Business logic tests
├── task_app_web/             # Web layer tests
├── load_tests/               # Performance & concurrency tests
└── support/                  # Test helpers and factories
```

## Key Features

### Real-Time Task Management
Interactive task creation, completion, and deletion with instant UI updates using Phoenix LiveView's real-time capabilities.

```elixir
# Example task operations
{:ok, task} = TaskStore.add_task("Learn Phoenix LiveView")
{:ok, completed_task} = TaskStore.complete_task(task.id)
:ok = TaskStore.delete_task(task.id)
```

### Live Statistics Dashboard
Real-time statistics showing total, completed, and pending tasks with automatic updates as tasks change state.

### Dark Mode Support
User-friendly theme toggle with persistent preferences and smooth transitions between light and dark modes.

### Robust Validation
Comprehensive input validation with user-friendly error messages:

```elixir
# Task validation examples
Task.validate_title("")              # {:error, :title_empty}
Task.validate_title("a" * 101)       # {:error, :title_too_long}
Task.validate_title("Valid task")    # :ok
```

## API Reference

### REST API Endpoints

#### Tasks
```bash
# List all tasks
GET /api/tasks
Response: {"tasks": [{"id": "abc123", "title": "Task", "completed": false}]}

# Create a new task
POST /api/tasks
Body: {"task": {"title": "New task"}}
Response: {"task": {"id": "def456", "title": "New task", "completed": false}}

# Get specific task
GET /api/tasks/:id
Response: {"task": {"id": "abc123", "title": "Task", "completed": false}}

# Mark task as complete
PUT /api/tasks/:id/complete
Response: {"task": {"id": "abc123", "title": "Task", "completed": true}}

# Delete task
DELETE /api/tasks/:id
Response: 204 No Content
```

#### Statistics
```bash
# Get task statistics
GET /api/stats
Response: {"stats": {"total": 5, "completed": 2, "pending": 3}}
```

### API Usage Examples

```bash
# Create and manage tasks via API
curl -X POST http://localhost:4000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"task": {"title": "Learn Phoenix LiveView"}}'

# Check task statistics
curl http://localhost:4000/api/stats

# Complete a task
TASK_ID="your_task_id_here"
curl -X PUT http://localhost:4000/api/tasks/$TASK_ID/complete
```

## Development

### Setup Development Environment

```bash
# Install development dependencies
mix deps.get

# Setup and compile assets
mix assets.setup

# Run in development mode
mix phx.server

# Run with interactive shell
iex -S mix phx.server
```

### Running Tests

The project includes a comprehensive testing strategy:

```bash
# Run all tests
mix test

# Run with coverage report
mix test --cover

# Generate detailed HTML coverage report
mix coveralls.html

# Run specific test categories
mix test test/task_app/           # Unit tests
mix test test/task_app_web/       # Web layer tests
mix test test/load_tests/         # Load and performance tests

# Run tests in watch mode
mix test.watch
```

#### Test Categories
- **Unit Tests**: Core business logic validation
- **Integration Tests**: GenServer state management
- **LiveView Tests**: Real-time UI interactions
- **API Tests**: REST endpoint functionality
- **Load Tests**: High concurrency performance
- **Property Tests**: Edge case validation

### Code Quality

```bash
# Format code
mix format

# Run static analysis
mix credo --strict

# Type checking with Dialyzer
mix dialyzer

# Run all quality checks
mix quality
```

### Using the Makefile

The project includes a comprehensive Makefile for development tasks:

```bash
# View all available commands
make help

# Setup development environment
make setup

# Run different test categories
make test-unit          # Unit tests only
make test-integration   # Integration tests
make test-web          # Web layer tests
make test-coverage     # Generate coverage report

# Code quality checks
make quality           # Run all quality checks
make format           # Check code formatting
make credo            # Static analysis
make dialyzer         # Type checking

# CI pipeline simulation
make ci               # Full CI pipeline locally
```

## Configuration

### Environment Variables
The application uses standard Phoenix configuration patterns. Key settings in `config/`:

- `config.exs`: Base application configuration
- `dev.exs`: Development-specific settings
- `test.exs`: Test environment configuration

### Development Configuration
```elixir
# config/dev.exs
config :task_app, TaskAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:task_app, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:task_app, ~w(--watch)]}
  ]
```

## Architecture Decisions

### State Management Choice
**GenServer vs Database**: The project uses GenServer for demonstration and simplicity. Production applications typically use:
- **Ecto + PostgreSQL** for persistent data
- **GenServer** for caching and real-time state  
- **Phoenix PubSub** for cross-process communication

### LiveView vs SPA
**Server-side rendering benefits**:
- Reduced JavaScript complexity
- Real-time updates via WebSocket
- SEO-friendly server-rendered HTML
- Leverages Elixir/OTP ecosystem patterns

### API Design
**REST + LiveView hybrid approach**:
- LiveView for primary user interface
- REST API for external integrations
- Shared data layer between both interfaces

## Deployment

### Development Environment
```bash
# Development server with auto-reloading
mix phx.server

# Production simulation
MIX_ENV=prod mix phx.server
```

### Production Considerations
- **Database migration** from GenServer to Ecto/PostgreSQL
- **Environment configuration** for secrets and endpoints
- **Asset compilation** and CDN integration
- **SSL certificate** configuration
- **Load balancing** and clustering for scale

## Contributing

We welcome contributions\! This project serves as a reference implementation for Phoenix LiveView patterns.

### Development Workflow

1. Fork and clone the repository
2. Set up development environment: `mix deps.get && mix assets.setup`
3. Run tests to ensure everything works: `mix test`
4. Create a feature branch: `git checkout -b feature/amazing-feature`
5. Make changes with comprehensive tests
6. Ensure all tests pass: `mix test`
7. Check code quality: `mix quality`
8. Commit changes: `git commit -m 'Add amazing feature'`
9. Push to your fork and create a Pull Request

### Code Standards
- Follow Elixir style guide and use `mix format`
- Write comprehensive tests for new functionality
- Update documentation for API or behavior changes
- Use descriptive commit messages following conventional commits

### What to Contribute
- Bug fixes with reproduction tests
- Feature enhancements with comprehensive testing
- Documentation improvements and examples
- Performance optimizations with benchmarks
- Testing improvements and edge case coverage

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
1. **Light Load**: 100 tasks, 50 concurrent operations
2. **Medium Load**: 1,000 tasks, 200 concurrent operations  
3. **Heavy Load**: 5,000 tasks, 500 concurrent operations
4. **Stress Test**: 10,000 tasks, 1,000 concurrent operations

## Troubleshooting

### Common Issues

**Port Already in Use**
```bash
# Change port in config/dev.exs or use different port
PORT=4001 mix phx.server
```

**Asset Compilation Errors**
```bash
# Reinstall Node dependencies
rm -rf assets/node_modules && mix assets.setup
```

**LiveView Connection Issues**
- Check browser developer console for WebSocket errors
- Verify network connectivity and firewall settings
- Ensure Phoenix LiveReload is properly configured

**GenServer State Issues**
- Monitor application logs for crash reports
- Use Observer to inspect process state: `:observer.start()`
- Check supervision tree health in LiveDashboard

## Documentation

- [Phoenix Framework](https://phoenixframework.org/) - Framework documentation
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/) - LiveView guide
- [Elixir Lang](https://elixir-lang.org/) - Language documentation
- [TESTING.md](../TESTING.md) - Comprehensive testing guide

## Support

- **Issues**: Report bugs in the project repository
- **Documentation**: Check official Phoenix and LiveView guides
- **Community**: Ask questions on Elixir Forum or Discord

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- **Phoenix Framework** team for the excellent web framework
- **Elixir Core Team** for the robust language platform
- **Tailwind CSS** for utility-first styling approach  
- **LiveView Contributors** for real-time web innovation

---

**TaskApp** - Demonstrating modern Elixir/Phoenix development patterns with real-time interfaces and comprehensive testing.
EOF < /dev/null