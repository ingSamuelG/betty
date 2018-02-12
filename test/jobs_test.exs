defmodule TransformationTest do
  use ExUnit.Case
  doctest Transformation

  import RogerApi, only: [running_jobs: 1]
  import Roger.Job, only: [runningjobs: 0 ,outjobs: 0]

  test "given an input of  a list of nodes, partitions and jobs the output should be a list of jobs running" do
    
    input = runningjobs
    output = outjobs
    assert  output = running_jobs(input)
  end
end
