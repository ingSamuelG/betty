defmodule RogerApi.Partitions do
  @moduledoc  """
  Its takes a list of nodes and returns the partitions
  """

  def run(parts) do
    parts
    |>Keyword.values()
    |>Enum.flat_map(&Map.values/1)
    |>Enum.flat_map(&of_partitions_to_queus/1)
    |>Enum.map(&dispose_unused_keys/1)

  end

  defp of_partitions_to_queus(partition) do
    partition
    |>Enum.flat_map(&final_queus_format/1)

  end

  defp final_queus_format {partition_name,queus} do
    Enum.map(queus, fn {queu_name,queu_value} ->
      queu_value
      |> Map.merge(%{
         "partition_name"       =>  partition_name,
         "queue_name"           =>   queu_name,
         "qualified_queue_name" =>  "#{partition_name}-#{queu_name}",
          "count"               =>  queu_value.message_count,
          "paused"              =>  paused?(queu_value.paused)})  end)


    
  end

  defp dispose_unused_keys(q) do
     q
    |> Map.drop([:consumer_count,:max_workers,:paused,:message_count])
    
  end

  defp paused?(true), do: "paused"
  defp paused?(false), do: "running"

end
