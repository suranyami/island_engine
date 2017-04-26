defmodule IslandTest do
  alias IslandEngine.Island
  use ExUnit.Case
  doctest IslandEngine.Island

  setup do
    {:ok, island} = Island.start_link()
    [island: island]
  end

  test "can replace coordinates", context do
    island = context[:island]
    Island.replace_coordinates(island, [:a1, :b2])
    assert Island.get_coordinates(island) == [:a1, :b2]
  end
end
