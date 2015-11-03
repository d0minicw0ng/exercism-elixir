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

  defp ten_to_the_power(exponent), do: :math.pow(10, exponent) |> round

  # TODO: not sure what to name these methods yet...
  defp case_one(num) do
    divisor = get_divisor(num)
    String.duplicate(table[divisor], div(num, divisor)) <> to_roman(rem(num, divisor)) |>
    replace_four_occurrences(divisor)
  end

  defp replace_four_occurrences(str, divisor) do
    String.replace(str, dup(table[divisor], 4), table[divisor] <> table[divisor * 5])
  end


  defp case_two(num, exponent) do
    base = 5 * ten_to_the_power(exponent)
    table[base] <> to_roman(rem(num, base))
  end

  defp case_three(num, exponent) do
    base = ten_to_the_power(exponent)
    table[base] <> table[base * 10] <> to_roman(num - base * 9)
  end

  defp get_divisor(num) do
    :math.log10(num) |> Float.floor |> ten_to_the_power |> round
  end

  defp table do
    %{
      1    => "I",
      5    => "V",
      10   => "X",
      50   => "L",
      100  => "C",
      500  => "D",
      1000 => "M",
      5000 => "V"
    }
  end

  defp dup(char, num), do: String.duplicate(char, num)

  defp to_roman(num) when num <= 3, do: dup(table[1], num)
  defp to_roman(num) when num == 4, do: table[1] <> table[5]
  defp to_roman(num) when num <= 8, do: table[5] <> to_roman(num - 5)
  defp to_roman(num) when num == 9, do: table[1] <> table[10]

  defp to_roman(num) when num <= 49, do: case_one(num)
  defp to_roman(num) when num <= 89, do: case_two(num, 1)
  defp to_roman(num) when num <= 99, do: case_three(num, 1)

  defp to_roman(num) when num <= 499, do: case_one(num)
  defp to_roman(num) when num <= 899, do: case_two(num, 2)
  defp to_roman(num) when num <= 999, do: case_three(num, 2)

  defp to_roman(num) when num <= 4999, do: case_one(num)
end
