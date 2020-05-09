defmodule Conference.Model.UserDetails do
  use Ecto.Schema

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :affiliation, :string
  end
end
