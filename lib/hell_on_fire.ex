defmodule HellOnFire do
  alias HellOnFire.Tree

  @doc """
  Entry point to start algorithm and execute all steps.
  """
  def main(triangle) do
    triangle
    |>generate_triangle()
    |>Tree.build_tree()
    |>Tree.max_sum(0)
    |>IO.inspect()
  end

  defp generate_triangle(string) do
    string
    |>Code.eval_string()
    |>pick_list()
  end

  defp pick_list({list, _whatever}), do: list


end
