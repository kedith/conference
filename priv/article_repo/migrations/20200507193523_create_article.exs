defmodule Conference.Repository.ArticleRepo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :author_id, references(:users)
      add :domain, :string
      add :description, :string
      add :link, :string
    end
  end
end
