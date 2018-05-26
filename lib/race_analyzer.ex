defmodule RaceAnalyzer do
  def build_race_hash(log) do
    LogReader.read(log)
    |> Enum.map(&(driver_hash(&1)))
  end

  def driver_hash(line) do
    %{
      id:        String.to_integer(Enum.at(line, 2)),
      driver:    Enum.at(line, 1),
      lap_time:  convert_times(Enum.at(line, 3)),
      time:      convert_times(Enum.at(line, 0)),
      average:   String.to_float(Enum.at(line, 4))
      }
  end

  def convert_times(string) do
    string
    |> Time.from_iso8601
    |> elem(1)
  end
end
