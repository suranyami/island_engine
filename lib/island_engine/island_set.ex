defmodule IslandEngine.IslandSet do
  alias IslandEngine.{Island, IslandSet}
  defstruct atoll: :none, dot: :none, l_shape: :none, s_shape: :none, square: :none

  def start_link do
    Agent.start_link(fn -> initialized_set() end)
  end

  defp initialized_set do
    Enum.reduce(keys(), %IslandSet{}, fn key, set ->
      {:ok, island} = Island.start_link()
      Map.put(set, key, island)
    end)
  end

  defp keys do
    %IslandSet{}
    |> Map.from_struct
    |> Map.keys
  end

  def to_s(island_set) do
    "%IslandSet{" <> string_body(island_set) <> "}"
  end

  defp string_body(island_set) do
    Enum.reduce(keys(), "", fn key, acc ->
      island = Agent.get(island_set, &(Map.fetch!(&1, key)))
      acc <> "#{key} => " <> Island.to_s(island) <> "\n"
    end)
  end
end
