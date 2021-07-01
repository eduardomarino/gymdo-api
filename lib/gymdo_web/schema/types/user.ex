defmodule GymdoWeb.Schema.Types.User do
  # To use type definition features
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    # uuid4 is a custom type and needs to be created
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
  end

  # Sets the input object for mutation
  input_object :create_user_input do
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :password, non_null(:string), description: "User password"
  end
end
