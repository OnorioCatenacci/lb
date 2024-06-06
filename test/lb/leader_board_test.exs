defmodule Lb.LeaderBoardTest do
  use Lb.DataCase

  alias Lb.LeaderBoard

  describe "players" do
    alias Lb.LeaderBoard.Player

    import Lb.LeaderBoardFixtures

    @invalid_attrs %{first_name: nil, last_name: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert LeaderBoard.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert LeaderBoard.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Player{} = player} = LeaderBoard.create_player(valid_attrs)
      assert player.first_name == "some first_name"
      assert player.last_name == "some last_name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LeaderBoard.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Player{} = player} = LeaderBoard.update_player(player, update_attrs)
      assert player.first_name == "some updated first_name"
      assert player.last_name == "some updated last_name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = LeaderBoard.update_player(player, @invalid_attrs)
      assert player == LeaderBoard.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = LeaderBoard.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> LeaderBoard.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = LeaderBoard.change_player(player)
    end
  end
end
