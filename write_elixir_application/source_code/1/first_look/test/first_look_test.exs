defmodule FirstLookTest do
  use ExUnit.Case
  doctest FirstLook

  test "greets the world" do
    assert FirstLook.hello() == :world
  end
end
