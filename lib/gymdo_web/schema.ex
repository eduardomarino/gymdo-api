defmodule GymdoWeb.Schema do
  # Join all queries and mutations
  use Absinthe.Schema

  import_types GymdoWeb.Schema.Types.Root

  query do
    # Import all fields from root query
    import_fields :root_query
  end

  mutation do
    # Import all fields from root mutation
    import_fields :root_mutation
  end
end
