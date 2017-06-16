defmodule Mix.Tasks.Vestibulum.Init do
  use Mix.Task

  def run(_) do
    Vestibulum.Scaffold.initialize
  end
end