defmodule Lb.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :first_name, :string
      add :last_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
