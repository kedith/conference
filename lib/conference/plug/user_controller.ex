defmodule Conference.Plug.UserController do
  use Plug.Router
  import Plug.Conn
  alias Conference.Repository.UserDetailsRepo, as: URepo
  alias Conference.Model.UserDetails, as: MUser
  require Logger
  plug :match
  plug :dispatch

  post "/upload" do
    {:ok, new_user} = URepo.create_user(conn.body_params)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(new_user))
  end

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(URepo.all(MUser)))
  end

end
