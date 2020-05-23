defmodule Conference.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(children(), opts())
  end

  defp children do
    [
      {
        Plug.Adapters.Cowboy,
        scheme: :http,
        plug: Conference.Plug.Router,
        options: [
          port: 4500
        ]
      },
      {Conference.Consumer,[]},
      Conference.Repository.ArticleRepo,
      Conference.Repository.UserDetailsRepo,
      Conference.Repository.TalkRepo,

    ]
  end

    defp opts do
      [
        strategy: :one_for_one,
        name: Conference.Supervisor
      ]
    end
end
