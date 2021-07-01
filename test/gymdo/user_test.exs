defmodule Gymdo.UserTest do
  use Gymdo.DataCase, async: true

  alias Gymdo.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "fakeName", email: "fake@email.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "fakeName", email: "fake@email.com", password: "123456"},
        errors: []
      } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "fakeName", email: "fake@email.com"}

      response = User.changeset(params)

      expected_response = %{password: ["can't be blank"]}

      # errors_on function available through DataCase
      assert errors_on(response) == expected_response
    end
  end
end
