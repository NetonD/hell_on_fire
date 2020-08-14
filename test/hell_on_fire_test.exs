defmodule HellOnFireTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias HellOnFire.Tree
  alias HellOnFire.Tree.NodeTree

  describe "main/1" do
    test "Test case with [[6],[3,5],[9,7,1],[4,6,8,4]]" do
      triangle = "[[6],[3,5],[9,7,1],[4,6,8,4]]"
      result = capture_io(fn -> HellOnFire.main(triangle) end) |> String.trim()

      assert result == "26"
    end

    test "Test case with [[1],[2,3],[4,5,6],[7,8,9,9]]" do
      triangle = "[[1],[2,3],[4,5,6],[7,8,9,9]]"
      result = capture_io(fn -> HellOnFire.main(triangle) end) |> String.trim()

      assert result == "19"
    end
  end

  describe "build/2" do
    test "Test to build a tree from list" do
      triangle = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 9]]
      result = Tree.build_tree(triangle, 0)

      expected_tree = %HellOnFire.Tree.NodeTree{
        left: %HellOnFire.Tree.NodeTree{
          left: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 7},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 8},
            value: 4
          },
          right: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 8},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            value: 5
          },
          value: 2
        },
        right: %HellOnFire.Tree.NodeTree{
          left: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 8},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            value: 5
          },
          right: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            value: 6
          },
          value: 3
        },
        value: 1
      }

      assert result == expected_tree
    end
  end

  describe "max_sum/2" do
    test "Find a max sum using directly the method max_sum" do
      triangle = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 9]]
      result_tree = Tree.build_tree(triangle, 0)

      expected_tree = %HellOnFire.Tree.NodeTree{
        left: %HellOnFire.Tree.NodeTree{
          left: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 7},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 8},
            value: 4
          },
          right: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 8},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            value: 5
          },
          value: 2
        },
        right: %HellOnFire.Tree.NodeTree{
          left: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 8},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            value: 5
          },
          right: %HellOnFire.Tree.NodeTree{
            left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
            value: 6
          },
          value: 3
        },
        value: 1
      }

      assert result_tree == expected_tree

      result_sum = Tree.max_sum(result_tree, 0)

      assert result_sum == 19
    end
  end

  describe "new/3" do
    test "Test to build a new node without children" do
      new_node = NodeTree.new(10, nil, nil)

      expected_node = %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 10}
      assert new_node == expected_node
    end

    test "Test to build a new node with childrens" do
      node_left = NodeTree.new(9, nil, nil)
      node_right = NodeTree.new(10, nil, nil)
      node_root = NodeTree.new(2, node_right, node_left)

      expected_node = %HellOnFire.Tree.NodeTree{
        left: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 10},
        right: %HellOnFire.Tree.NodeTree{left: nil, right: nil, value: 9},
        value: 2
      }

      assert node_root == expected_node
    end
  end
end
