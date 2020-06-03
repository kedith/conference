import Config

config :conference, Conference.Repository.ArticleRepo,
       username: "postgres",
       password: "postgres",
       database: "conference_test",
       hostname: "localhost",
       port: "5432",
       pool: Ecto.Adapters.SQL.Sandbox

config :conference, Conference.Repository.UserDetailsRepo,
       username: "postgres",
       password: "postgres",
       database: "conference_test",
       hostname: "localhost",
       port: "5432",
       pool: Ecto.Adapters.SQL.Sandbox

config :conference, Conference.Repository.TalkRepo,
       username: "postgres",
       password: "postgres",
       database: "conference_test",
       hostname: "localhost",
       port: "5432",
       pool: Ecto.Adapters.SQL.Sandbox