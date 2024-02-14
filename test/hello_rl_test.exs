defmodule HelloRlTest do
  use ExUnit.Case
  doctest HelloRl

  test "greets the world" do
    assert HelloRl.hello() == :world
  end
end
