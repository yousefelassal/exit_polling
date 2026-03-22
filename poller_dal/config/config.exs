import Config

config :poller_dal, PollerDal.Repo,
  database: "hello_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :poller_dal,
  ecto_repos: [PollerDal.Repo]
