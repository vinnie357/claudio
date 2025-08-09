import Config

# Configure the endpoint for testing
config :task_app, TaskAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "task_app_test_secret_key_base_for_testing_only_do_not_use_in_production",
  server: false

# Reduce log level during tests
config :logger, level: :warning

# Configure Phoenix for testing
config :phoenix, :plug_init_mode, :runtime

# Configure ExUnit for better test output
config :ex_unit,
  capture_log: true,
  colors: [enabled: true],
  formatters: [ExUnit.CLIFormatter]

# Configure test coverage
config :excoveralls,
  test_coverage: [minimum_coverage: 80],
  skip_files: [
    "test/",
    "deps/"
  ]

# Configure performance test thresholds
config :task_app, :performance_thresholds,
  task_creation_ms: 10,
  task_retrieval_ms: 5,
  stats_calculation_ms: 50,
  concurrent_operations_per_second: 100

# Configure load test parameters
config :task_app, :load_test_config,
  max_concurrent_processes: 100,
  max_tasks_per_test: 10_000,
  operation_timeout_ms: 10_000,
  memory_growth_limit: 5.0

# Test-specific configurations
if System.get_env("CI") do
  # CI-specific settings
  config :task_app, :test_mode, :ci
  config :logger, level: :error
else
  # Local development test settings
  config :task_app, :test_mode, :local
end