defmodule Tddex.HandlerTest do
  use ExUnit.Case

  alias Tddex.Handler

  test "file_event/1" do
   {:ok, _fd, file_path} = Temp.open "test-file"

    assert Handler.file_event(file_path) == file_path #TODO: must implement that
  end
end

