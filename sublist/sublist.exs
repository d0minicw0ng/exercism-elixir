defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equal?(a, b)     -> :equal
      sublist?(a, b)   -> :sublist
      superlist?(a, b) -> :superlist
      true             -> :unequal
    end
  end

  defp equal?(a, b) do
    Enum.sort(a) === Enum.sort(b)
  end

  defp sublist?(a, b) do
    contains?(b, a)
  end

  defp superlist?(a, b) do
    contains?(a, b)
  end

  defp contains?(a, b) do
    a_count = Enum.count(a)
    b_count = Enum.count(b)
    last_index = a_count - b_count
    contains = Enum.any?(0..last_index, fn (index) ->
      Enum.slice(a, index..index + b_count - 1) === b
    end)

    (a_count > b_count) && contains
  end
end
