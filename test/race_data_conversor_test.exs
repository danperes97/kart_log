defmodule RaceDataConversor.Test do
  use ExUnit.Case, async: true
  doctest RaceDataConversor

  test "convert time string to Time Class" do
    time        = RaceDataConversor.convert_data({:time, "23:51:46.691"})
    class_time  = NaiveDateTime.new(0000, 1, 1, 23, 51, 46, {691000, 3})

    assert time == class_time |> elem(1)
  end

  test "convert lap time string to Time Class" do
    time        = RaceDataConversor.convert_data({:lap_time, "1:04.287"})
    class_time  = NaiveDateTime.new(0000, 1, 1, 0, 1, 04, {287000, 3})

    assert time == class_time |> elem(1)
  end

  test "convert id string to integer" do
    assert RaceDataConversor.convert_data({:id, "1"}) == 1
  end

  test "convert lap_number string to integer" do
    assert RaceDataConversor.convert_data({:lap, "1"}) == 1
  end

  test "convert average string to float" do
    assert RaceDataConversor.convert_data({:average, "1.1"}) == 1.1
  end

  test "convert name string to string" do
    assert RaceDataConversor.convert_data({:name, "Carlton"}) == "Carlton"
  end

  test "convert second to minutes" do
    assert RaceDataConversor.seconds_to(:minute, 60) == 1
  end

  test "convert time diff to seconds" do
    time1 = NaiveDateTime.new(0000, 1, 1, 0, 2, 00) |> elem(1)
    time2 = NaiveDateTime.new(0000, 1, 1, 0, 1, 00) |> elem(1)

    assert RaceDataConversor.time_to(:second, time1, time2) == 60
  end

  test "convert time diff to minutes" do
    time1 = NaiveDateTime.new(0000, 1, 1, 0, 2, 00) |> elem(1)
    time2 = NaiveDateTime.new(0000, 1, 1, 0, 1, 00) |> elem(1)

    assert RaceDataConversor.time_to(:minute, time1, time2) == 1
  end
end
