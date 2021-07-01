defmodule GymdoWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Gymdo.Users.Get.call(user_id)
  def create(%{input: params}, _context), do: Gymdo.Users.Create.call(params)
end
