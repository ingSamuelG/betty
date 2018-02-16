defmodule RogerapiTest.Jobs do
  use ExUnit.Case
  doctest RogerApi.Queus


  import RogerApi.Queus , only: [ nodes_to_queus: 1 ]
  import Roger.Job, only: [ inque: 0, outque: 0 ]

  test "given an input of  a list of nodes, partitions and queus the output should be a list queus" do
   quein =inque()
   queout =outque()
   assert MapSet.new(queout) == MapSet.new(nodes_to_queus(quein))

  end
end
