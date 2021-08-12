defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum([a | nums], target) do
    loop_a(a, 0, nums, target)
  end

  defp loop_a(a, ai, [head | tail], target) do
    ret_b = loop_b([head | tail], 1, target - a)
    case ret_b do
      :no_match -> loop_a(head, ai+1, tail, target)
      _ -> [ai, ret_b + ai]
    end
  end

  defp loop_b([], _bi, _target), do: :no_match
  defp loop_b([b | _tail], bi, target) when b == target, do: bi
  defp loop_b([_b | tail], bi, target) do
    loop_b(tail, bi+1, target)
  end
end

IO.puts inspect Solution.two_sum([3,2,4], 6)
