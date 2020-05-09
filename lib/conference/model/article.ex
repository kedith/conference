defmodule Conference.Model.Article do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "articles" do
      field :title, :string
      belongs_to :user, Conference.Model.UserDetails
      field :affiliation, :string
      field :domain, :string
      field :description, :string
      field :links, :string
    end
  
  end
  