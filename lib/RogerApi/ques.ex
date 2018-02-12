defmodule RogerApi do


  def running_jobs(list), do:
      list
    |>Keyword.values()
    |> Enum.flat_map(&(Map.values(&1)))
      |> Enum.flat_map(&(List.flatten(&1)))




    end











