defmodule RaceAnalyzer do
  @race_data RaceData.generate
  @race_laps 4

  def results do
    Enum.concat(race_completed, race_uncompleted)
    |> Enum.with_index
    |> Enum.map( fn({element,index}) ->
      RaceAnalyzer.build_race_status(index, element)
    end)
  end

  def build_race_status(position, driver) do
    %{
      position: position + 1,
      id: driver.id,
      driver: driver.name,
      laps: driver.lap_number,
      total_time: "#{abs(Float.round(driver_total_time(driver.id) / 60, 2))}min"
    }
  end

  def race_completed do
    @race_data
    |> Enum.sort_by(&(&1[:time]))
    |> Enum.filter(&(&1[:lap_number] == 4))
    |> Enum.uniq_by(&(&1[:name]))
  end

  def race_uncompleted do
    drivers = Enum.map(race_completed(), &(&1[:name]))

    @race_data
    |> Enum.sort_by(&(&1[:time]))
    |> Enum.filter(&(&1[:lap_number] < @race_laps))
    |> Enum.filter(&(!Enum.member?(drivers, &1[:name])))
    |> Enum.uniq_by(&(&1[:name]))
  end

  def driver_total_time(id) do
    min_max = @race_data
              |> Enum.filter(&(&1[:id] == id))
              |> Enum.map(&(&1.time))
              |> Enum.min_max

     NaiveDateTime.diff(min_max |> elem(0), min_max |> elem(1))
  end
end
