defmodule RogerApi.Nodes do
  def nodes_in_list(nodes) do
    nodes
    |> Enum.flat_map(&nodes_to_status/1)

    # |>Enum.map(&dispose_unused_keys/1)
  end

  defp nodes_to_status({nodes, status}) do
    status
    |> Enum.flat_map(&status_to_partitions(nodes, &1))
  end

  defp status_to_partitions(nodes, {status, partition}) do
    partition
    |> Enum.map(&final_partition_format(nodes, status, &1))
  end

  defp final_partition_format(nodes, status, {partition_name, _partition_value}) do
    %{"partition_name" => partition_name, "node_name" => nodes, "status" => status}
  end
end
