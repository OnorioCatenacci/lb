defmodule Lb.LeaderBoard.Score do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scores" do
    field :player_id, :integer
    field :game_id, :integer
    field :score, :integer
    field :date_game_played, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [:player_id, :game_id, :score, :date_game_played])
    |> validate_required([:player_id, :game_id, :score, :date_game_played])
  end
end
