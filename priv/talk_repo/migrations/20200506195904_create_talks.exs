defmodule Conference.Repository.TalkRepo.Migrations.CreateTalks do
  use Ecto.Migration

  def change do
    create table(:talks) do
      add :articel_id, references(:articles)
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime
      add :room, :string
    end
  end
end
