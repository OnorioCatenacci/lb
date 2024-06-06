defmodule Lb.LeaderBoard.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :first_name, :string
    field :last_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end
end
