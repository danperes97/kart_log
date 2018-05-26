defmodule RaceAnalyzer do
  def results do
    RaceData.generate
    |> Enum.uniq_by([{1, :x}, {2, :y}, {1, :z}], fn {x, _} -> x end)
  end

  
end
