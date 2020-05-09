import Config

config :conference, Conference.Repository.ArticleRepo,
       username: "postgres",
       password: "root",
       database: "Conference",
       hostname: "localhost",
       port: "5432",
       show_sensitive_data_on_connection_error: true

config :conference, Conference.Repository.TalkRepo,
       username: "postgres",
       password: "root",
       database: "Conference",
       hostname: "localhost",
       port: "5432",
       show_sensitive_data_on_connection_error: true

config :conference, ecto_repos: [Conference.Repository.UserDetailsRepo, Conference.Repository.ArticleRepo,
                      Conference.Repository.TalkRepo]

config :conference, Conference.Repository.UserDetailsRepo,
       username: "postgres",
       password: "root",
       database: "Conference",
       hostname: "localhost",
       port: "5432",
       show_sensitive_data_on_connection_error: true
