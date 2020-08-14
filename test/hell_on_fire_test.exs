defmodule HellOnFireTest do
  use ExUnit.Case
  doctest HellOnFire

  test "greets the world" do
    assert HellOnFire.hello() == :world
  end
end
