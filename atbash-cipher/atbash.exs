defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    normalize(plaintext) |> to_ascii_codes
  end

  defp normalize(plaintext) do
    String.downcase(plaintext) |> String.replace(~r/\W/, "")
  end

  defp to_ascii_codes(plaintext) do
     plaintext |> to_char_list |> transform
  end

  defp transform(chars) do
    {_, new_str} = Enum.reduce(chars, {0, []}, fn(char, {index, acc}) ->
      new_char = encode_char(char)
      if index > 0 && rem(index + 1, 5) == 0 do
        {index + 1, [[new_char|' ']|acc]}
      else
        {index + 1, [new_char|acc]}
      end
    end)

    Enum.reverse(new_str) |> List.to_string |> String.strip
  end

  def encode_char(char) when char < ?a, do: char
  def encode_char(char),                do: ?a + (25 - (char - ?a))
end
