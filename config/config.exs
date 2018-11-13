# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :restapi,
  ecto_repos: [Restapi.Repo]

# Configures the endpoint
config :restapi, RestapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tuEBCWVH9xrXxNVAxnt/TSWedBaT/gcyPS/eO28AIoQk60QaI3F8EuUpqCorU6es",
  render_errors: [view: RestapiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Restapi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
