defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from({year, month, day}) do
    {{new_y, new_m, new_d}, {_, _, _}} = new_date_in_gregorian_seconds(year, month, day) |> :calendar.gregorian_seconds_to_datetime
    {new_y, new_m, new_d}
	end

  defp new_date_in_gregorian_seconds(y, m, d) do
    to_gregorian_seconds(y, m, d) + one_gigaseconds
  end

  defp to_gregorian_seconds(y, m, d) do
    :calendar.datetime_to_gregorian_seconds({{y, m, d}, {0, 0, 0}})
  end

  defp one_gigaseconds do
    1_000_000_000
  end
end
