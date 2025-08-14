import Config

# General application configuration
config :weather_api,
  ecto_repos: [WeatherApi.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :weather_api, WeatherApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: WeatherApiWeb.ErrorHTML, json: WeatherApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: WeatherApi.PubSub,
  live_view: [signing_salt: "weather_secret"]

# Configure esbuild for assets
config :esbuild,
  version: "0.17.11",
  default: [
    args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind for CSS
config :tailwind,
  version: "3.3.0",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Weather provider API configuration
config :weather_api, :providers,
  openweathermap: [
    api_key: System.get_env("OPENWEATHERMAP_API_KEY"),
    base_url: "https://api.openweathermap.org/data/2.5"
  ],
  accuweather: [
    api_key: System.get_env("ACCUWEATHER_API_KEY"),
    base_url: "http://dataservice.accuweather.com"
  ],
  noaa: [
    base_url: "https://api.weather.gov"
  ]

# Redis configuration for caching
config :weather_api, :redis,
  host: System.get_env("REDIS_HOST", "localhost"),
  port: String.to_integer(System.get_env("REDIS_PORT", "6379")),
  database: String.to_integer(System.get_env("REDIS_DB", "0"))

# Import environment specific config
import_config "#{config_env()}.exs"