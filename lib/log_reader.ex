defmodule LogReader do
  def read(log) do
    log
    |> File.read
    |> sort_by_line
    |> List.delete_at(0)
    |> Enum.map(&(sort_by_column(&1)))
    |> Enum.reject(&(Kernel.length(&1) == 0))
  end

  def sort_by_line({:ok, text}) do
    text
    |> String.split("\n")
  end

  def sort_by_column(line) do
    line
    |> String.replace("\t\t", " ")
    |> String.replace(" ", "|")
    |> String.split(~r/[(|–*?)]/)
    |> Enum.filter(&(String.trim(&1) != ""))
    |> Enum.map(&(String.trim(&1)))
  end
end
