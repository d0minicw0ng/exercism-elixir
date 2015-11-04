defmodule Allergies do
  use Bitwise

  @allergies_table %{
    "cats"         => 128,
    "pollen"       => 64,
    "chocolate"    => 32,
    "tomatoes"     => 16,
    "strawberries" => 8,
    "shellfish"    => 4,
    "peanuts"      => 2,
    "eggs"         => 1
  }

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    Map.keys(@allergies_table) |>
    Enum.filter(fn(item) -> allergic_to?(flags, item) end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    band(flags, @allergies_table[item]) == @allergies_table[item]
  end
end
