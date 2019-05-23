defmodule Tddex.Runner do
  @moduledoc """
  Runs files based on which ones should be run
  """

  def run(paths) do
    mix_test(paths)
  end

  defp mix_test(paths) do
    paths_string = Enum.join(paths, " ")
    System.cmd("sh", ["-c", "mix test " <> paths_string], into: IO.stream(:stdio, :line))
  end
end
