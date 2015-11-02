defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    Map.keys(input) |>
    Enum.reduce(%{}, fn (key, acc) ->
      Map.get(input, key, []) |>
      downcase |>
      update_acc(key, acc)
    end)
  end

  defp downcase(values) do
    Enum.map(values, fn (val) -> String.downcase(val) end)
  end

  defp update_acc(values, key, acc) do
    Enum.reduce(values, acc, fn (value, acc) ->
      Map.put(acc, value, key)
    end)
  end
end
