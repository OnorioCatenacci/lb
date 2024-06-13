defmodule Lb.LeaderBoard.AverageScore do
  use Ecto.Schema
  import Ecto.Changeset

  schema "average_scores" do
    field :first_name, :string
    field :last_name, :string
    field :game, :string
    field :score, :float
    field :scores_recorded, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(average_score, attrs) do
    average_score
    |> cast(attrs, [:first_name, :last_name, :game, :score, :scores_recorded])
    |> validate_required([])
  end
end
