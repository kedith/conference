use Mix.Config

config :conference, Conference.Repository.ArticleRepo,
       username: "postgres",
       password: "admin",
       database: "conference_test",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox

config :conference, Conference.Repository.UserDetailsRepo,
       username: "postgres",
       password: "admin",
       database: "conference_test",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox

config :conference, Conference.Repository.TalkRepo,
       username: "postgres",
       password: "admin",
       database: "conference_test",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox