# RiotGames

An Elixir HTTP Client for the Riot Games API

## Installation

`RiotGames` is available on Hex. Add it to your list of dependencies in mix.exs:

```elixir
def deps do
  [
    {:riot_games_client, "~> 0.1.0"}
  ]
end
```

## Configuration

Add your API key to your config.exs file:

```elixir
config :riot_games_client, :api_key, ""
```

You can set rate limit for API calls.

```elixir
config :riot_games_client, :interval, 120_000
config :riot_games_client, :max, 100
```
