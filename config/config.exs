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

config :conference, ecto_repos: [Conference.Repository.UserDetailsRepo, Conference.Repository.ArticleRepo,
                      Conference.Repository.TalkRepo]

import_config "#{Mix.env()}.exs" #import test environment

if Mix.env() != :prod && Mix.env() != :dev do
  config :git_hooks,
         verbose: true,
         hooks: [
           pre_commit: [
             tasks: [
               "mix clean",
               "mix test"
             ]
           ]
         ]
end