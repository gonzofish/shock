ExUnit.start()

defmodule TestHelper do
  def cleanup do
    File.rm_rf "./site.yml"
    File.rm_rf "./src"
  end
end