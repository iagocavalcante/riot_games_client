defmodule RiotGames.LeagueOfLegends do
  alias RiotGames

  @doc """
  Fetches the active game of a summoner.

  ## Required

  * `summoner_id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def active_game_by_summoner(summoner_id, region \\ "na1") when is_binary(summoner_id),
    do: RiotGames.get(region, "/lol/spectator/v4/active-games/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches the champion masteries of a summoner.

  ## Required

  * `summoner_id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def champion_masteries(summoner_id, region \\ "na1") when is_binary(summoner_id) do
    RiotGames.get(region, "/lol/champion-mastery/v4/champion-masteries/by-summoner/:id",
      id: summoner_id
    )
  end

  @doc """
  Fetches the champion masteries score of a summoner.

  ## Required

  * `summoner_id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def champion_masteries_score(summoner_id, region \\ "na1") when is_binary(summoner_id),
    do: RiotGames.get(region, "/lol/champion-mastery/v4/scores/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches the top champion masteries of a summoner.

  ## Required

  * `summoner_id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  * `count` - The number of top champion masteries to fetch. Defaults to 3.
  """
  def champion_masteries_top(summoner_id, opts \\ []) when is_binary(summoner_id) do
    region = Keyword.get(opts, :region, "na1")

    RiotGames.get(
      region,
      "/lol/champion-mastery/v4/champion-masteries/by-summoner/:id/top",
      [id: summoner_id],
      opts
    )
  end

  @doc """
  Fetches the champion mastery score of a summoner.

  ## Required

  * `summoner_id` - The summoner ID.
  * `champion_id` - The champion ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def champion_mastery(summoner_id, champion_id, region \\ "na1")
      when is_binary(summoner_id) and is_integer(champion_id) do
    RiotGames.get(
      region,
      "/lol/champion-mastery/v4/champion-masteries/by-summoner/:summoner_id/by-champion/:champion_id",
      summoner_id: summoner_id,
      champion_id: champion_id
    )
  end

  @doc """
  Fetches a challenge configuration

  ## Required

  * `challenge_id` - The challenge ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def challenge_config(challenge_id, region \\ "na1") when is_binary(challenge_id),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/:id/config", id: challenge_id)

  @doc """
  Fetches a challenge leaderboard

  ## Required

  * `challenge_id` - The challenge ID.
  * `level` - The challenge level. Valid values: MASTER, GRANDMASTER, and CHALLENGER

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  * `limit` - The number of entries to fetch.
  """
  def challenge_leaderboard(challenge_id, level, opts \\ [])
      when is_binary(challenge_id) and is_binary(level) do
    region = Keyword.get(opts, :region, "na1")

    RiotGames.get(
      region,
      "/lol/challenges/v1/challenges/:id/leaderboards/:level",
      [id: challenge_id, level: level],
      opts
    )
  end

  @doc """
  Fetches a map of level to percentile of players who have achieved it for a challenge

  ## Required

  * `challenge_id` - The challenge ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def chellenge_percentile(challenge_id, region \\ "na1") when is_binary(challenge_id),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/:id/percentiles", id: challenge_id)

  @doc """
  Fetches the challenger league for a queue.

  ## Required

  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT, RANKED_TFT

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def challenger_league(queue, region \\ "na1") when is_binary(queue),
    do: RiotGames.get(region, "/lol/league/v4/challengerleagues/by-queue/:queue", queue: queue)

  @doc """
  Fetches a list of all basic challenge configuration information

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def challenges_config(region \\ "na1"),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/config")

  @doc """
  Fetches a map of level to percentile of players who have achieved it.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def challenges_percentiles(region \\ "na1"),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/percentiles")

  @doc """
  Fetches a list of all challenges for a given player

  ## Required

  * `puuid` - The player ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def challenges_by_player(puuid, region \\ "na1") when is_binary(puuid),
    do: RiotGames.get(region, "/lol/challenges/v1/player-data/:id", id: puuid)

  @doc """
  Fetches the champion rotations

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def champion_rotations(region \\ "na1"),
    do: RiotGames.get(region, "/lol/platform/v3/champion-rotations")

  @doc """
  Fetches a clash player by puuid.

  ## Required

  * `puuid` - The player ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def clash_player_by_puuid(puuid, region \\ "na1") when is_binary(puuid),
    do: RiotGames.get(region, "/lol/clash/v1/players/by-puuid/:id", id: puuid)

  @doc """
  Fetches a clash player by summoner ID.

  ## Required

  * `summoner_id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def clash_player_by_summoner_id(summoner_id, region \\ "na1") when is_binary(summoner_id),
    do: RiotGames.get(region, "/lol/clash/v1/players/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches a clash team by ID.

  ## Required

  * `team_id` - The team ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def clash_team(team_id, region \\ "na1") when is_binary(team_id),
    do: RiotGames.get(region, "/lol/clash/v1/teams/:id", id: team_id)

  @doc """
  Fetches clash tournaments.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def clash_tournaments(region \\ "na1"),
    do: RiotGames.get(region, "/lol/clash/v1/tournaments")

  @doc """
  Fetches clash tournaments by team ID.

  ## Required

  * `team_id` - The team ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def clash_tournaments_by_team(team_id, region \\ "na1") when is_binary(team_id),
    do: RiotGames.get(region, "/lol/clash/v1/tournaments/by-team/:id", id: team_id)

  @doc """
  Fetches clash tournament by tournament ID.

  ## Required

  * `tournament_id` - The tournament ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def clash_tournament(tournament_id, region \\ "na1") when is_binary(tournament_id),
    do: RiotGames.get(region, "/lol/clash/v1/tournaments/:id", id: tournament_id)

  @doc """
  Fetches a list of featured games.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def featured_games(region \\ "na1"),
    do: RiotGames.get(region, "/lol/spectator/v4/featured-games")

  @doc """
  Fetches the grandmaster league for a queue.

  ## Required

  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT, RANKED_TFT

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def grandmaster_league(queue, region \\ "na1") when is_binary(queue),
    do: RiotGames.get(region, "/lol/league/v4/grandmasterleagues/by-queue/:queue", queue: queue)

  @doc """
  Fetches a league with given ID.

  ## Required

  * `league_id` - The league ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def league(league_id, region \\ "na1") when is_binary(league_id),
    do: RiotGames.get(region, "/lol/league/v4/leagues/:id", id: league_id)

  @doc """
  Fetches all the league entries

  ## Required

  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT, RANKED_TFT
  * `tier` - The tier type. Valid values: CHALLENGER, GRANDMASTER, MASTER, DIAMOND, PLATINUM, GOLD, SILVER, BRONZE, IRON
  * `division` - The division type. Valid values: I, II, III, IV

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  * `page` - The page to use for pagination. Defaults to 1.
  """
  def league_entries(queue, tier, division, opts \\ [])
      when is_binary(queue) and is_binary(tier) and is_binary(division) do
    region = Keyword.get(opts, :region, "na1")

    RiotGames.get(
      region,
      "/lol/league/v4/entries/:queue/:tier/:division",
      [queue: queue, tier: tier, division: division],
      opts
    )
  end

  @doc """
  Fetches the master league for a queue.

  ## Required

  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT, RANKED_TFT

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def master_league(queue, region \\ "na1") when is_binary(queue),
    do: RiotGames.get(region, "/lol/league/v4/masterleagues/by-queue/:queue", queue: queue)

  @doc """
  Fetches a match by match ID.

  ## Required

  * `match_id` - The match ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "AMERICAS".
  """
  def match(match_id, region \\ "AMERICAS") when is_binary(match_id),
    do: RiotGames.get(region, "/lol/match/v5/matches/:id", id: match_id)

  @doc """
  Fetches a match timeline by match ID.

  ## Required

  * `match_id` - The match ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "AMERICAS".
  """
  def match_timeline(match_id, region \\ "AMERICAS") when is_binary(match_id),
    do: RiotGames.get(region, "/lol/match/v5/matches/:id/timeline", id: match_id)

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
    RiotGames.get(region, "/lol/match/v5/matches/by-puuid/:id/ids", [id: puuid], opts)
  end

  @doc """
  Fetches the status of the platform.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def status(region \\ "na1"), do: RiotGames.get(region, "/lol/status/v4/platform-data")

  @doc """

  Fetches a summoner by account ID.

  ## Required

  * `account_id` - The account ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def summoner_by_account_id(account_id, region \\ "na1") when is_binary(account_id),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/by-account/:id", id: account_id)

  @doc """
  Fetches a summoner by summoner ID.

  ## Required

  * `id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def summoner_by_id(id, region \\ "na1") when is_binary(id),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/:id", id: id)

  @doc """
  Fetches a summoner by name.

  ## Required

  * `name` - The summoner name.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def summoner_by_name(name, region \\ "na1") when is_binary(name),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/by-name/:name", name: name)

  @doc """
  Fetches a summoner by PUUID.

  ## Required

  * `puuid` - The summoner PUUID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def summoner_by_puuid(puuid, region \\ "na1") when is_binary(puuid),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/by-puuid/:id", id: puuid)

  @doc """
  Fetches the leagues of a summoner.

  ## Required

  * `summoner_id` - The summoner ID.

  ## Optional

  * `region` - The region of the summoner. Defaults to "na1".
  """
  def summoner_leagues(summoner_id, region \\ "na1") when is_binary(summoner_id),
    do: RiotGames.get(region, "/lol/league/v4/entries/by-summoner/:id", id: summoner_id)
end
