defmodule TddexTest do
  use ExUnit.Case
  doctest Tddex

  test "greets the world" do
    assert Tddex.hello() == :world
  end
end
