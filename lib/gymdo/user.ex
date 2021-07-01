defmodule Gymdo.User do
  # Inject module
  use Ecto.Schema
  # Import function
  # Changeset is used for data validation
  import Ecto.Changeset

  alias Gymdo.Training

  # Determines that the id in UUID format (configured in config.exs) will be auto generated
  @primary_key {:id, :binary_id, autogenerate: true}

  # Create a module variable, a constant
  @fields [:email, :password, :name]

  # "users" is the table name
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    # Determines that each user has one training
    # has_one :training, Training

    # Determines that each user can have many trainings
    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    # It usually starts with an empty struct
    # Reference to Gymdo.User
    %__MODULE__{}
    |> cast(params, @fields)
    # These validations are done in memory
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    # Determines :email as unique field
    # This validation is done through a database query
    |> unique_constraint([:email])
  end
end
