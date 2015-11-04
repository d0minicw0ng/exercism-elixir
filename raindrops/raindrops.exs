defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    convert(number, "")
  end

  defp convert(number, output) do
    cond do
      no_specific_prime_factors?(number) ->
        if String.length(output) == 0 do
          Integer.to_string(number)
        else
          output
        end
      no_specific_prime_factors?(number) -> output
      rem(number, 3) == 0 -> process_special_case(number, output, 3)
      rem(number, 5) == 0 -> process_special_case(number, output, 5)
      rem(number, 7) == 0 -> process_special_case(number, output, 7)
    end
  end

  def no_specific_prime_factors?(number) do
    rem(number, 3) != 0 && rem(number, 5) != 0 && rem(number, 7) != 0
  end

  @prime_factors %{ 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  defp process_special_case(number, output, prime_factor) do
    text = @prime_factors[prime_factor]
    unless String.contains?(output, text) do
      output = output <> text
    end
    convert(div(number, prime_factor), output)
  end
end
