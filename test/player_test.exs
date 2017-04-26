defmodule PlayerTest do
  alias IslandEngine.{Player, Island}
  use ExUnit.Case
  doctest IslandEngine.Player

  setup do
    {:ok, player} = Player.start_link("Fred")
    [player: player]
  end

  test "can set name", context do
    player = context[:player]
    Player.set_name(player, "Adrian")
    assert Player.get_name(player) == "Adrian"
  end

  test "can set island coordinates", context do
    player = context[:player]
    Player.set_island_coordinates(player, :dot, [:a1, :a2])
    island = Player.get_island(player, :dot)
    coords = Island.get_coordinates(island)
    assert length(coords) == 2
  end
end
