defmodule RaceData do
  @race_log "race_log.txt"

  def generate do
    LogReader.read(@race_log)
    |> Enum.map(&(driver_hash(&1)))
  end

  def driver_hash(line) do
    %{
      id:        String.to_integer(Enum.at(line, 1)),
      driver:    Enum.at(line, 2),
      lap_time:  convert_times({:lap_time, Enum.at(line, 4)}),
      time:      convert_times({:time, Enum.at(line, 0)}),
      lap_number: String.to_integer(Enum.at(line, 3)),
      average:   String.to_float(Enum.at(line, 5))
      }
  end

  def convert_times({:time, string}) do
    string
    |> Timex.parse("%H:%M:%S.%f", :strftime)
    |> elem(1)
  end

  def convert_times({:lap_time, string}) do
    "0#{string}"
    |> Timex.parse("%M:%S.%f", :strftime)
    |> elem(1)
  end
end
