defmodule Gymdo.Training do
  use Ecto.Schema

  import Ecto.Changeset

  alias Gymdo.{User, Exercise}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:start_date, :end_date, :user_id]

  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    # Defined as a child entity of User
    belongs_to :user, User
    # Determines that each training can have many exercises
    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    # Associates the cast of exercises to run together
    # exercises will be created together with trainings
    |> cast_assoc(:exercises)
  end
end
