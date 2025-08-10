defmodule TaskAppWeb.Router do
  use TaskAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TaskAppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TaskAppWeb do
    pipe_through :browser

    live "/", TaskLive.Index, :index
  end

  scope "/api", TaskAppWeb do
    pipe_through :api

    get "/tasks", TaskController, :index
    post "/tasks", TaskController, :create
    get "/tasks/:id", TaskController, :show
    put "/tasks/:id/complete", TaskController, :complete
    delete "/tasks/:id", TaskController, :delete
    get "/stats", TaskController, :stats
  end

  if Application.compile_env(:task_app, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TaskAppWeb.Telemetry
    end
  end
end