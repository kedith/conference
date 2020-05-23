Logger.configure(level: :info)
#{:ok, _pid} = Conference.Repository.ArticleRepo.start_link
#{:ok, _pid} = Conference.Repository.UserDetailsRepo.start_link
#Ecto.Adapters.SQL.Sandbox.mode(Conference.Repository.ArticleRepo, :manual)
#Ecto.Adapters.SQL.Sandbox.mode(Conference.Repository.UserDetailsRepo, :manual)
ExUnit.start()



