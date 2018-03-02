defmodule RogerapiTest.Node do
  use ExUnit.Case



  alias RogerApi.Nodes
  alias RogerApi.Support

  test "given an input of  a list of nodes, partitions and queus the output should be a list of nodes" do
   quein =Support.nodes_queus()
   nodeout =Support.out_node_list()
   assert MapSet.new(nodeout) == MapSet.new(Nodes.nodes_in_list(quein))

  end
end
