defmodule Tddex.RunnerTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias Tddex.Runner

  test "run/1" do
    assert capture_io(fn ->
      {%IO.Stream{device: :standard_io, line_or_bytes: :line, raw: false}, 0} =
             Runner.run(["test/support/fixtures/test_test.exs"])
    end)
  end
end
