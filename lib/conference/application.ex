defmodule Conference.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(children(), opts())
  end

  defp children do
    [
      Conference.Repository.UserDetailsRepo
    ]
  end

    defp opts do
      [
        strategy: :one_for_one,
        name: Conference.Supervisor
      ]
    end
end
