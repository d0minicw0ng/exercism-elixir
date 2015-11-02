defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    divisible_by_4?(year) &&
    (not_divisible_by_100?(year) || divisible_by_100_and_400?(year))
  end

  defp divisible_by_4?(year) do
    rem(year, 4) == 0
  end

  defp not_divisible_by_100?(year) do
    rem(year, 100) != 0
  end

  # NOTE: doesn't need to check for 100 as 400 already covers 100
  defp divisible_by_100_and_400?(year) do
    rem(year, 400) == 0
  end
end
