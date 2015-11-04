defmodule Roman do
  @numerals [
    { 1000, "M"  },
    { 900,  "CM" },
    { 500,  "D"  },
    { 400,  "CD" },
    { 100,  "C"  },
    { 90,   "XC" },
    { 50,   "L"  },
    { 40,   "XL" },
    { 10,   "X"  },
    { 9,    "IX" },
    { 5,    "V"  },
    { 4,    "IV" },
    { 1,    "I"  }
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    numerals(number, @numerals)
  end

  defp numerals(_, []), do: ""
  defp numerals(number, [{arabic, roman}|rest]) do
    String.duplicate(roman, div(number, arabic)) <> numerals(rem(number, arabic), rest)
  end
end
