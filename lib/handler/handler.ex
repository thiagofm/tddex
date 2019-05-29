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

    unless ignored_path?(file_path) do
      runner.run(['.'])
    end
  end

  def ignored_path?(path) do
    path
    |> Path.relative_to_cwd
    |> Path.split
    |> Enum.any?(fn path_fragment ->
      Regex.match?(~r/^(_.*|\..+)/, path_fragment)
    end)
  end
end
