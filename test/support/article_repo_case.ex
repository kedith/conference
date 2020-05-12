defmodule Conference.ArticleRepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do

      import Ecto
      import Ecto.Query
      import Conference.ArticleRepoCase

      # and any other stuff
    end
  end

  setup tags do

    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Conference.Repository.ArticleRepo)
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Conference.Repository.UserDetailsRepo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Conference.Repository.ArticleRepo, {:shared, self()})
      Ecto.Adapters.SQL.Sandbox.mode(Conference.Repository.UserDetailsRepo, {:shared, self()})
    end
  end
end
