defmodule Conference.Repository.ArticleRepo do

  alias Conference.Model.Article, as: MArticle

  use Ecto.Repo,
      otp_app: :conference,
      adapter: Ecto.Adapters.Postgres


  def upload_article(params) do
    %MArticle{}
    |> MArticle.changeset(params)
    |> Conference.Repository.ArticleRepo.insert()
  end

end
