defmodule RiotGames.Valorant do
  alias RiotGames

  @doc """
  Fetches valorant content.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na"`.
  * `locale` - The locale to fetch content for.
  """
  def content(opts \\ []) do
    region = Keyword.get(opts, :region, "na")
    RiotGames.get(region, "/val/content/v1/contents", [], opts)
  end

  @doc """
  Fetches match by id.

  ## Required

  * `match_id` - The match id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na"`.
  """
  def match(match_id, region \\ "na"),
    do: RiotGames.get(region, "/val/match/v1/matches/:id", id: match_id)

  @doc """
  Fetches matchlist by puuid.

  ## Required

  * `puuid` - The puuid to fetch matchlist for.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na"`.
  """
  def matchlist(puuid, region \\ "na"),
    do: RiotGames.get(region, "/val/match/v1/matchlists/by-puuid/:puuid", puuid: puuid)

  @doc """
  Fetches leaderboard by act id.

  ## Required

  * `act_id` - The act id to fetch leaderboard for.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na"`.
  * `size` - The number of entries to fetch.
  * `startIndex` - The index to start fetching entries from.
  """
  def ranked_leaderboard(act_id, opts \\ []) do
    region = Keyword.get(opts, :region, "na")
    RiotGames.get(region, "/val/ranked/v1/leaderboards/by-act/:id", [id: act_id], opts)
  end

  @doc """
  Fetches recent matches by queue id.

  ## Required

  * `queue_id` - The queue id to fetch recent matches for.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na"`.
  """
  def recent_matches(queue_id, region \\ "na") do
    RiotGames.get(region, "/val/match/v1/recent-matches/by-queue/:queue_id", queue_id: queue_id)
  end

  @doc """
  Fetches the status of the platform.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na"`.
  """
  def status(region \\ "na"), do: RiotGames.get(region, "/val/status/v1/platform-data")
end
