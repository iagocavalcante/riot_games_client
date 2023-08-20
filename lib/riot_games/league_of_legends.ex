defmodule RiotGames.LeagueOfLegends do
  alias RiotGames

  @doc """
  Fetches the active game of a summoner.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.
  """
  def active_game_by_summoner(region, summoner_id)
      when is_binary(region) and is_binary(summoner_id),
      do: RiotGames.get(region, "/lol/spectator/v4/active-games/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches the champion masteries of a summoner.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.
  """
  def champion_masteries(region, summoner_id) when is_binary(region) and is_binary(summoner_id) do
    RiotGames.get(region, "/lol/champion-mastery/v4/champion-masteries/by-summoner/:id",
      id: summoner_id
    )
  end

  @doc """
  Fetches the champion masteries score of a summoner.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.
  """
  def champion_masteries_score(region, summoner_id)
      when is_binary(region) and is_binary(summoner_id) do
    RiotGames.get(region, "/lol/champion-mastery/v4/scores/by-summoner/:id", id: summoner_id)
  end

  @doc """
  Fetches the top champion masteries of a summoner.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.

  ## Optional

  * `count` - The number of top champion masteries to fetch. Defaults to 3.
  """
  def champion_masteries_top(region, summoner_id, count \\ 3)
      when is_binary(region) and is_binary(summoner_id) and is_integer(count) do
    RiotGames.get(
      region,
      "/lol/champion-mastery/v4/champion-masteries/by-summoner/:id/top",
      [id: summoner_id],
      count: count
    )
  end

  @doc """
  Fetches the champion mastery score of a summoner.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.
  * `champion_id` - The champion ID.
  """
  def champion_mastery(region, summoner_id, champion_id)
      when is_binary(region) and is_binary(summoner_id) and is_integer(champion_id) do
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

  * `region` - The region to fetch content for.
  * `challenge_id` - The challenge ID.
  """
  def challenge_config(region, challenge_id) when is_binary(region) and is_binary(challenge_id),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/:id/config", id: challenge_id)

  @doc """
  Fetches a challenge leaderboard

  ## Required

  * `region` - The region to fetch content for.
  * `challenge_id` - The challenge ID.
  * `level` - The challenge level. Valid values: MASTER, GRANDMASTER, and CHALLENGER

  ## Optional

  * `limit` - The number of entries to fetch.
  """
  def challenge_leaderboard(region, challenge_id, level, limit \\ nil)
      when is_binary(region) and is_binary(challenge_id) and is_binary(level) do
    RiotGames.get(
      region,
      "/lol/challenges/v1/challenges/:id/leaderboards/:level",
      [id: challenge_id, level: level],
      limit: limit
    )
  end

  @doc """
  Fetches a map of level to percentile of players who have achieved it for a challenge

  ## Required

  * `region` - The region to fetch content for.
  * `challenge_id` - The challenge ID.
  """
  def chellenge_percentile(region, challenge_id)
      when is_binary(region) and is_binary(challenge_id),
      do: RiotGames.get(region, "/lol/challenges/v1/challenges/:id/percentiles", id: challenge_id)

  @doc """
  Fetches the challenger league for a queue.

  ## Required

  * `region` - The region to fetch content for.
  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT, RANKED_TFT
  """
  def challenger_league(region, queue) when is_binary(region) and is_binary(queue),
    do: RiotGames.get(region, "/lol/league/v4/challengerleagues/by-queue/:queue", queue: queue)

  @doc """
  Fetches a list of all basic challenge configuration information

  ## Required

  * `region` - The region to fetch content for.
  """
  def challenges_config(region) when is_binary(region),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/config")

  @doc """
  Fetches a map of level to percentile of players who have achieved it.

  ## Required

  * `region` - The region to fetch content for.
  """
  def challenges_percentiles(region) when is_binary(region),
    do: RiotGames.get(region, "/lol/challenges/v1/challenges/percentiles")

  @doc """
  Fetches a list of all challenges for a given player

  ## Required

  * `region` - The region of the player.
  * `puuid` - The player ID.
  """
  def challenges_by_player(region, puuid) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/lol/challenges/v1/player-data/:id", id: puuid)

  @doc """
  Fetches the champion rotations

  ## Required

  * `region` - The region to fetch content for.
  """
  def champion_rotations(region) when is_binary(region),
    do: RiotGames.get(region, "/lol/platform/v3/champion-rotations")

  @doc """
  Fetches a clash player by puuid.

  ## Required

  * `region` - The region of the player.
  * `puuid` - The player ID.
  """
  def clash_player_by_puuid(region, puuid) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/lol/clash/v1/players/by-puuid/:id", id: puuid)

  @doc """
  Fetches a clash player by summoner ID.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.
  """
  def clash_player_by_summoner_id(region, summoner_id)
      when is_binary(region) and is_binary(summoner_id),
      do: RiotGames.get(region, "/lol/clash/v1/players/by-summoner/:id", id: summoner_id)

  @doc """
  Fetches a clash team by ID.

  ## Required

  * `region` - The region of the team.
  * `team_id` - The team ID.
  """
  def clash_team(region, team_id) when is_binary(region) and is_binary(team_id),
    do: RiotGames.get(region, "/lol/clash/v1/teams/:id", id: team_id)

  @doc """
  Fetches clash tournaments.

  ## Required

  * `region` - The region of the tournaments.
  """
  def clash_tournaments(region) when is_binary(region),
    do: RiotGames.get(region, "/lol/clash/v1/tournaments")

  @doc """
  Fetches clash tournaments by team ID.

  ## Required

  * `region` - The region of the team.
  * `team_id` - The team ID.
  """
  def clash_tournaments_by_team(region, team_id) when is_binary(region) and is_binary(team_id),
    do: RiotGames.get(region, "/lol/clash/v1/tournaments/by-team/:id", id: team_id)

  @doc """
  Fetches clash tournament by tournament ID.

  ## Required

  * `region` - The region of the tournament.
  * `tournament_id` - The tournament ID.
  """
  def clash_tournament(region, tournament_id) when is_binary(region) and is_binary(tournament_id),
    do: RiotGames.get(region, "/lol/clash/v1/tournaments/:id", id: tournament_id)

  @doc """
  Fetches a list of featured games.

  ## Required

  * `region` - The region of the games.
  """
  def featured_games(region) when is_binary(region),
    do: RiotGames.get(region, "/lol/spectator/v4/featured-games")

  @doc """
  Fetches the grandmaster league for a queue.

  ## Required

  * `region` - The region of the league.
  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT
  """
  def grandmaster_league(region, queue) when is_binary(region) and is_binary(queue),
    do: RiotGames.get(region, "/lol/league/v4/grandmasterleagues/by-queue/:queue", queue: queue)

  @doc """
  Fetches a league with given ID.

  ## Required

  * `region` - The region of the league.
  * `league_id` - The league ID.
  """
  def league(region, league_id) when is_binary(region) and is_binary(league_id),
    do: RiotGames.get(region, "/lol/league/v4/leagues/:id", id: league_id)

  @doc """
  Fetches all the league entries

  ## Required

  * `region` - The region of the league.
  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT
  * `tier` - The tier type. Valid values: CHALLENGER, GRANDMASTER, MASTER, DIAMOND, PLATINUM, GOLD, SILVER, BRONZE, IRON
  * `division` - The division type. Valid values: I, II, III, IV

  ## Optional

  * `page` - The page to use for pagination. Defaults to 1.
  """
  def league_entries(region, queue, tier, division, page \\ 1)
      when is_binary(region) and is_binary(queue) and is_binary(tier) and is_binary(division) do
    RiotGames.get(
      region,
      "/lol/league/v4/entries/:queue/:tier/:division",
      [queue: queue, tier: tier, division: division],
      page: page
    )
  end

  @doc """
  Fetches the master league for a queue.

  ## Required

  * `region` - The region of the league.
  * `queue` - The queue type. Valid values: RANKED_SOLO_5x5, RANKED_FLEX_SR, RANKED_FLEX_TT
  """
  def master_league(region, queue) when is_binary(region) and is_binary(queue),
    do: RiotGames.get(region, "/lol/league/v4/masterleagues/by-queue/:queue", queue: queue)

  @doc """
  Fetches a match by match ID.

  ## Required

  * `region` - The region of the match. Valid values: "americas", "asia", "europe", and "sea".
  * `match_id` - The match ID.
  """
  def match(region, match_id) when is_binary(region) and is_binary(match_id),
    do: RiotGames.get(region, "/lol/match/v5/matches/:id", id: match_id)

  @doc """
  Fetches a match timeline by match ID.

  ## Required

  * `region` - The region of the match. Valid values: "americas", "asia", "europe", and "sea".
  * `match_id` - The match ID.
  """
  def match_timeline(region, match_id) when is_binary(region) and is_binary(match_id),
    do: RiotGames.get(region, "/lol/match/v5/matches/:id/timeline", id: match_id)

  @doc """
  Fetches a list of match IDs for a player.

  ## Required

  * `region` - The region of the player. Valid values: "americas", "asia", "europe", and "sea".
  * `puuid` - The player puuid.

  ## Optional

  * `startTime` - The start time to use for filtering match IDs.
  * `endTime` - The end time to use for filtering match IDs.
  * `queue` - The queue to use for filtering match IDs.
  * `type` - The type to use for filtering match IDs.
  * `start` - The start index to use for filtering match IDs.
  * `count` - The count to use for filtering match IDs.
  """
  def matches_by_player(region, puuid, opts \\ []) when is_binary(region) and is_binary(puuid) do
    RiotGames.get(region, "/lol/match/v5/matches/by-puuid/:id/ids", [id: puuid], opts)
  end

  @doc """
  Fetches the status of the platform.

  ## Required

  * `region` - The region to status of.
  """
  def status(region), do: RiotGames.get(region, "/lol/status/v4/platform-data")

  @doc """

  Fetches a summoner by account ID.

  ## Required

  * `region` - The region of the summoner.
  * `account_id` - The account ID.
  """
  def summoner_by_account_id(region, account_id) when is_binary(region) and is_binary(account_id),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/by-account/:id", id: account_id)

  @doc """
  Fetches a summoner by summoner ID.

  ## Required

  * `region` - The region of the summoner.
  * `id` - The summoner ID.
  """
  def summoner_by_id(region, id) when is_binary(region) and is_binary(id),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/:id", id: id)

  @doc """
  Fetches a summoner by name.

  ## Required

  * `region` - The region of the summoner.
  * `name` - The summoner name.
  """
  def summoner_by_name(region, name) when is_binary(region) and is_binary(name),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/by-name/:name", name: name)

  @doc """
  Fetches a summoner by PUUID.

  ## Required

  * `region` - The region of the summoner.
  * `puuid` - The summoner PUUID.
  """
  def summoner_by_puuid(region, puuid) when is_binary(region) and is_binary(puuid),
    do: RiotGames.get(region, "/lol/summoner/v4/summoners/by-puuid/:id", id: puuid)

  @doc """
  Fetches the leagues of a summoner.

  ## Required

  * `region` - The region of the summoner.
  * `summoner_id` - The summoner ID.
  """
  def summoner_leagues(region, summoner_id) when is_binary(region) and is_binary(summoner_id),
    do: RiotGames.get(region, "/lol/league/v4/entries/by-summoner/:id", id: summoner_id)
end
