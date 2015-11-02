defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  defp count([_|rest], acc) do
    count(rest, acc + 1)
  end

  defp count([], acc) do
    acc
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([head|rest], acc) do
    reverse(rest, [head|acc])
  end

  defp reverse([], acc) do
    acc
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end

  defp map([head|rest], f, acc) do
    map(rest, f, [f.(head)|acc])
  end

  defp map([], _, acc) do
    reverse(acc)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  defp filter([head|rest], f, acc) do
    if f.(head) == true do
      filter(rest, f, [head|acc])
    else
      filter(rest, f, acc)
    end
  end

  defp filter([], _, acc) do
    reverse(acc)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([head|rest], acc, f) do
    reduce(rest, f.(head, acc), f)
  end

  def reduce([], acc, _), do: acc

  @spec append(list, list) :: list
  def append(a, b) do
    a ++ b
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat(ll, [])
  end

  defp concat([head|rest], acc) do
    concat(rest, reverse(head) ++ acc)
  end

  defp concat([], acc) do
    reverse(acc)
  end
end
