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
    (arr_length - idx - 1) |> times_ten_to_the_power(num) |> round |> to_roman
  end

  defp times_ten_to_the_power(exponent, num) when exponent == 0, do: num

  defp times_ten_to_the_power(exponent, num) do
    num * ten_to_the_power(exponent)
  end

  defp ten_to_the_power(exponent), do: :math.pow(10, exponent)

  defp after_divided_by_divisor_is_between_one_and_four(num) do
    divisor = get_divisor(num)
    String.duplicate(table[divisor], div(num, divisor)) <> to_roman(rem(num, divisor))
  end

  defp get_divisor(num) do
    :math.log10(num) |> Float.floor |> ten_to_the_power |> round
  end

  defp table do
    %{ 10 => "X", 100 => "C", 1000 => "M" }
  end

  # 1 => "I"
  # 5 => "V"
  # 10 => "X"
  # 50 => "L"
  # 100 => "C"
  # 500 => "D"
  # 1000 => "M"

  defp to_roman(num) when num <= 3, do: String.duplicate("I", num)

  defp to_roman(num) when num == 4, do: "IV"

  defp to_roman(num) when num <= 8, do: "V" <> to_roman(num - 5)

  defp to_roman(num) when num == 9, do: "IX"

  defp to_roman(num) when num <= 39 do
    after_divided_by_divisor_is_between_one_and_four(num)
  end

  defp to_roman(num) when num <= 49 do
    "XL" <> to_roman(rem(num, 10))
  end

  defp to_roman(num) when num <= 89 do
    "L" <> to_roman(num - 50)
  end

  defp to_roman(num) when num <= 99 do
    "XC" <> to_roman(num - 90)
  end

  defp to_roman(num) when num <= 399 do
    after_divided_by_divisor_is_between_one_and_four(num)
  end

  defp to_roman(num) when num <= 499 do
    "CD" <> to_roman(rem(num, 100))
  end

  defp to_roman(num) when num <= 899 do
    "D" <> to_roman(rem(num, 100))
  end

  defp to_roman(num) when num <= 999 do
    "CM" <> to_roman(num - 900)
  end

  defp to_roman(num) when num <= 3999 do
    after_divided_by_divisor_is_between_one_and_four(num)
  end
end
