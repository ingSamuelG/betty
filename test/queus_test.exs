defmodule RogerapiTest.Jobs do
  use ExUnit.Case
  doctest RogerApi.Queus

  alias RogerApi.Queus
  alias RogerApi.Support

  test "given an input of  a list of nodes, partitions and queus the output should be a list of queus" do
    quein = Support.nodes_queus()
    queout = Support.out_queus()
    assert MapSet.new(queout) == MapSet.new(Queus.nodes_to_queus(quein))
  end
end
