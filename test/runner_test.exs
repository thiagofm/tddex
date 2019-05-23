defmodule Tddex.RunnerTest do
  use ExUnit.Case

  alias Tddex.Runner

  test "run/1" do
    assert {%IO.Stream{device: :standard_io, line_or_bytes: :line, raw: false}, 0} =
             Runner.run(["test/support/fixtures/test_test.exs"])
  end
end
