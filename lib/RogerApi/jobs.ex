defmodule RogerApi.Job do

  @moduledoc """
  Its takes a list of nodes and gives the runing jobs
  """

  def running_jobs(jobs) do
      jobs
      |>Keyword.values()
      |> Enum.flat_map(&(Map.values(&1)))
      |> Enum.flat_map(&(List.flatten(&1)))

  end
end












