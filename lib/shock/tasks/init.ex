defmodule Shock.Tasks.Initialize do
  def run(_) do
    Shock.Scaffold.initialize
  end
end