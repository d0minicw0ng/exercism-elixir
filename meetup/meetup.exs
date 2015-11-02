defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    case schedule do
      :last ->
        last_day = :calendar.last_day_of_the_month(year, month)
        get_date(year, month, weekday, days_in_week(last_day - 6))
      :teenth ->
        get_date(year, month, weekday, days_in_week(13))
      _ ->
        get_date(year, month, weekday, week_range(schedule))
    end
  end

  defp get_date(year, month, weekday, week) do
    day = Enum.find(week, fn(day) ->
      :calendar.day_of_the_week({ year, month, day }) == weekday_dict[weekday]
    end)
    { year, month, day }
  end

  defp first_day_of_week(schedule) do
    multiplier = case schedule do
      :first  -> 0
      :second -> 1
      :third  -> 2
      :fourth -> 3
    end
    1 + 7 * multiplier
  end

  defp week_range(schedule) do
    first_day_of_week(schedule) |> days_in_week
  end

  defp days_in_week(first_day_of_week) do
    first_day_of_week..(first_day_of_week + 6)
  end

  def weekday_dict do
    [
      monday:    1,
      tuesday:   2,
      wednesday: 3,
      thursday:  4,
      friday:    5,
      saturday:  6,
      sunday:    7
    ]
  end
end
