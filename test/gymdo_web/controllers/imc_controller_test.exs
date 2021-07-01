defmodule GymdoWeb.IMCControllerTest do
  # To work with case and connections
  use GymdoWeb.ConnCase, async: true

    describe "index/2" do
      test "when all params are valid, returns the imc info", %{conn: conn} do
        params = %{"filename" => "mock.csv"}

        response =
          conn
          # imc_path is a help displayed through the command: mix phx.routes
          # Sets the route, pass the connection and call the route's input method passing the params
          |> get(Routes.imc_path(conn, :index, params))
          |> json_response(:ok)

        expected_response = %{
          "result" => %{
            "John" => 23.437499999999996,
            "Paul" => 23.04002019946976,
            "George" => 22.857142857142858,
            "Ringo" => 24.897060231734173
          }
        }

        assert response == expected_response
      end

      test "when there are invalid params, returns an error", %{conn: conn} do
        params = %{"filename" => "fake.csv"}

        response =
          conn
          |> get(Routes.imc_path(conn, :index, params))
          |> json_response(:bad_request)

        expected_response = %{"result" => "Error while opening the file"}

        assert response == expected_response
      end
    end
  end
end
