defmodule Tddex.File.WatcherTest do
  use ExUnit.Case, async: true

  alias Tddex.File.Watcher

  import ExUnit.CaptureIO

  # This behaves funny in the CI, gotta make it bigger, maybe extract this
  def timeout_multiplier do
    if Application.get_env(:tddex, :ci) do
      20
    else
      1
    end
  end

  def timeout(ms) do
    ms * timeout_multiplier()
  end

  setup do
    {:ok, dir_path} = Temp.mkdir()

    on_exit(fn ->
      File.rm_rf(dir_path)
    end)

    %{dir_path: dir_path}
  end

  test "init/1", %{dir_path: dir_path} do
    assert capture_io(fn ->
      {:ok, %{watcher_pid: _pid}} = Watcher.init(dirs: [dir_path])
    end) |> String.match?(~r/Tddex started and watching over the sub directories at/)
  end

  test "file being added and getting updates", %{dir_path: dir_path} do
    capture_io(fn ->
      {:ok, %{watcher_pid: pid}} = Watcher.init(dirs: [dir_path])
      :timer.sleep(timeout(200))
      File.write(Path.join(dir_path, "1984"), "Winston Smith")

      assert_receive {:file_event, ^pid, {_path, _events}}, timeout(10_000)
    end)
  end
end
