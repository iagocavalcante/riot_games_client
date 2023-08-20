defmodule RiotGames.TeamfightTactics do
  alias RiotGames

  @doc """
  Fetches the challenger league.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def challenger_league(region \\ "na1"), do: RiotGames.get(region, "/tft/league/v1/challenger")

  @doc """
  Fetches the grandmaster league.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def grandmaster_league(region \\ "na1"), do: RiotGames.get(region, "/tft/league/v1/grandmaster")

  @doc """
  Fetches the league by id.

  ## Required

  * `league_id` - The league id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def league(league_id, region \\ "na1"),
    do: RiotGames.get(region, "/tft/league/v1/leagues/:id", id: league_id)

  @doc """
  Fetches the league by summoner id.

  ## Required

  * `summoner_id` - The summoner id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def league_by_summoner(summoner_id, region \\ "na1"),
    do: RiotGames.get(region, "/tft/league/v1/entries/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches the league entries in a tier and division.

  ## Required

  * `tier` - The tier to fetch.
  * `division` - The division to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  * `page` - The page to fetch.
  """
  def league_entries(tier, division, opts \\ []) do
    region = Keyword.get(opts, :region, "na1")

    RiotGames.get(
      region,
      "/tft/league/v1/entries/:tier/:division",
      [tier: tier, division: division],
      opts
    )
  end

  @doc """
  Fetches the master league.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def master_league(region \\ "na1"), do: RiotGames.get(region, "/tft/league/v1/master")

  @doc """
  Fetches the match by id.

  ## Required

  * `match_id` - The match id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def match(match_id, region \\ "na1"),
    do: RiotGames.get(region, "/tft/match/v1/matches/:id", id: match_id)

  @doc """
  Fetches a list of match IDs for a player.

  ## Required

  * `puuid` - The player ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "AMERICAS".
  * `startTime` - The start time to use for filtering match IDs.
  * `endTime` - The end time to use for filtering match IDs.
  * `queue` - The queue to use for filtering match IDs.
  * `type` - The type to use for filtering match IDs.
  * `start` - The start index to use for filtering match IDs.
  * `count` - The count to use for filtering match IDs.
  """
  def matches_by_player(puuid, opts \\ []) when is_binary(puuid) do
    region = Keyword.get(opts, :region, "AMERICAS")
    RiotGames.get(region, "/tft/match/v1/matches/by-puuid/:id/ids", [id: puuid], opts)
  end

  @doc """
  Fetches the status of the platform.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def status(region \\ "na1"), do: RiotGames.get(region, "/tft/status/v1/platform-data")

  @doc """
  Fetches the summoner by account id.

  ## Required

  * `account_id` - The account id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def summoner_by_account_id(account_id, region \\ "na1"),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/by-account/:id", id: account_id)

  @doc """
  Fetches the summoner by summoner id.

  ## Required

  * `summoner_id` - The summoner id to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def summoner_by_id(summoner_id, region \\ "na1"),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/:id", id: summoner_id)

  @doc """
  Fetches the summoner by name.

  ## Required

  * `name` - The name to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def summoner_by_name(name, region \\ "na1"),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/by-name/:name", name: name)

  @doc """
  Fetches the summoner by puuid.

  ## Required

  * `puuid` - The puuid to fetch.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def summoner_by_puuid(puuid, region \\ "na1"),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/by-puuid/:id", id: puuid)

  @doc """
  Fetches the top rated ladder for a queue.

  ## Required

  * `queue_id` - The queue id to fetch the top rated ladder for.

  ## Optional

  * `region` - The region to fetch content for. Defaults to `"na1"`.
  """
  def top_rated_ladder(queue_id, region \\ "na1"),
    do: RiotGames.get(region, "/tft/league/v1/rated-ladders/:queue/top", queue: queue_id)
end
