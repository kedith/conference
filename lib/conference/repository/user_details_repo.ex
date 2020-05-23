defmodule Conference.Repository.UserDetailsRepo do

  alias Conference.Repository.UserDetailsRepo, as: Repo
  alias Conference.Model.UserDetails, as: MUser

  use Ecto.Repo,
    otp_app: :conference,
    adapter: Ecto.Adapters.Postgres

  def insert_data_from_rabbitmq(data) do
    %MUser{first_name: data.first_name, last_name: data.last_name, affiliation: data.affiliation}
    |> MUser.changeset()
    |> Repo.insert()    
  end


end
