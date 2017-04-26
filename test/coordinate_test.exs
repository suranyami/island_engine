defmodule CoordinateTest do
  alias IslandEngine.Coordinate
  use ExUnit.Case
  doctest Coordinate

  test "sets in_island" do
    {:ok, coord} = Coordinate.start_link()
    Coordinate.set_in_island(coord, :my_island)
    assert Coordinate.in_island?(coord)
    assert Coordinate.to_s(coord) == "(in_island:my_island, guessed:false)"
  end
end
