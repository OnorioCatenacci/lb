defmodule LbWeb.PageHTML do
  use LbWeb, :html

  embed_templates "page_html/*"
  def convert_number_to_timespan(number) do
    {minutes, seconds} = Decimal.div_rem(number, 60)
    pluralize = if Decimal.gt?(minutes, 1), do: "mins", else: "min"
    "#{Decimal.to_string(minutes)} #{pluralize}, #{Decimal.to_string(seconds)} secs"
  end
end
