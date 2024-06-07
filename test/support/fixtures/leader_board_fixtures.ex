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

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Lb.LeaderBoard.create_game()

    game
  end

  @doc """
  Generate a score.
  """
  def score_fixture(attrs \\ %{}) do
    {:ok, score} =
      attrs
      |> Enum.into(%{
        date_game_played: ~D[2024-06-05],
        game_id: 42,
        player_id: 42,
        score: 42
      })
      |> Lb.LeaderBoard.create_score()

    score
  end
end
