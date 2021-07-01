defmodule Gymdo.Recursion do
  # [1, 2, 3]

  # def sum([]), do: 0
  # def sum([elem]), do: elem

  # def sum([head | tail]) do
  #   head + sum(tail)
  # end

  def sum([list]), do: do_sum(list, 0)

  defp do_sum([], _acc), do: 0
  defp do_sum([elem], acc), do: elem + acc

  # defp do_sum([head | tail], acc) do
  #   acc = head + acc
  #   do_sum(tail, acc)
  # end

  defp do_sum([head | tail], acc) do
    do_sum(tail, head + acc)
  end
end
