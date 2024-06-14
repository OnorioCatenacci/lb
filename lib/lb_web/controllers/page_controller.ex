defmodule LbWeb.PageController do
  use LbWeb, :controller
  alias Lb.LeaderBoard

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    {:ok, wordle_scoreboard} = LeaderBoard.get_average_scores_per_game(1)
    {:ok, connections_scoreboard} = LeaderBoard.get_average_scores_per_game(2)
    {:ok, mini_xword_scoreboard} = LeaderBoard.get_average_scores_per_game(3)
    render(conn, :home, wordle_scoreboard: wordle_scoreboard, connections_scoreboard: connections_scoreboard, mini_xword_scoreboard: mini_xword_scoreboard)

    #    render(conn, :home, layout: false)
  end
end
