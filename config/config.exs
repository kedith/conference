import Config

config :conference, ecto_repos: [Conference.Repository.UserDetailsRepo, Conference.Repository.ArticleRepo,
                      Conference.Repository.TalkRepo]

import_config "#{Mix.env()}.exs" #import test environment

if Mix.env() != :prod do
  config :git_hooks,
         verbose: true,
         hooks: [
           pre_commit: [
             tasks: [
               "mix clean",
               "mix compile --warnings-as-errors",
               "mix test"
             ]
           ]
         ]
end