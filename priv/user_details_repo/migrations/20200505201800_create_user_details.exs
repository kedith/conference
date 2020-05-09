defmodule Conference.Repository.UserDetailsRepo.Migrations.CreateUserDetails do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :affiliation, :string, null: false
    end
  end
end
