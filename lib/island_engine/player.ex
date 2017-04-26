defmodule IslandEngine.Player do
  defstruct name: :none, board: :none, island_set: :none
  alias IslandEngine.{Board, IslandSet, Island, Coordinate, Player}

  def start_link(name \\ :none) do
    {:ok, board} = Board.start_link()
    {:ok, island_set} = IslandSet.start_link()

    Agent.start_link(fn -> %Player{board: board, island_set: island_set, name: name} end)
  end

  def set_name(player, name) do
    Agent.update(player,
    fn state -> Map.put(state, :name, name) end
    )
  end

  def get_name(player) do
    Agent.get(player, fn state -> Map.get(state, :name) end)
  end

  def to_s(player) do
    "%Player{" <> string_body(player) <> "}"
  end

  def get_board(player) do
    Agent.get(player, fn state -> state.board end)
  end

  def get_island_set(player) do
    Agent.get(player, fn state -> state.island_set end)
  end

  def set_island_coordinates(player, island_key, coordinates) do
    board = Player.get_board(player)
    island_set = Player.get_island_set(player)
    new_coordinates = convert_coordinates(board, coordinates)
    IslandSet.set_island_coordinates(island_set, island_key, new_coordinates)
  end

  def get_island(player, island_key) do
    island_set = Player.get_island_set(player)
    IslandSet.get_island(island_set, island_key)
  end

  def convert_coordinates(board, coordinates) do
    Enum.map(coordinates, fn coord -> convert_coordinate(board, coord) end)
  end

  def convert_coordinate(board, coordinate) when is_atom coordinate do
    Board.get_coordinate(board, coordinate)
  end

  def convert_coordinate(_board, coordinate) when is_pid coordinate do
    coordinate
  end

  def string_body(player) do
    state = Agent.get(player, &(&1))
    "name: " <> name_to_string(state.name) <> ",\n" <>
    "island_set: " <> IslandSet.to_s(state.island_set) <> ",\n" <>
    "board: " <> Board.to_s(state.board)
  end

  defp name_to_string(:none), do: ":none"
  defp name_to_string(name), do: name
end
