defmodule RiotGames.LegendsOfRuneterra do
  alias RiotGames

  @doc """
  Fetches match by id.

  ## Required

  * `match_id` - The match id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"americas"`.
  """
  def match(match_id, region \\ "americas"),
    do: RiotGames.get(region, "/lor/match/v1/matches/:id", id: match_id)

  @doc """
  Fetches matches by puuid.

  ## Required

  * `puuid` - The puuid to fetch matches for.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"americas"`.
  """
  def matches_by_player(puuid, region \\ "americas"),
    do: RiotGames.get(region, "/lor/match/v1/matches/by-puuid/:puuid/ids", puuid: puuid)

  @doc """
  Fetches the ranked leaderboard.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"americas"`.
  """
  def ranked_leaderboard(region \\ "americas"),
    do: RiotGames.get(region, "/lor/ranked/v1/leaderboards")

  @doc """
  Fetches the status of the platform.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"americas"`.
  """
  def status(region \\ "americas"), do: RiotGames.get(region, "/lor/status/v1/platform-data")
end
