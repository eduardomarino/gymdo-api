defmodule Gymdo.IMCTest do
  # Defines that tests can be run asynchronously
  use ExUnit.Case, async: true

  alias Gymdo.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "mock.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
          %{
            "John" => 23.437499999999996,
            "Paul" => 23.04002019946976,
            "George" => 22.857142857142858,
            "Ringo" => 24.897060231734173
          }
        }

      assert response == expected_response
    end

    test "when the wrong file is given, returns an error" do
      params = %{"filename" => "fake.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
