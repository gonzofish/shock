defmodule Mix.Tasks.Shock.Init do
  use Mix.Task

  def run(_) do
    Shock.Scaffold.initialize
  end
end