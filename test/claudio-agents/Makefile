# TaskApp Testing Makefile
# Provides convenient commands for running different types of tests

.PHONY: help test test-unit test-integration test-web test-property test-load test-watch test-coverage clean setup quality ci

# Default target
help:
	@echo "TaskApp Testing Commands"
	@echo "======================="
	@echo ""
	@echo "Setup:"
	@echo "  setup           Install dependencies and prepare environment"
	@echo "  clean           Clean build artifacts and dependencies"
	@echo ""
	@echo "Testing:"
	@echo "  test            Run all tests"
	@echo "  test-unit       Run unit tests only"
	@echo "  test-integration Run integration tests"
	@echo "  test-web        Run web layer tests (LiveView + API)"
	@echo "  test-property   Run property-based tests"
	@echo "  test-load       Run load tests (resource intensive)"
	@echo "  test-watch      Run tests in watch mode"
	@echo "  test-coverage   Generate HTML coverage report"
	@echo ""
	@echo "Quality:"
	@echo "  quality         Run all quality checks (format, credo, dialyzer)"
	@echo "  format          Check code formatting"
	@echo "  credo           Run Credo code analysis"
	@echo "  dialyzer        Run Dialyzer static analysis"
	@echo ""
	@echo "CI/CD:"
	@echo "  ci              Run full CI pipeline locally"
	@echo ""

# Setup and cleanup
setup:
	@echo "🚀 Setting up TaskApp development environment..."
	mix deps.get
	mix deps.compile
	mix assets.setup
	@echo "✅ Setup complete!"

clean:
	@echo "🧹 Cleaning build artifacts..."
	mix deps.clean --all
	mix clean
	rm -rf _build deps priv/plts cover
	@echo "✅ Cleanup complete!"

# Core testing commands
test:
	@echo "🧪 Running all tests..."
	mix test
	@echo "✅ All tests completed!"

test-unit:
	@echo "🔬 Running unit tests..."
	mix test test/task_app/task_test.exs test/task_app/task_validation_test.exs
	@echo "✅ Unit tests completed!"

test-integration:
	@echo "🔗 Running integration tests..."
	mix test test/task_app/task_store_test.exs test/task_app/task_store_integration_test.exs
	@echo "✅ Integration tests completed!"

test-web:
	@echo "🌐 Running web layer tests..."
	mix test test/task_app_web/
	@echo "✅ Web tests completed!"

test-property:
	@echo "🎲 Running property-based tests..."
	mix test test/property_tests/ --only property_test
	@echo "✅ Property tests completed!"

test-load:
	@echo "⚡ Running load tests (this may take several minutes)..."
	@echo "🚨 Warning: Load tests are resource intensive!"
	@read -p "Continue? [y/N] " -n 1 -r; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		echo ""; \
		mix test test/load_tests/ --only load_test; \
		echo "✅ Load tests completed!"; \
	else \
		echo ""; \
		echo "❌ Load tests cancelled."; \
	fi

test-watch:
	@echo "👀 Starting test watcher..."
	@echo "Tests will re-run automatically when files change."
	@echo "Press Ctrl+C to stop."
	mix test.watch

test-coverage:
	@echo "📊 Generating test coverage report..."
	mix test --cover
	mix coveralls.html
	@echo "✅ Coverage report generated at cover/excoveralls.html"
	@command -v open >/dev/null 2>&1 && open cover/excoveralls.html || echo "Open cover/excoveralls.html in your browser to view the report"

# Quality assurance
quality:
	@echo "🔍 Running all quality checks..."
	$(MAKE) format
	$(MAKE) credo
	$(MAKE) dialyzer
	@echo "✅ All quality checks completed!"

format:
	@echo "📝 Checking code formatting..."
	mix format --check-formatted
	@echo "✅ Code formatting check completed!"

format-fix:
	@echo "📝 Fixing code formatting..."
	mix format
	@echo "✅ Code formatting fixed!"

credo:
	@echo "🔍 Running Credo code analysis..."
	mix credo --strict
	@echo "✅ Credo analysis completed!"

dialyzer:
	@echo "🔬 Running Dialyzer static analysis..."
	mix dialyzer
	@echo "✅ Dialyzer analysis completed!"

# Performance and benchmarking
benchmark:
	@echo "⚡ Running performance benchmarks..."
	mix test --only performance --trace
	@echo "✅ Performance benchmarks completed!"

memory-test:
	@echo "💾 Running memory usage tests..."
	mix test test/load_tests/task_store_load_test.exs --only memory
	@echo "✅ Memory tests completed!"

# CI/CD pipeline
ci:
	@echo "🚀 Running full CI pipeline locally..."
	@echo "This will run formatting, dependencies check, code analysis, and all tests"
	mix format --check-formatted
	mix deps.unlock --check-unused
	mix credo --strict
	mix test --cover
	@echo "✅ CI pipeline completed successfully!"

# Development helpers
deps-audit:
	@echo "🔐 Auditing dependencies for security issues..."
	mix deps.audit
	@echo "✅ Dependency audit completed!"

deps-update:
	@echo "📦 Updating dependencies..."
	mix deps.update --all
	@echo "✅ Dependencies updated!"

# Quick test commands for specific scenarios
test-quick:
	@echo "⚡ Running quick test suite (unit + integration)..."
	mix test test/task_app/ --exclude load_test --exclude property_test
	@echo "✅ Quick tests completed!"

test-full:
	@echo "🚀 Running full test suite (excluding load tests)..."
	mix test --exclude load_test
	@echo "✅ Full test suite completed!"

test-specific:
	@echo "🎯 Running specific test file..."
	@read -p "Enter test file path: " test_file; \
	mix test $$test_file
	@echo "✅ Specific test completed!"

# Environment setup
dev-setup:
	@echo "🛠️  Setting up development environment..."
	$(MAKE) setup
	mix compile
	@echo "✅ Development environment ready!"

test-env-check:
	@echo "🔍 Checking test environment..."
	@echo "Elixir version: $$(elixir --version | head -n1)"
	@echo "Mix environment: $$MIX_ENV"
	@echo "OTP version: $$(erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell)"
	mix deps.get --only test
	@echo "✅ Test environment check completed!"

# Debugging helpers
test-debug:
	@echo "🐛 Running tests in debug mode..."
	@read -p "Enter test file path: " test_file; \
	mix test $$test_file --trace --max-failures 1
	@echo "✅ Debug test completed!"

test-failed:
	@echo "🔄 Re-running failed tests from last run..."
	mix test --failed
	@echo "✅ Failed tests re-run completed!"

# Documentation
test-docs:
	@echo "📚 Generating test documentation..."
	@echo "Opening TESTING.md with system default application..."
	@command -v open >/dev/null 2>&1 && open TESTING.md || echo "Please open TESTING.md manually to view test documentation"

# Cleanup specific to testing
test-clean:
	@echo "🧹 Cleaning test artifacts..."
	rm -rf cover/ _build/test/
	@echo "✅ Test cleanup completed!"