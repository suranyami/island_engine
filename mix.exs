defmodule IslandEngine.Mixfile do
  use Mix.Project

  def project do
    [
      app: :island_engine,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {IslandEngine.Application, []}
    ]
  end

  defp deps do
    [
      {:mix_test_watch, "~> 0.3", only: :dev},
      {:dogma, "~> 0.1", only: [:dev, :test]},
      {:ex_unit_notifier, "~> 0.1", only: :test}
    ]
  end
end
