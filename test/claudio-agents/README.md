# TaskApp - Phoenix LiveView Task Management System

A modern, real-time task management application built with Phoenix LiveView, demonstrating best practices for Elixir/Phoenix development with reactive user interfaces and robust state management.

## Features

- Real-time task management with Phoenix LiveView
- Interactive task creation, completion, and deletion
- Live statistics dashboard (total, completed, pending tasks)
- RESTful API for external integrations
- Comprehensive input validation and error handling
- Dark mode support with Tailwind CSS
- In-memory state management using GenServer
- Responsive design for mobile and desktop

## Technology Stack

### Backend
- **Phoenix 1.7.10** - Modern web framework for Elixir
- **Phoenix LiveView 0.20.2** - Real-time, server-rendered interfaces
- **GenServer** - Fault-tolerant state management
- **Elixir 1.14+** - Functional, concurrent programming language

### Frontend
- **Phoenix LiveView** - Server-side rendered reactive components
- **Tailwind CSS** - Utility-first CSS framework
- **Heroicons** - Beautiful SVG icons
- **Alpine.js** - Minimal JavaScript framework (implicit through LiveView)

### Development Tools
- **ExUnit** - Built-in testing framework
- **Phoenix Live Reload** - Hot code reloading
- **Esbuild** - Fast JavaScript bundler
- **Mix** - Build tool and task runner

## Quick Start

### Prerequisites

