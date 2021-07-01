defmodule Gymdo.Exercise do
  use Ecto.Schema

  import Ecto.Changeset

  alias Gymdo.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:name, :protocol_description, :repetitions, :video_url]

  schema "exercises" do
    field :name, :string
    field :protocol_description, :string
    field :repetitions, :string
    field :video_url, :string

    belongs_to :training, Training

    timestamps()
  end

  # "exercise" struct sent via cast_assoc in training
  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
