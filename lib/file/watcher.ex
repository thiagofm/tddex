defmodule Tddex.File.Watcher do
  @moduledoc """
  Watches out for File system events and acts based on it
  """

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    IO.inspect "Starting File Watcher" #TODO: verbose mode?
    IO.inspect args
    {:ok, watcher_pid} = FileSystem.start_link(args ++ [latency: 0]) #TODO: support other OSes
    FileSystem.subscribe(watcher_pid)
    {:ok, %{watcher_pid: watcher_pid}}
  end

  def handle_info({:file_event, _pid, {path, _events}}, state) do
    IO.inspect "File changed:" <> path
    {:noreply, state}
  end

  def handle_info({:file_event, watcher_pid, :stop}, %{watcher_pid: watcher_pid} = state) do
    # YOUR OWN LOGIC WHEN mONITOR STOP
    {:noreply, state}
  end
end
