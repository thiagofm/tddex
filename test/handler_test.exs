defmodule Tddex.HandlerTest do
  use ExUnit.Case, async: true
  import Mox
  alias Tddex.Handler

  setup :verify_on_exit!

  test "file_event/1" do
    {:ok, _fd, file_path} = Temp.open("test-file")

    Tddex.RunnerMock
    |> expect(:run, fn file_paths ->
      assert file_paths == ['.']
    end)

    assert Handler.file_event(file_path)
  end

  test "file_event/1 when changed file is in a hidden directory" do
    {:ok, cwd} = File.cwd()
    path = cwd <> "/_build/test/lib/tddex/.mix/.mix_test_failures"

    Handler.file_event(path)
  end

  test "ignored_path?/1" do
    {:ok, cwd} = File.cwd()
    path = cwd <> "/_build/test/lib/tddex/.mix/.mix_test_failures"

    assert Handler.ignored_path?(path)
    assert Handler.ignored_path?("./.git/foo")
    refute Handler.ignored_path?("./lib/handler.ex")
  end
end
