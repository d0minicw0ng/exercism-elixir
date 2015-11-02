defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    years_in_earth = seconds / 31557600.0
    case planet do
      :earth   -> years_in_earth
      :mercury -> years_in_earth / 0.2408467
      :venus   -> years_in_earth / 0.61519726
      :mars    -> years_in_earth / 1.8808158
      :jupiter -> years_in_earth / 11.862615
      :saturn  -> years_in_earth / 29.447498
      :uranus  -> years_in_earth / 84.016846
      :neptune -> years_in_earth / 164.79132
    end
  end
end
