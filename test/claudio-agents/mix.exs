defmodule TaskApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :task_app,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "test.watch": :test
      ]
    ]
  end

  def application do
    [
      mod: {TaskApp.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.7.10"},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.20.2"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.8.3"},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2"},
      {:dns_cluster, "~> 0.1.1"},
      {:bandit, "~> 1.2"},
      
      # Testing dependencies
      {:mock, "~> 0.3.0", only: :test},
      {:excoveralls, "~> 0.18", only: :test},
      {:ex_machina, "~> 2.7", only: :test},
      {:stream_data, "~> 0.6", only: :test},
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind task_app", "esbuild task_app"],
      "assets.deploy": [
        "tailwind task_app --minify",
        "esbuild task_app --minify",
        "phx.digest"
      ],
      test: ["test"],
      "test.watch": ["test.watch"],
      "test.coverage": ["coveralls.html"],
      quality: ["format", "credo --strict", "dialyzer"],
      ci: ["format --check-formatted", "deps.unlock --check-unused", "credo --strict", "test --cover"]
    ]
  end
end