defmodule RogerApi.Partitions do
  @moduledoc  """
  Its takes a list of nodes and returns the partitions
  """

  def run(parts) do
    parts
    |>Keyword.values()
    |>create_the_structure
    |> dispose_unused_keys


  end

  defp create_the_structure(keys) do
    keys
    |>Enum.flat_map(&(Enum.flat_map(&1,fn {state_name,ques} ->  ques
                                                                |> Enum.flat_map(fn {partition_name,partition} -> partition
                                                                                                                  |> Enum.map(fn {que_name,values} -> values
                                                                                                                                                      |>Map.merge(%{
      "paused"              => "#{state_name}",
      "partition_name"       => "#{partition_name}",
      "queue_name"           =>    que_name,
      "qualified_queue_name" =>"#{partition_name}-#{que_name}"})
    end)  end) end)))
  end

  defp dispose_unused_keys(partition_value) do
    partition_value
    |> Enum.map(&(Map.drop(&1,[:consumer_count,:max_workers,:paused])))
    |> Enum.map(fn k -> Map.put(k,"count", Map.get(k, :message_count))  end )
    |> Enum.map(&(Map.drop(&1,[:message_count])))

  end


end
