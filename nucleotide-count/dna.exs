defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, fn (char) -> char == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    nucleotides_table |> nucleotide_counts(strand)
  end

  defp nucleotides_table do
    %{?A => 0, ?C => 0, ?G => 0, ?T => 0}
  end

  defp nucleotide_counts(map, strand) do
    Enum.reduce(strand, map, fn (char, acc) ->
      Map.update!(acc, char, fn (val) -> val + 1 end)
    end)
  end
end
