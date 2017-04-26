defmodule IslandSetTest do
  alias IslandEngine.{IslandSet, Island}
  use ExUnit.Case
  doctest IslandEngine.IslandSet

  setup do
    {:ok, island_set} = IslandSet.start_link()
    [island_set: island_set]
  end
end
