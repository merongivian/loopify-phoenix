# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :loopify,
  ecto_repos: [Loopify.Repo]

# Configures the endpoint
config :loopify, Loopify.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K4kv8jWk9JtgtBTklZBToIuSbSj5vAq0yek8I4eZx9onofwClmQ/0G4VeOcDWkuY",
  render_errors: [view: Loopify.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Loopify.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
