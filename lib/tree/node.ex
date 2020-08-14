defmodule HellOnFire.Tree.NodeTree do
  defstruct value: nil, left: nil, right: nil

  def new(value, right, left) do
    %HellOnFire.Tree.NodeTree{
      value: value,
      right: right,
      left: left
    }
  end
end
