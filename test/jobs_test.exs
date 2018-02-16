defmodule RogerapiTest.Queus do
  use ExUnit.Case
  doctest RogerApi.Job


  import Roger.Job, only: [ runningjobs: 0 ,outjobs: 0 ]
  import RogerApi.Job , only: [ running_jobs: 1 ]

  test "given an input of  a list of nodes, partitions and jobs the output should be a list of jobs running" do
    
    input = runningjobs()
    output = outjobs()
    assert  MapSet.new(output) == MapSet.new(running_jobs(input))
  end

end
