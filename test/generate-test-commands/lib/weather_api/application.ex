defmodule WeatherApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WeatherApiWeb.Telemetry,
      # Start the Ecto repository
      WeatherApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: WeatherApi.PubSub},
      # Start Finch for HTTP requests
      {Finch, name: WeatherApi.Finch},
      # Start the cache
      {Cachex, name: :weather_cache},
      # Start weather data collectors
      WeatherApi.Weather.DataCollector,
      # Start the Endpoint (http/https)
      WeatherApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WeatherApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WeatherApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end