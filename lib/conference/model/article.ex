defmodule Conference.Model.Article do
    use Ecto.Schema
    import Ecto.Changeset
  
    @derive {Poison.Encoder, only: [:id, :title, :author_id, :domain, :description, :link]}
    schema "articles" do
      field :title, :string
      belongs_to :user_id, Conference.Model.UserDetails, foreign_key: :author_id
      field :domain, :string
      field :description, :string
      field :link, :string
    end
  
    def changeset(struct, params) do
      struct
      |> cast(params,[:id, :title, :author_id, :domain, :description, :link])
    end
  end
  