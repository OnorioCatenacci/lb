defmodule Lb.Repo do
  use Ecto.Repo,
    otp_app: :lb,
    adapter: Ecto.Adapters.Postgres
end
