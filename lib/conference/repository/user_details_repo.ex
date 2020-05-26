defmodule Conference.Repository.UserDetailsRepo do
  alias Conference.Model.UserDetails, as: MUser
  alias Conference.Repository.UserDetailsRepo, as: Repo
  import Ecto.Query
  
  use Ecto.Repo,
    otp_app: :conference,
    adapter: Ecto.Adapters.Postgres


  def create_user(params) do
    %MUser{}
    |> MUser.changeset(params)
    |> Repo.insert()
  end
end
