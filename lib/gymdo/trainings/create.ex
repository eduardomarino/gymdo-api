defmodule Gymdo.Trainings.Create do
  alias Gymdo.{Training, Repo}

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
