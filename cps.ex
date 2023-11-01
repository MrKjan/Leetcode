# CPSification:
# 1) Add cc param, add _cps to signature
# 2) apply cc to all branches
# 3) write continuation for a call
# 4) rewrite recursive call

# https://www.kimsereylam.com/racket/2019/02/14/recursion-with-fibonacci.html

defmodule Triple do
  def triple_nocc([head | tail]), do: [head*3 | triple(tail)]
  def triple_nocc([]), do: []

  def triple(list), do: triple(list, &(&1))
  def triple([], cc), do: cc.([])
  def triple([head | tail], cc), do: triple(tail, &(cc.([3*head | &1])))

  def fib_nocc(val) when val < 2, do: 1
  def fib_nocc(val), do: fib_nocc(val - 1) + fib_nocc(val - 2)

  def fib(val), do: fib(val, &(&1))
  def fib(val, cc) when val < 2, do: cc.(1)
  def fib(val, cc), do: fib(
    val - 1,
    fn a ->
      fib(
        val - 2,
        fn b -> cc.(a + b) end
      ) end
  )
end

IO.inspect Triple.triple([1,1,2,3,4])
IO.inspect Triple.triple_nocc([1,1,2,3,4])
IO.inspect Triple.fib_nocc(6)
IO.inspect Triple.fib(6)