**Required:**
- [Elixir](https://elixir-lang.org/install.html) 1.14 or higher
- [Erlang/OTP](https://www.erlang.org/downloads) 25 or higher
- [Node.js](https://nodejs.org/) (for asset compilation)

**Recommended:**
- [Phoenix](https://hexdocs.pm/phoenix/installation.html) framework familiarity
- Basic understanding of Elixir/OTP principles

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd claudio-agents

# Install Elixir dependencies
mix deps.get

# Install Node.js dependencies and setup assets
mix assets.setup

# Build assets
mix assets.build

# Start the Phoenix server
mix phx.server
```

### Verify Installation

Once started, visit:
- **Web Interface**: http://localhost:4000
- **Live Dashboard**: http://localhost:4000/dev/dashboard (development only)

You should see the task management interface with an empty task list ready for interaction.

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
│   ├── endpoint.ex            # HTTP endpoint configuration
│   └── router.ex             # Route definitions
│
config/                        # Configuration files
├── config.exs                 # Base configuration
├── dev.exs                   # Development settings
└── test.exs                  # Test environment

test/                          # Test suite
├── task_app/
│   ├── task_test.exs         # Task entity tests
│   ├── task_store_test.exs   # GenServer tests
│   └── task_validation_test.exs # Validation tests
└── support/                  # Test helpers

assets/                       # Frontend assets
├── css/                     # Stylesheets
├── js/                      # JavaScript files
└── vendor/                  # Third-party assets
```

## Development Workflow

### Running the Application

```bash
# Development server with live reloading
mix phx.server

# Interactive Elixir shell with application loaded
iex -S mix phx.server

# Production build
MIX_ENV=prod mix phx.server
```

### Asset Management

```bash
# Watch and build assets during development
mix assets.setup
mix assets.build

# Deploy optimized assets for production
mix assets.deploy
```

### Code Quality

```bash
# Format code
mix format

# Check for compilation warnings
mix compile --warnings-as-errors

# Static code analysis (if Credo is added)
mix credo

# Security audit (if Sobelow is added)
mix sobelow
```

## Testing Approach

### Running Tests

```bash
# Run all tests
mix test

# Run tests with coverage report
mix test --cover

# Run specific test file
mix test test/task_app/task_test.exs

# Run tests matching a pattern
mix test --only tag_name

# Run tests in watch mode (with file watching tool)
find . -name "*.ex*" | entr -c mix test
```

### Test Structure

- **Unit Tests**: Core business logic (Task entity, validation)
- **Integration Tests**: GenServer state management (TaskStore)
- **Feature Tests**: LiveView interactions and API endpoints

### Testing Philosophy

The application follows Elixir testing best practices:
- **Fast feedback loops** with concurrent test execution
- **Isolated tests** using process-based state isolation
- **Property-based testing** for validation rules
- **Integration testing** for LiveView and API interactions

## API Documentation

### REST API Endpoints

The application provides a complete REST API for external integrations:

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

### Error Responses

```json
# Validation error (400 Bad Request)
{"error": "title_empty"}

# Not found (404 Not Found)  
{"error": "Task not found"}

# Server error (500 Internal Server Error)
{"error": "Internal server error"}
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

## Planned Enhancements

### Phase 1: Core Features
- [ ] **User Authentication** - Login/registration with Phoenix Auth
- [ ] **Data Persistence** - Ecto integration with PostgreSQL
- [ ] **Task Categories** - Organize tasks by project/category
- [ ] **Due Dates** - Schedule tasks with calendar integration

### Phase 2: Advanced Features  
- [ ] **Multi-user Support** - Shared task lists and collaboration
- [ ] **Real-time Sync** - Cross-device synchronization
- [ ] **Dark Mode Toggle** - User preference persistence
- [ ] **Keyboard Shortcuts** - Power user productivity features

### Phase 3: Integration & Export
- [ ] **API Authentication** - JWT tokens for external access
- [ ] **Webhook Support** - Task event notifications  
- [ ] **Export/Import** - CSV, JSON data exchange
- [ ] **Search & Filter** - Advanced task management

### Phase 4: Performance & Scale
- [ ] **Caching Layer** - Redis for session and state caching
- [ ] **Background Jobs** - Oban for async task processing
- [ ] **Metrics & Monitoring** - Telemetry integration
- [ ] **Load Testing** - Performance benchmarks

## Contributing

We welcome contributions\! This project serves as a reference implementation for Phoenix LiveView patterns.

### Development Setup

1. **Fork and clone** the repository
2. **Install dependencies**: `mix deps.get`
3. **Setup assets**: `mix assets.setup` 
4. **Run tests**: `mix test`
5. **Start server**: `mix phx.server`

### Contribution Guidelines

```bash
# Create a feature branch
git checkout -b feature/amazing-feature

# Make your changes with tests
# Ensure tests pass: mix test
# Format code: mix format

# Commit your changes
git commit -m 'Add amazing feature with comprehensive tests'

# Push to your fork and create a Pull Request
git push origin feature/amazing-feature
```

### Code Standards
- **Follow Elixir style guide** and use `mix format`
- **Write comprehensive tests** for new functionality
- **Update documentation** for API or behavior changes
- **Use descriptive commit messages** following conventional commits

### What to Contribute
- **Bug fixes** with reproduction tests
- **Feature enhancements** from the planned roadmap
- **Documentation improvements** and examples
- **Performance optimizations** with benchmarks
- **Testing improvements** and edge case coverage

## Architecture Decisions

### State Management Choice
**GenServer vs Database**: We chose GenServer for simplicity and demonstration purposes. In production, you'd typically use:
- **Ecto + PostgreSQL** for persistent data
- **GenServer** for caching and real-time state
- **Phoenix PubSub** for cross-process communication

### LiveView vs SPA
**Server-side rendering**: LiveView provides:
- **Reduced JavaScript complexity** - minimal client-side code
- **Real-time updates** - WebSocket-based reactivity  
- **SEO-friendly** - server-rendered HTML
- **Elixir ecosystem integration** - leverage OTP patterns

### API Design
**REST + LiveView hybrid**: 
- **LiveView** for primary user interface
- **REST API** for external integrations and mobile apps
- **Consistent data layer** shared between both interfaces

## Deployment Guide

### Development Environment
```bash
# Development server (auto-reloading)
mix phx.server

# Production simulation
MIX_ENV=prod mix phx.server
```

### Docker Deployment
```dockerfile
# Example Dockerfile structure
FROM elixir:1.15-alpine
# ... Phoenix deployment best practices
EXPOSE 4000
CMD ["mix", "phx.server"]
```

### Production Considerations
- **Database migration** from GenServer to Ecto/PostgreSQL
- **Environment configuration** for secrets and endpoints
- **Asset compilation** and CDN integration
- **Monitoring and logging** setup
- **SSL certificate** configuration
- **Load balancing** and clustering for scale

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
mix assets.setup
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

### Performance Tips
- **Disable debug logs** in production
- **Optimize LiveView updates** by minimizing assigns
- **Use async tests** for better performance
- **Profile with :fprof** or other Elixir tools

## Support and Resources

### Documentation
- [Phoenix Framework](https://phoenixframework.org/) - Framework documentation
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/) - LiveView guide
- [Elixir Lang](https://elixir-lang.org/) - Language documentation
- [OTP Design Principles](https://www.erlang.org/doc/design_principles/users_guide.html) - Architecture patterns

### Community
- [Elixir Forum](https://elixirforum.com/) - Community discussions
- [Phoenix Discord](https://discord.gg/elixir) - Real-time chat
- [ElixirConf](https://elixirconf.com/) - Annual conference
- [Elixir Slack](https://elixir-slackin.herokuapp.com/) - Community chat

### Getting Help
- 📚 **Documentation**: Check official Phoenix and LiveView guides
- 💬 **Community**: Ask questions on Elixir Forum or Discord
- 🐛 **Issues**: Report bugs in the project repository
- 📧 **Direct**: Contact maintainers for urgent issues

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- **Phoenix Framework** team for the excellent web framework
- **Elixir Core Team** for the robust language platform  
- **Tailwind CSS** for the utility-first styling approach
- **LiveView Contributors** for real-time web innovation

---

**TaskApp** - Demonstrating modern Elixir/Phoenix development patterns with real-time interfaces and robust state management.
EOF < /dev/null