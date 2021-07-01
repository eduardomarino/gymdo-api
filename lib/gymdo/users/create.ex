defmodule Gymdo.Users.Create do
  alias Gymdo.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
