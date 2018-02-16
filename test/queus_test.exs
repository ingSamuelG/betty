defmodule RogerapiTest.Jobs do
  use ExUnit.Case
  doctest RogerApi.Queus


  alias RogerApi.Queus
  alias RogerApi.Support

  test "given an input of  a list of nodes, partitions and queus the output should be a list queus" do
   quein =Support.inque()
   queout =Support.outque()
   assert MapSet.new(queout) == MapSet.new(Queus.nodes_to_queus(quein))

  end
end
