defmodule Tddex.Handler do
  @moduledoc """
  Given a file path, knows whether it should run all tests, or just one, or perhaps none.
  """

  def file_event(file_path, runner \\ Application.get_env(:tddex, :runner)) do
    # TODO:
    # Hm... Modes.
    # 1. Run all test files when a file is saved can be a start.
    # 2. Try to find a test for the file saved.
    # 3. Filter by a file or directory.

    runner.run(['.'])
  end
end
