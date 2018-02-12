defmodule RogerApi do


  def running_jobs(jobs), do:
      jobs
    |>Keyword.values()
    |> Enum.flat_map(&(Map.values(&1)))
      |> Enum.flat_map(&(List.flatten(&1)))

  def partitions(parts) do
    
  end
      end











