defmodule Conference.Repository.ArticleRepo do
  
  alias Conference.Model.Article, as: MArticle
  alias Conference.Repository.UserDetailsRepo, as: Repo

  use Ecto.Repo,
    otp_app: :conference,
    adapter: Ecto.Adapters.Postgres

    
    def upload_article(params) do
      %MArticle{}
      |> MArticle.changeset(params)
      |> Repo.insert()
    end

end
