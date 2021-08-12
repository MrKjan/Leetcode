defmodule Solution do
  @spec my_atoi(s :: String.t) :: integer
  def my_atoi(s) do
    s
    |> String.trim_leading(" ")
    |> split_sign
    |> to_integer
  end

  defp split_sign(s) do
    cond do
      String.first(s) == "-" -> {"-", String.slice(s, 1..-1)}
      String.first(s) == "+" -> {"", s}
      is_integer String.first(s) -> {"", s}
      true -> {"", "0"}
    end
  end

  defp to_integer({sign, s}) do
    [ints | _other] = s
    |> String.split("", trim: true)
    |> Enum.split_while(&(&1 in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]))
    IO.puts s

    sign ++ ints
    |> Enum.join
    |> String.to_integer
  end
end

IO.puts Solution.my_atoi("2134")
IO.puts Solution.my_atoi("-1234")
IO.puts Solution.my_atoi("   2134")
IO.puts Solution.my_atoi("2134sdfg")
IO.puts Solution.my_atoi("dfsg2134sdfg")
IO.puts Solution.my_atoi("  -2134sdfg")
