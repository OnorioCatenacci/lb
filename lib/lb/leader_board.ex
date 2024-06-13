defmodule Lb.LeaderBoard do
  @moduledoc """
  The LeaderBoard context.
  """

  import Ecto.Query, warn: false
  alias Lb.Repo

  alias Lb.LeaderBoard.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @spec get_playername_by_id(integer) :: {:ok, String.t()} | {:error, String.t()}
  def get_playername_by_id(id) when is_integer(id) do
    r =
      from(p in Player,
        where: p.id == ^id,
        select: [p.first_name, p.last_name]
      )
      |> Repo.one()

    if r == nil do
      {:error, "No player found for id #{id}"}
    else
      [first_name, last_name] = r
      {:ok, "#{first_name} #{last_name}"}
    end
  end

  @doc """
  This is different than list_players because it's meant to allow me to populate an option control.  It returns id and first and last concatenated.
  """

  def get_player_list() do
    list_players()
    |> Enum.map(fn p -> %{id: p.id, name: "#{p.first_name} #{p.last_name}"} end)
  end

  @doc """
    Creates a player.

    ## Examples

        iex> create_player(%{field: value})
        {:ok, %Player{}}

        iex> create_player(%{field: bad_value})
        {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  alias Lb.LeaderBoard.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @spec get_gamename_by_id(integer) :: {:ok, String.t()} | {:error, String.t()}
  def get_gamename_by_id(id) when is_integer(id) do
    r =
      from(g in Game,
        where: g.id == ^id,
        select: g.name
      )
      |> Repo.one()

    if r == nil do
      {:error, "No game found for id #{id}"}
    else
      {:ok, "#{[r]}"}
    end
  end

  @doc """
  This is different than list_games because it's meant to allow me to populate an option control.  It returns id and game name.
  """

  def get_game_list() do
    list_games()
    |> Enum.map(fn g -> %{id: g.id, name: "#{g.name}"} end)
  end

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{data: %Game{}}

  """
  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end

  alias Lb.LeaderBoard.Score

  @doc """
  Returns the list of scores.

  ## Examples

      iex> list_scores()
      [%Score{}, ...]

  """
  def list_scores do
    Repo.all(Score)
  end

  @doc """
  Gets a single score.

  Raises `Ecto.NoResultsError` if the Score does not exist.

  ## Examples

      iex> get_score!(123)
      %Score{}

      iex> get_score!(456)
      ** (Ecto.NoResultsError)

  """
  def get_score!(id), do: Repo.get!(Score, id)

  @doc """
  Creates a score.

  ## Examples

      iex> create_score(%{field: value})
      {:ok, %Score{}}

      iex> create_score(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_score(attrs \\ %{}) do
    %Score{}
    |> Score.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a score.

  ## Examples

      iex> update_score(score, %{field: new_value})
      {:ok, %Score{}}

      iex> update_score(score, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_score(%Score{} = score, attrs) do
    score
    |> Score.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a score.

  ## Examples

      iex> delete_score(score)
      {:ok, %Score{}}

      iex> delete_score(score)
      {:error, %Ecto.Changeset{}}

  """
  def delete_score(%Score{} = score) do
    Repo.delete(score)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking score changes.

  ## Examples

      iex> change_score(score)
      %Ecto.Changeset{data: %Score{}}

  """
  def change_score(%Score{} = score, attrs \\ %{}) do
    Score.changeset(score, attrs)
  end

  alias Lb.LeaderBoard.AverageScore

  def get_average_scores_per_game(game_id) when is_integer(game_id) do
    q =
      from(s in Score,
        join: p in Player,
        on: s.player_id == p.id,
        join: g in Game,
        on: s.game_id == g.id,
        where: g.id == ^game_id,
        group_by: [p.id,g.id],
        order_by: [asc: avg(s.score)],
        select: [
          first_name: p.first_name,
          last_name: p.last_name,
          game: g.name,
          average_score: avg(s.score),
          scores_recorded: count(s.score)
        ]
      )

    r = Repo.all(q)

    if r == [] do
      {:error, "No scores found for game id #{game_id}"}
    else
      scores =
        for record <- r,
            do: %AverageScore{
              first_name: record[:first_name],
              last_name: record[:last_name],
              game: record[:game],
              score: record[:average_score],
              scores_recorded: record[:scores_recorded]
            }

      {:ok, scores}
    end
  end
end
