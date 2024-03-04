defmodule RiotGames.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "An Elixir HTTP Client for the Riot Games API"

  def project do
    [
      app: :riot_games_client,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: @description,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      mod: {RiotGames, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:req, "~> 0.4.0"},
      {:simple_rate_limiter, "~> 1.0"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/joeychilson/riot_games_client"},
      maintainers: ["Joey Chilson"]
    ]
  end
end
