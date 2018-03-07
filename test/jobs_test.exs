defmodule RogerapiTest.Queus do
  use ExUnit.Case
  doctest RogerApi.Job

  alias RogerApi.Support
  alias RogerApi.Job

  test "given an input of  a list of nodes, partitions and jobs the output should be a list of jobs running" do
    input = Support.nodes_jobs()
    output = Support.out_jobs()
    assert MapSet.new(output) == MapSet.new(Job.running_jobs(input))
  end
end
