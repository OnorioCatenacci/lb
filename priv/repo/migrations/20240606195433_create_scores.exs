defmodule Lb.Repo.Migrations.CreateScores do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :player_id, :integer
      add :game_id, :integer
      add :score, :integer
      add :date_game_played, :date

      timestamps(type: :utc_datetime)
    end
  end
end
