# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mi_caserito,
  ecto_repos: [MiCaserito.Repo]

# Configures the endpoint
config :mi_caserito, MiCaserito.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d3X419G6xYP6IaUJz6kfZTTL52E0pmzyWAU/MJwgEzbJW3H7DHmzy86+Wbat1WwB",
  render_errors: [view: MiCaserito.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MiCaserito.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, []}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
