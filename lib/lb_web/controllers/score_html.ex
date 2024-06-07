defmodule LbWeb.ScoreHTML do
  use LbWeb, :html

  embed_templates "score_html/*"

  @doc """
  Renders a score form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def score_form(assigns)
end
