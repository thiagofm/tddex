defmodule Tddex.File.WatcherTest do
  use ExUnit.Case

  alias Tddex.File.Watcher

  setup do
    {:ok, dir_path} = Temp.mkdir()

    on_exit(fn ->
      File.rm_rf(dir_path)
    end)

    %{dir_path: dir_path}
  end

  test "init/1", %{dir_path: dir_path} do
    assert {:ok, %{watcher_pid: pid}} = Watcher.init(dirs: [dir_path])
  end

  test "file being added and getting updates", %{dir_path: dir_path} do
    {:ok, %{watcher_pid: pid}} = Watcher.init(dirs: [dir_path])

    :timer.sleep(200)
    File.write(Path.join(dir_path, "1984"), "Winston Smith")

    assert_receive {:file_event, ^pid, {_path, _events}}, 1000
  end
end
