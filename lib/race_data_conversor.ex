defmodule RaceDataConversor do
  def convert_data({:time, string}) do
    string
    |> Timex.parse("%H:%M:%S.%f", :strftime)
    |> elem(1)
  end

  def convert_data({:lap_time, string}) do
    "0#{string}"
    |> Timex.parse("%M:%S.%f", :strftime)
    |> elem(1)
  end

  def convert_data({:id, id}),            do: String.to_integer(id)
  def convert_data({:lap, lap_number}),   do: String.to_integer(lap_number)
  def convert_data({:average, average}),  do: String.to_float(average)
  def convert_data({:name, driver}),      do: driver
end
