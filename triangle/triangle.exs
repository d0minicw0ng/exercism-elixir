defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    cond do
      has_non_positive_side?(a, b, c)        -> { :error, "all side lengths must be positive" }
      violates_triangle_inequality?(a, b, c) -> { :error, "side lengths violate triangle inequality" }
      equilateral?(a, b, c)                  -> { :ok, :equilateral }
      isosceles?(a, b, c)                    -> { :ok, :isosceles }
      true                                   -> { :ok, :scalene }
    end
  end

  defp has_non_positive_side?(a, b, c) do
    Enum.any?([a, b, c], fn(side) -> side <= 0 end)
  end

  defp violates_triangle_inequality?(a, b, c) do
    c >= a + b || b >= a + c || a >= b + c
  end

  defp equilateral?(a, b, c) do
    a == b && b == c
  end

  defp isosceles?(a, b, c) do
    !equilateral?(a, b, c) && (a == b || b == c || a == c)
  end
end
