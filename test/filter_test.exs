defmodule RogerapiTest.Filter do
  use ExUnit.Case


  alias RogerApi.Support
  alias RogerApi.Filter

  test "Filter the enum given one field" do
    input = Support.enum_to_filter()
    output = Support.enum_to_filter_results()
    assert output == Filter.call(input, ["last_name"], "go")
  end

  test "Given a 2 fields and a filter that is missing returns a empty list " do
    input = Support.enum_to_filter()
    assert Filter.call(input, ["last_name"], "12") == [] 
  end
end
