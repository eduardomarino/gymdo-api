defmodule Gymdo.IMC do
  # def calculate(filename) do
  #   result = File.read(filename)
  #   handle_file(result)
  # end

  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
    # |> handle_file("arg2")
  end

  defp handle_file({:ok, content}) do
    data =
      content
      |> String.split("\n")
      |> Enum.map(fn line -> parse_line(line) end)
      # Turns a list into a map
      |> Enum.into(%{})
    {:ok, data}
  end

  defp handle_file({:error, _reason}) do
    {:error, "Error while opening the file"}
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    # |> IO.inspect()
    # |> List.update_at(1, fn elem -> String.to_float(elem) end)
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}

  # defp handle_file({:ok, content}, arg2) do
  #   content
  # end

  # defp handle_file({:error, reason}) do
  #   reason
  # end
end
