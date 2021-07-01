# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gymdo,
  ecto_repos: [Gymdo.Repo]

# UUID use config
config :gymdo, Gymdo.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :gymdo, GymdoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8i8yyzR40uVSBdJtMAotKdQXlNpxKHYSwfDzdXe0LToeibB0L2auJ1EmMybTKvFD",
  render_errors: [view: GymdoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gymdo.PubSub,
  live_view: [signing_salt: "1m1N1VIe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
