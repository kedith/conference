defmodule Conference.Repository.ArticleRepo do
  use Ecto.Repo,
    otp_app: :conference,
    adapter: Ecto.Adapters.Postgres
end
