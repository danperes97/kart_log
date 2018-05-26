defmodule RaceAnalyzer do
  def build_race_hash(log) do
    LogReader.read(log)
    |> Enum.map(&(driver_hash(&1)))
  end

  def driver_hash(line) do
    %{
      id:        Enum.at(line, 2),
      driver:     Enum.at(line, 1),
      lap_time:  Enum.at(line, 3),
      time:      Enum.at(line, 0),
      average:   Enum.at(line, 4)
      }
  end
end
