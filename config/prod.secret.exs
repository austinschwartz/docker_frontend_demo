use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :demo, Demo.Endpoint,
  secret_key_base: "ny6bTR5xh68m9yCO6SDowFP+4TlGGcQ0PBBfvNubO52JqqVLHukfbaoojxC6QmkM"

# Configure your database
config :demo, Demo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "demo_prod",
  pool_size: 20
