defmodule Tddex.HandlerTest do
  use ExUnit.Case, async: true
  import Mox
  alias Tddex.Handler

  setup :verify_on_exit!

  test "file_event/1" do
   {:ok, _fd, file_path} = Temp.open "test-file"

    Tddex.RunnerMock
    |> expect(:run, fn file_paths ->
      assert file_paths == [file_path]
    end)

    assert Handler.file_event(file_path)
  end
end
