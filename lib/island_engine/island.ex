defmodule IslandEngine.Island do
  alias IslandEngine.Coordinate

  def start_link do
    Agent.start_link(fn -> [] end)
  end

  def replace_coordinates(island, new_coordinates) when is_list new_coordinates do
    Agent.update(island, fn _state -> new_coordinates end)
  end

  def to_s(island) do
    island_string =
      island
      |> Agent.get(fn state -> state end)
      |> Enum.reduce("", fn coord, acc -> "#{acc}, #{Coordinate.to_s(coord)}" end)
    "[" <> String.replace_leading(island_string, ", ", "") <> "]"
  end
end
