# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ptodos,
  ecto_repos: [Ptodos.Repo]

# Configures the endpoint
config :ptodos, PtodosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "brgAINDe8aeuQol7XaLZ7eaWRoW+eEK6ENEVic+J9HpTFwbLHxuX9TW0H32w8/gM",
  render_errors: [view: PtodosWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ptodos.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
 client_id: System.get_env("GITHUB_CLIENT_ID"),
 client_secret: System.get_env("GITHUB_SECRET")
