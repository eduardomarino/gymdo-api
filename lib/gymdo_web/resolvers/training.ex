defmodule GymdoWeb.Resolvers.Training do
  def create(%{input: params}, _context), do: Gymdo.Trainings.Create.call(params)
end
