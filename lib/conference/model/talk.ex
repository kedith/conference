defmodule Conference.Model.Talk do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "talks" do
      belongs_to :article, Conference.Model.Article
      field :start_time, :utc_datetime
      field :end_time, :utc_datetime
      field :room, :string
    end
  
  end
  