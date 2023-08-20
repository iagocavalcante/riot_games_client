defmodule RiotGames.LegendsOfRuneterra do
  alias RiotGames

  @doc """
  Fetches match by id.

  ## Required

  * `region` - The region of the match.
  * `match_id` - The match id to fetch.
  """
  def match(region, match_id) when is_binary(region) and is_binary(match_id),
    do: RiotGames.get(region, "/lor/match/v1/matches/:id", id: match_id)

  @doc """
  Fetches matches by puuid.

  ## Required

  * `region` - The region of the matches.
  * `puuid` - The puuid to fetch matches for.
  """
  def matches_by_player(region, puuid) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/lor/match/v1/matches/by-puuid/:puuid/ids", puuid: puuid)

  @doc """
  Fetches the ranked leaderboard.

  ## Required

  * `region` - The region of the leaderboard.
  """
  def ranked_leaderboard(region) when is_binary(region),
    do: RiotGames.get(region, "/lor/ranked/v1/leaderboards")

  @doc """
  Fetches the status of the platform.

  ## Required

  * `region` - The region to of the platform.
  """
  def status(region) when is_binary(region),
    do: RiotGames.get(region, "/lor/status/v1/platform-data")
end
