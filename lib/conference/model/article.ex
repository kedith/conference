defmodule Conference.Model.Article do
    use Ecto.Schema
    import Ecto.Changeset
  
    @derive {Poison.Encoder, only: [:id, :title, :author, :domain, :description, :link]}
    schema "articles" do
      field :title, :string
      belongs_to :author, Conference.Model.UserDetails
      field :domain, :string
      field :description, :string
      field :link, :string
    end
  
    def changeset(struct, params) do
      struct
      |> cast(params,[:id, :title, :author, :domain, :description, :link])
    end
  end
  