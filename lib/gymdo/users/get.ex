defmodule Gymdo.Users.Get do
  import Ecto.Query
  alias Gymdo.{User, Repo, Training}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    # User
    # |> Repo.get(uuid)
    # |> handle_get()

    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      # user -> {:ok, user}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    query =
      from training in Training,
      # Pin operator "^" to freeze the "today" value within the query
        where: ^today >= training.start_date and ^today <= training.end_date

    # Loads the first training returned by the query considering the creation date
    # also returns the corresponding exercises
    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
