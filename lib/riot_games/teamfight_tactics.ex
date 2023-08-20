defmodule RiotGames.TeamfightTactics do
  alias RiotGames

  @doc """
  Fetches the challenger league.

  ## Required

  * `region` - The region of the challenger league.
  """
  def challenger_league(region) when is_binary(region),
    do: RiotGames.get(region, "/tft/league/v1/challenger")

  @doc """
  Fetches the grandmaster league.

  ## Required

  * `region` - The region of the grandmaster league.
  """
  def grandmaster_league(region) when is_binary(region),
    do: RiotGames.get(region, "/tft/league/v1/grandmaster")

  @doc """
  Fetches the league by id.

  ## Required

  * `region` - The region of the league.
  * `league_id` - The league id to fetch.
  """
  def league(region, league_id) when is_binary(region) and is_binary(league_id),
    do: RiotGames.get(region, "/tft/league/v1/leagues/:id", id: league_id)

  @doc """
  Fetches the league by summoner id.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner id to fetch.
  """
  def league_by_summoner(region, summoner_id) when is_binary(region) and is_binary(summoner_id),
    do: RiotGames.get(region, "/tft/league/v1/entries/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches the league entries in a tier and division.

  ## Required

  * `region` - The region of the league.
  * `tier` - The tier to fetch.
  * `division` - The division to fetch.

  ## Optional

  * `page` - The page to fetch.
  """
  def league_entries(region, tier, division, page \\ 1)
      when is_binary(region) and is_binary(tier) and is_binary(division) and is_integer(page) do
    RiotGames.get(
      region,
      "/tft/league/v1/entries/:tier/:division",
      [tier: tier, division: division],
      page: page
    )
  end

  @doc """
  Fetches the master league.

  ## Required

  * `region` - The region of the master league.
  """
  def master_league(region) when is_binary(region),
    do: RiotGames.get(region, "/tft/league/v1/master")

  @doc """
  Fetches the match by id.

  ## Required

  * `region` - The region of the match.
  * `match_id` - The match id to fetch.
  """
  def match(region, match_id) when is_binary(region) and is_binary(match_id),
    do: RiotGames.get(region, "/tft/match/v1/matches/:id", id: match_id)

  @doc """
  Fetches a list of match IDs for a player.

  ## Required

  * `region` - The region of the player.
  * `puuid` - The player ID.

  ## Optional

  * `startTime` - The start time to use for filtering match IDs.
  * `endTime` - The end time to use for filtering match IDs.
  * `queue` - The queue to use for filtering match IDs.
  * `type` - The type to use for filtering match IDs.
  * `start` - The start index to use for filtering match IDs.
  * `count` - The count to use for filtering match IDs.
  """
  def matches_by_player(region, puuid, opts \\ []) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/tft/match/v1/matches/by-puuid/:id/ids", [id: puuid], opts)

  @doc """
  Fetches the status of the platform.

  ## Required

  * `region` - The region of the platform.
  """
  def status(region) when is_binary(region),
    do: RiotGames.get(region, "/tft/status/v1/platform-data")

  @doc """
  Fetches the summoner by account id.

  ## Required

  * `region` - The region of the summoner.
  * `account_id` - The account id to fetch.
  """
  def summoner_by_account_id(region, account_id) when is_binary(region) and is_binary(account_id),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/by-account/:id", id: account_id)

  @doc """
  Fetches the summoner by summoner id.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner id to fetch.
  """
  def summoner_by_id(region, summoner_id) when is_binary(region) and is_binary(summoner_id),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/:id", id: summoner_id)

  @doc """
  Fetches the summoner by name.

  ## Required

  * `region` - The region of the summoner.
  * `name` - The name to fetch.
  """
  def summoner_by_name(region, name) when is_binary(region) and is_binary(name),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/by-name/:name", name: name)

  @doc """
  Fetches the summoner by puuid.

  ## Required

  * `region` - The region of the summoner.
  * `puuid` - The puuid to fetch.
  """
  def summoner_by_puuid(region, puuid) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/tft/summoner/v1/summoners/by-puuid/:id", id: puuid)

  @doc """
  Fetches the top rated ladder for a queue.

  ## Required

  * `region` - The region of the ladder.
  * `queue_id` - The queue id to fetch the top rated ladder for.
  """
  def top_rated_ladder(region, queue_id) when is_binary(region) and is_binary(queue_id),
    do: RiotGames.get(region, "/tft/league/v1/rated-ladders/:queue/top", queue: queue_id)
end
