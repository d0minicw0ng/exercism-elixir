defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    Integer.to_string(number) |> split |> get_roman_numerals
  end

  defp split(str) do
    arr = String.split(str, "")
    Enum.slice(arr, 0..(length(arr) - 2)) |>
    Enum.map(fn(int) -> String.to_integer(int) end)
  end

  defp get_roman_numerals(num_arr) do
    arr_length = length(num_arr)
    Enum.with_index(num_arr) |>
    Enum.reduce("", fn(num_idx, acc) ->
      acc <> get_roman_representation(num_idx, arr_length)
    end)
  end

  defp get_roman_representation({num, idx}, arr_length) do
    (arr_length - idx - 1) |> pow(num) |> round |> to_roman
  end

  defp pow(exponent, num) when exponent == 0 do
    num
  end

  defp pow(exponent, num) do
    num * :math.pow(10, exponent)
  end

  # 1 => "I"
  # 5 => "V"
  # 10 => "X"
  # 50 => "L"
  # 100 => "C"
  # 500 => "D"
  # 1000 => "M"

  defp to_roman(num) when num == 0, do: ""

  defp to_roman(num) when num >= 1 and num <= 3, do: String.duplicate("I", num)

  defp to_roman(num) when num == 4, do: "IV"

  defp to_roman(num) when num >= 5 and num <= 8, do: "V" <> to_roman(num - 5)

  defp to_roman(num) when num == 9, do: "IX"

  defp to_roman(num) when num >= 10 and num <= 39 do
    String.duplicate("X", div(num, 10)) <> to_roman(rem(num, 10))
  end

  defp to_roman(num) when num >= 40 and num <= 49 do
    "XL" <> to_roman(rem(num, 10))
  end

  defp to_roman(num) when num >= 50 and num <= 89 do
    "L" <> to_roman(num - 50)
  end

  defp to_roman(num) when num >= 90 and num <= 99 do
    "XC" <> to_roman(num - 90)
  end

  defp to_roman(num) when num >= 100 and num <= 399 do
    String.duplicate("C", div(num, 100)) <> to_roman(rem(num, 100))
  end

  defp to_roman(num) when num >= 400 and num <= 499 do
    "CD" <> to_roman(rem(num, 100))
  end

  defp to_roman(num) when num >= 500 and num <= 899 do
    "D" <> to_roman(rem(num, 100))
  end

  defp to_roman(num) when num >= 900 and num <= 999 do
    "CM" <> to_roman(num - 900)
  end

  defp to_roman(num) when num >= 1000 and num <= 3999 do
    String.duplicate("M", div(num, 1000)) <> to_roman(rem(num, 1000))
  end
end
