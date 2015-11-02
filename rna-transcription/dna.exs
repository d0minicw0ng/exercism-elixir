defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    transriptions = %{?A => ?U, ?T => ?A, ?G => ?C, ?C => ?G}
    Enum.map(dna, fn(char) -> transriptions[char] end)
  end
end
