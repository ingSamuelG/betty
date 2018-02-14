defmodule RogerapiTest do
  use ExUnit.Case
  doctest RogerApi

  import RogerApi, only: [running_jobs: 1, partitions: 1]
  import Roger.Job, only: [runningjobs: 0 ,outjobs: 0, inque: 0, outque: 0]

  test "given an input of  a list of nodes, partitions and jobs the output should be a list of jobs running" do
    
    input = runningjobs()
    output = outjobs()
    assert  MapSet.new(output) == MapSet.new(running_jobs(input))
  end

  test "Test of the transformation of partitions" do
   quein =inque()
   queout =outque()
   assert MapSet.new(queout) == MapSet.new(partitions(quein))

  end
end
