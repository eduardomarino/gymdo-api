defmodule GymdoWeb.IMCController do
  # Get "put_status" and "json" functions
  use GymdoWeb, :controller

  alias Gymdo.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  # defp handle_response({:ok, result}, conn) do
  #   conn
  #   |> put_status(:ok)
  #   |> json(result)
  # end

  defp handle_response({:ok, result}, conn), do: render_response(conn, result, :ok)

  # defp handle_response({:error, result}, conn) do
  #   conn
  #   |> put_status(:bad_request)
  #   |> json(result)
  # end

  defp handle_response({:error, result}, conn), do: render_response(conn, result, :bad_request)

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
