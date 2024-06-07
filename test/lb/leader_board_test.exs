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

  describe "games" do
    alias Lb.LeaderBoard.Game

    import Lb.LeaderBoardFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert LeaderBoard.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert LeaderBoard.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Game{} = game} = LeaderBoard.create_game(valid_attrs)
      assert game.name == "some name"
      assert game.description == "some description"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LeaderBoard.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Game{} = game} = LeaderBoard.update_game(game, update_attrs)
      assert game.name == "some updated name"
      assert game.description == "some updated description"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = LeaderBoard.update_game(game, @invalid_attrs)
      assert game == LeaderBoard.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = LeaderBoard.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> LeaderBoard.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = LeaderBoard.change_game(game)
    end
  end

  describe "scores" do
    alias Lb.LeaderBoard.Score

    import Lb.LeaderBoardFixtures

    @invalid_attrs %{player_id: nil, game_id: nil, score: nil, date_game_played: nil}

    test "list_scores/0 returns all scores" do
      score = score_fixture()
      assert LeaderBoard.list_scores() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert LeaderBoard.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      valid_attrs = %{player_id: 42, game_id: 42, score: 42, date_game_played: ~D[2024-06-05]}

      assert {:ok, %Score{} = score} = LeaderBoard.create_score(valid_attrs)
      assert score.player_id == 42
      assert score.game_id == 42
      assert score.score == 42
      assert score.date_game_played == ~D[2024-06-05]
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LeaderBoard.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      update_attrs = %{player_id: 43, game_id: 43, score: 43, date_game_played: ~D[2024-06-06]}

      assert {:ok, %Score{} = score} = LeaderBoard.update_score(score, update_attrs)
      assert score.player_id == 43
      assert score.game_id == 43
      assert score.score == 43
      assert score.date_game_played == ~D[2024-06-06]
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = LeaderBoard.update_score(score, @invalid_attrs)
      assert score == LeaderBoard.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = LeaderBoard.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> LeaderBoard.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = LeaderBoard.change_score(score)
    end
  end
end
