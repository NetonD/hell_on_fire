defmodule HellOnFire.Tree do
  alias HellOnFire.Tree.NodeTree

  @doc """
  Given an list representing an triangle return a tree
  with node values are valid paths into triangle
  """
  def build_tree(triangle, index \\ 0) do
    line = Enum.at(triangle, 0)

    if length(triangle) == 1 do
      line
      |> Enum.at(index)
      |> NodeTree.new(nil, nil)
    else
      left =
        triangle
        |> Enum.drop(1)
        |> build_tree(index)

      right =
        triangle
        |> Enum.drop(1)
        |> build_tree(index + 1)

      line
      |> Enum.at(index)
      |> NodeTree.new(left, right)
    end
  end

  @doc """
  Walking recursively along tree adding parallel values
  children node with values father node
  """
  def max_sum(node, amount) do
    if node == nil do
      amount
    else
      %{left: left, right: right, value: value_node} = node
      left_sum = max_sum(left, amount + value_node)
      right_sum = max_sum(right, amount + value_node)
      max(left_sum, right_sum)
    end
  end
end
