defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, fn (candidate) ->
      is_anagram?(base, candidate)
    end)
  end

  defp is_anagram?(base, candidate) do
    downcased_base      = String.downcase(base)
    downcased_candidate = String.downcase(candidate)

    downcased_base != downcased_candidate &&
    sorted(downcased_base) == sorted(downcased_candidate)
  end

  defp sorted(string) do
    String.to_char_list(string) |> Enum.sort
  end
end
