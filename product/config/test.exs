import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :product, Product.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "product_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :product, ProductWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "rOfXG6PBY6OVDEqjTJjJ9l8ZWRrLc9n2I982Wo2VqXzWtNuYXGjfm4L1QmJr9y6B",
  server: false

# In test we don't send emails.
config :product, Product.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
