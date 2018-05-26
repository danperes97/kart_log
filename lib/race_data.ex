defmodule RaceData do
  @race_log "race_log.txt"

  def generate do
    LogReader.read(@race_log)
    |> Enum.map(&(driver_hash(&1)))
  end

  def driver_hash(line) do
    %{
      id:         RaceDataConversor.convert_data({:id, Enum.at(line, 1)}),
      name:       RaceDataConversor.convert_data({:name, Enum.at(line, 2)}),
      lap_time:   RaceDataConversor.convert_data({:lap_time, Enum.at(line, 4)}),
      time:       RaceDataConversor.convert_data({:time, Enum.at(line, 0)}),
      lap_number: RaceDataConversor.convert_data({:lap, Enum.at(line, 3)}),
      average:    RaceDataConversor.convert_data({:average, Enum.at(line, 5)})
      }
  end
end
