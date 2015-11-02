defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    normalize(sentence) |>
    split_sentence |>
    filter_non_words |>
    get_word_count
  end

  defp normalize(sentence) do
    String.downcase(sentence) |>
    String.replace(~r/[!|&|@|\$|%|\^|&|,]+/, "")
  end

  defp split_sentence(sentence) do
    String.split(sentence, [" ", "_"])
  end

  defp filter_non_words(words) do
    Enum.filter(words, fn(word) -> String.match?(word, ~r/\w+/) end)
  end

  defp get_word_count(words) do
    Enum.reduce(words, Map.new, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
