defmodule LbWeb.PageController do
  use LbWeb, :controller
  alias Lb.LeaderBoard

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    {:ok, scoreboard} = LeaderBoard.get_average_scores_per_game(1)
    render(conn, :home, scoreboards: scoreboard)

    #    render(conn, :home, layout: false)
  end
end
