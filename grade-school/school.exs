defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do
    Dict.get(db, grade, []) |>
    merge(name) |>
    update(grade, db)
  end

  defp merge(students, new_student) do
    students ++ [new_student]
  end

  defp update(students, grade, db) do
    Dict.put(db, grade, students)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do
    Dict.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db) do
    Dict.keys(db) |> db_with_students_sorted_by_name(db)
  end

  defp db_with_students_sorted_by_name(grades, db) do
    Enum.reduce(grades, %{}, fn (grade, acc) ->
      Dict.get(db, grade) |>
      Enum.sort |>
      put_sorted_students(grade, acc)
    end)
  end

  defp put_sorted_students(students, grade, db) do
    Dict.put_new(db, grade, students)
  end
end
