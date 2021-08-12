defmodule Solution do
  @spec reverse(x :: integer) :: integer
  def reverse(x) do
    [sign | tail] = Integer.to_charlist x
    val = if sign == 45 do
      [sign] ++ Enum.reverse(tail)
    else
      Enum.reverse([sign | tail])
    end
    |> List.to_integer

    if val >= -:math.pow(2, 31) and val <= :math.pow(2, 31) - 1 do
      val
    else
      0
    end
  end
end


IO.puts Solution.reverse 123
IO.puts Solution.reverse -321
IO.puts Solution.reverse 120
IO.puts Solution.reverse 0
