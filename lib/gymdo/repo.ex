# This module bridges Ecto with Postgres
defmodule Gymdo.Repo do
  use Ecto.Repo,
    otp_app: :gymdo,
    adapter: Ecto.Adapters.Postgres
end
