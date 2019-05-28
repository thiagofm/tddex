defmodule Tddex.Handler do
  alias Tddex.Runner

  def file_event(file_path) do
    IO.inspect "Test changed: #{file_path}"
    # Hm... Modes.
    # 1. Run all test files when a file is saved can be a start.
    # 2. Try to find a test for the file saved.
    # 3. Filter by a file or directory.
    Tddex.Runner.run([file_path])
  end
end
