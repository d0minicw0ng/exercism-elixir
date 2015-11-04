defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    factors_for(number, 2, [])
  end

  defp factors_for(1, _, prime_factors), do: Enum.reverse(prime_factors)

  defp factors_for(num, current_prime_num, prime_factors) when rem(num, current_prime_num) == 0 do
    factors_for(
      div(num, current_prime_num),
      current_prime_num,
      [current_prime_num|prime_factors]
    )
  end

  defp factors_for(num, current_prime_num, prime_factors) do
    factors_for(
      num,
      next_prime_number(current_prime_num),
      prime_factors
    )
  end

  defp next_prime_number(num) do
    if is_prime(num + 1) do
      num + 1
    else
      next_prime_number(num + 1)
    end
  end

  defp is_prime(num)    when num <= 1,         do: false
  defp is_prime(num)    when num <= 3,         do: true
  defp is_prime(num)    when rem(num, 2) == 0, do: false
  defp is_prime(num)    when rem(num, 3) == 0, do: false
  defp is_prime(num),                          do: is_prime(num, 5)

  defp is_prime(num, i) when num < i * i,      do: true
  defp is_prime(num, i) when rem(num, i) == 0, do: false
  defp is_prime(num, i),                       do: is_prime(num, i + 2)
end
