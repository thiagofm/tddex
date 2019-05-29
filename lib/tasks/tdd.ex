defmodule Mix.Tasks.Tdd do
  alias Tddex.File.Watcher

  @moduledoc """
  The main tddex task
  """
  use Mix.Task

  def run(_) do
    {:ok, _pid} = Watcher.start_link(dirs: ["."])
    :timer.sleep(:infinity)
  end
end
