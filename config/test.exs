import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :buggy_sidebar, BuggySidebarWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "jyMrRtpHkoLsssM1aWNfS0n4n181hRB8cgy9a/K7tiTaK+BVLN1KqWdIQFj/SOwn",
  server: false

# In test we don't send emails.
config :buggy_sidebar, BuggySidebar.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
