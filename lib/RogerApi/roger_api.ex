defmodule RogerApi do


  def running_jobs(jobs), do:
      jobs
    |>Keyword.values()
    |> Enum.flat_map(&(Map.values(&1)))
    |> Enum.flat_map(&(List.flatten(&1)))

  def partitions(parts) do
    parts
    |>Keyword.values()
    |> Enum.flat_map(
         &(Enum.flat_map(&1,fn {k, v} ->
           Enum.flat_map(v, fn {k2,v2} ->
             Enum.map(v2, fn {k3,v3} ->
               Map.merge(v3, %{"paused" => "#{k}",
                                "partition_name" => "#{k2}",
                                "queue_name" => k3,
                                 "qualified_queue_name" =>"#{k2}-#{k3}"})
             end) end)end)))
    |> Enum.map(&(Map.drop(&1,[:consumer_count,:max_workers,:paused])))
    |> Enum.map(fn k -> Map.put(k,"count", Map.get(k, :message_count))  end )
    |> Enum.map(&(Map.drop(&1,[:message_count])))


  end


end












