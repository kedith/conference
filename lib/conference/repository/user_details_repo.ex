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

  def insert_data_from_rabbitmq(data) do
    user = %MUser{first_name: Map.get(data, "first_name", nil), last_name: Map.get(data,"last_name", nil), affiliation: Map.get(data, "affiliation", nil), id: Map.get(data, "id", nil) }
    Repo.insert(user)
  end
end
