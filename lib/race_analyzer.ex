defmodule RaceAnalyzer do
  def build_race_hash(log) do
    LogReader.read(log)
    |> Enum.map(&(racer_hash(&1)))
  end

  def racer_hash(line) do
    %{
      id:        Enum.at(line, 2),
      racer:     Enum.at(line, 1),
      lap_time:  Enum.at(line, 3),
      time:      Enum.at(line, 0),
      average:   Enum.at(line, 4)
      }
  end
end
