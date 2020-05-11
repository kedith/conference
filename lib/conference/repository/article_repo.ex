defmodule Conference.Repository.ArticleRepo do
  
  alias Conference.Model.Article, as: MArticle
  alias Conference.Repository.ArticleRepo, as: Repo
  import Ecto.Query

  use Ecto.Repo,
    otp_app: :conference,
    adapter: Ecto.Adapters.Postgres

    
    def upload_article(params) do
      %MArticle{}
      |> MArticle.changeset(params)
      |> Repo.insert()
    end

    def get_articles_by_domain(domain) do
      MArticle
      |> where([marticle], marticle.domain == ^domain)
      |> Repo.all()
    end

    def get_articles_by_author(author_id) do
      MArticle
      |> where([marticle], marticle.author_id == ^author_id)
      |> Repo.all()
    end

end
