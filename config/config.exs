# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo,
  ecto_repos: [Demo.Repo]

# Configures the endpoint
config :demo, Demo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JppAVmtiN5jDt1O8FXKtLKiMJTC4+0x9HHk4AVcMIMbX6MI6dOueXfg6RJrTanxX",
  render_errors: [view: Demo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Demo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :dockerex,
  host: "http://localhost:2375/",
  options: []

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
