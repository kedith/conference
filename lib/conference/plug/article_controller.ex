defmodule Conference.Plug.ArticleController do
    use Plug.Router
    import Plug.Conn
    alias Conference.Repository.ArticleRepo, as: ARepo
    require Logger
    plug :match
    plug :dispatch
     
    post "/upload" do
        {:ok, new_article} = ARepo.upload_article(conn.body_params)
        conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Poison.encode!(new_article))
    end

    

end