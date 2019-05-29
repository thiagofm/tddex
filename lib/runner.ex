defmodule Tddex.Runner do
  @moduledoc """
  Runs files based on which ones should be run
  """

  @callback run(any()) :: {any(), non_neg_integer()}

  def run(paths) do
    mix_test(paths)
  end

  defp mix_test(paths) do
    paths_string = Enum.join(paths, " ")
    #TODO: mock system?
    System.cmd("mix", ["test", "--color", paths_string], into: IO.stream(:stdio, :line))
  end
end
