defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    cond do
      strand1 == strand2 -> 0
      Enum.count(strand1) != Enum.count(strand2) -> nil
      true -> calculate_hamming_distance(strand1, strand2)
    end
  end

  defp calculate_hamming_distance(strand1, strand2) do
    Enum.with_index(strand1) |>
    Enum.reduce(0, fn({char, index}, acc) ->
      if Enum.at(strand2, index) == char, do: acc, else: acc + 1
    end)
  end
end
