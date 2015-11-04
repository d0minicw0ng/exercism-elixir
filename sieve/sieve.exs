defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit), do: primes_to(limit, [])

  defp primes_to(limit, []) when limit < 2, do: []
  defp primes_to(limit, []),                do: primes_to(limit, [2])

  defp primes_to(limit, result) do
    next_prime_num = hd(result) |> next_prime_number
    if next_prime_num > limit do
      Enum.reverse(result)
    else
      primes_to(limit, [next_prime_num|result])
    end
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
