defmodule Mix.Tasks.Exec do
  use Mix.Task
  @shortdoc "Command line tool to run project"
  def run(args) do
    args
    |> Enum.at(0)
    |> HellOnFire.main()
  end
end
