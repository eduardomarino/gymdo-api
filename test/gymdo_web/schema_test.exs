# Testing GraphQL Schemas
defmodule GymdoWeb.SchemaTest do
  use GymdoWeb.ConnCase, async: true

  alias Gymdo.User
  alias Gymdo.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "fakeName", email: "fake@email.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      # Multiline string
      query = """
        {
          getUser(id: "#{user_id}") {
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response =  %{
        "data" => %{
          "getUser" => %{
            "email" => "fake@email.com",
            "name" => "fakeName"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "fakeName",
            email: "fake@email.com",
            password: "123456"
          }){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "fakeName"}}} = response
    end
  end
end
