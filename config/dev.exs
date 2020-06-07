import Config

config :logger, 
        backends: [
          {Conference.Logging.JsonLogger, :json
          Conference.Logging.JsonLoggerTCP, :logstash}
        ]
config :logger, :json, level: :info

config :logger, :logstash,
      level: :debug,
      host: 'localhost',
      port: 5044


config :conference, Conference.Repository.ArticleRepo,
       username: "postgres",
       password: "postgres",
       database: "Conference",
       hostname: "confDb",
       port: "5432",
       show_sensitive_data_on_connection_error: true

config :conference, Conference.Repository.TalkRepo,
       username: "postgres",
       password: "postgres",
       database: "Conference",
       hostname: "confDb",
       port: "5432",
       show_sensitive_data_on_connection_error: true

config :conference, Conference.Repository.UserDetailsRepo,
       username: "postgres",
       password: "postgres",
       database: "Conference",
       hostname: "confDb",
       port: "5432",
       show_sensitive_data_on_connection_error: true
