defmodule Conference.Model.UserDetails do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :affiliation, :string
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:first_name, :last_name, :affiliation])
  end
end
