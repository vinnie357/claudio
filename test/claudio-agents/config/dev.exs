import Config

config :task_app, TaskAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "task_app_dev_secret_key_base_change_me_in_production",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:task_app, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:task_app, ~w(--watch)]}
  ]

config :task_app, TaskAppWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/task_app_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :task_app, dev_routes: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime