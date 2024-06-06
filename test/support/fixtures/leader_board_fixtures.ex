defmodule Lb.LeaderBoardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lb.LeaderBoard` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Lb.LeaderBoard.create_player()

    player
  end
end
