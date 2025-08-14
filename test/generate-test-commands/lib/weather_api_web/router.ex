defmodule WeatherApiWeb.Router do
  use WeatherApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :put_secure_browser_headers
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WeatherApiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", WeatherApiWeb do
    pipe_through :browser

    get "/", PageController, :home
    live "/dashboard", WeatherLive.Dashboard, :index
  end

  scope "/api", WeatherApiWeb do
    pipe_through :api

    scope "/weather" do
      get "/current", WeatherController, :current
      get "/forecast", WeatherController, :forecast
      get "/hourly", WeatherController, :hourly
      get "/historical", WeatherController, :historical
      get "/alerts", WeatherController, :alerts
    end

    scope "/locations" do
      get "/search", LocationController, :search
      get "/nearby", LocationController, :nearby
      post "/bulk", LocationController, :bulk
    end

    scope "/analytics" do
      get "/trends", AnalyticsController, :trends
      get "/climate", AnalyticsController, :climate
      get "/extremes", AnalyticsController, :extremes
    end
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:weather_api, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: WeatherApiWeb.Telemetry
    end
  end
end