import Config

config :conference, Conference.Repository.ArticleRepo,
       username: "postgres",
       password: "postgres",
       database: "Conference",
       hostname: "localhost",
       port: "5432",
       show_sensitive_data_on_connection_error: true

config :conference, Conference.Repository.TalkRepo,
       username: "postgres",
       password: "postgres",
       database: "Conference",
       hostname: "localhost",
       port: "5432",
       show_sensitive_data_on_connection_error: true

config :conference, Conference.Repository.UserDetailsRepo,
       username: "postgres",
       password: "postgres",
       database: "Conference",
       hostname: "localhost",
       port: "5432",
       show_sensitive_data_on_connection_error: true
