defmodule Conference.Repository.UserDetailsRepo do
  
  
  use Ecto.Repo,
    otp_app: :conference,
    adapter: Ecto.Adapters.Postgres

end
