use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :restapi, RestapiWeb.Endpoint,
  secret_key_base: "LQY2dNgT3hYtChIrPvoy9sXVcndjbgqlTATpxd7i37jOipEkmlyWbvVBdRlyqM0b"

# Configure your database
config :restapi, Restapi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "restapi_prod",
  pool_size: 15
