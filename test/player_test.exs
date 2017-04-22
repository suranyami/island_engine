defmodule PlayerTest do
  alias IslandEngine.Player
  use ExUnit.Case
  doctest IslandEngine.Player

  test "can set name" do
    {:ok, player} = Player.start_link("Fred")
    Player.set_name(player, "Adrian")
    assert Player.get_name(player) == "Adrian"
  end
end
