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

    get "/filter/domain" do
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Poison.encode!(ARepo.get_articles_by_domain(Map.get(conn.params, "domain", nil))))
    end

    @doc """
        Filter after any fields, if you do not want some, let them empty
    """
    get "/filter/author" do
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Poison.encode!(ARepo.get_articles_by_author(Map.get(conn.params, "author_id", 1))))
    end

end