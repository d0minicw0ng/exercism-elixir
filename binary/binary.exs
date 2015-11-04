defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if Regex.match?(~r/\D+/, string) do
      0
    else
      get_decimal(string)
    end
  end

  defp get_decimal(string) do
    reversed_integer_array_stream(string) |>
    Enum.reduce({0, 0}, fn(num, {index, acc}) ->
      {index + 1, acc + :math.pow(2, index) * num}
    end) |>
    elem(1)
  end

  defp reversed_integer_array_stream(string) do
    String.reverse(string) |>
    String.split("") |>
    Stream.filter(&(Regex.match?(~r/\d+/, &1))) |>
    Stream.map(&String.to_integer/1)
  end
end
