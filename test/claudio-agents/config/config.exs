import Config

config :task_app,
  generators: [timestamp_type: :utc_datetime]

config :task_app, TaskAppWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: TaskAppWeb.ErrorHTML, json: TaskAppWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: TaskApp.PubSub,
  live_view: [signing_salt: "task_app_lv"]

config :esbuild,
  version: "0.19.9",
  task_app: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.0",
  task_app: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"