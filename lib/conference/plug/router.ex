defmodule Conference.Plug.Router do
    use Plug.Router
  
    plug(:match)
  
    plug(Plug.Parsers,
      parsers: [:json],
      pass: ["application/json"],
      json_decoder: Poison
    )
  
    plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  
    plug(:dispatch)

    forward("/article",to: Conference.Plug.ArticleController)

    match _ do
      send_resp(conn, 404, "Page not found!")
    end
  end