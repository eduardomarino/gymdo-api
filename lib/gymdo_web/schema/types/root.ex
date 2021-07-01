# Queries and Mutations entrypoints
defmodule GymdoWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors

  alias GymdoWeb.Resolvers
  alias GymdoWeb.Schema.Types

  alias Resolvers.User, as: UserResolver
  alias Resolvers.Training, as: TrainingResolver

  # Macro for importing types
  import_types Types.Custom.UUID4

  # Get create_user_input
  import_types Types.User
  # Get create_training_input
  import_types Types.Training

  # Queries aggregator
  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      # Explicitly called function
      # resolve fn params, context -> UserResolver.get(params, context) end
      # Aridade /2 will receive 2 arguments
      #  Using & to call the function implicitly
      resolve &UserResolver.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
      middleware TranslateErrors
    end

    field :create_training, type: :training do
      arg :input, non_null(:create_training_input)

      resolve &TrainingResolver.create/2
      middleware TranslateErrors
    end
  end
end
