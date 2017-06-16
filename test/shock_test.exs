defmodule ShockTest do
  use ExUnit.Case
  doctest Shock

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "not true" do
    assert 1 + 2 != 2
  end
end
