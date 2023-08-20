defmodule RiotGames.Valorant do
  alias RiotGames

  @doc """
  Fetches valorant content.

  ## Required

  * `region` - The region to fetch content for.

  ## Optional

  * `locale` - The locale to fetch content for.
  """
  def content(region, locale \\ nil) when is_binary(region),
    do: RiotGames.get(region, "/val/content/v1/contents", [], locale: locale)

  @doc """
  Fetches match by id.

  ## Required

  * `region` - The region of the match.
  * `match_id` - The match id to fetch.
  """
  def match(region, match_id) when is_binary(region) and is_binary(match_id),
    do: RiotGames.get(region, "/val/match/v1/matches/:id", id: match_id)

  @doc """
  Fetches matchlist by puuid.

  ## Required

  * `region` - The region of the matchlist.
  * `puuid` - The puuid to fetch matchlist for.
  """
  def matchlist(region, puuid) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/val/match/v1/matchlists/by-puuid/:puuid", puuid: puuid)

  @doc """
  Fetches leaderboard by act id.

  ## Required

  * `region` - The region of the leaderboard.
  * `act_id` - The act id to fetch leaderboard for.

  ## Optional

  * `size` - The number of entries to fetch.
  * `startIndex` - The index to start fetching entries from.
  """
  def ranked_leaderboard(region, act_id, opts \\ []) when is_binary(region) and is_binary(act_id),
    do: RiotGames.get(region, "/val/ranked/v1/leaderboards/by-act/:id", [id: act_id], opts)

  @doc """
  Fetches recent matches by queue id.

  ## Required

  * `region` - The region of the recent matches.
  * `queue_id` - The queue id to fetch recent matches for.
  """
  def recent_matches(region, queue_id) when is_binary(region) and is_binary(queue_id) do
    RiotGames.get(region, "/val/match/v1/recent-matches/by-queue/:queue_id", queue_id: queue_id)
  end

  @doc """
  Fetches the status of the platform.

  ## Required

  * `region` - The region of the platform.
  """
  def status(region) when is_binary(region),
    do: RiotGames.get(region, "/val/status/v1/platform-data")
end
