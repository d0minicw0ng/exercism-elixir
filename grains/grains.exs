defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    case number do
      1 -> 1
      _ -> 2 * square(number - 1)
    end
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    Enum.reduce(1..64, 0, fn(num, acc) ->
      acc + square(num)
    end)
  end
end
