defmodule RiotGames do
  use Application

  def start(_type, _args) do
    children = [
      {SimpleRateLimiter, interval: 120_000, max: 100}
    ]

    opts = [strategy: :one_for_one, name: RiotGames.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Fetches a Riot Games account by its PUUID.

  ## Required

  * `puuid` - The PUUID of the account to fetch.

  ## Optional

  * `region` - The region to fetch the account from. Defaults to `na1`.
  """
  def account_by_puuid(puuid, region \\ "na1") when is_binary(puuid),
    do: RiotGames.get(region, "/riot/account/v1/accounts/by-puuid/:id", id: puuid)

  @doc """
  Fetches a Riot Games account by its Riot ID.

  ## Required

  * `game_name` - The game name of the account to fetch.
  * `tag_line` - The tag line of the account to fetch.

  ## Optional

  * `region` - The region to fetch the account from. Defaults to `na1`.
  """
  def account_by_riot_id(game_name, tag_line, region \\ "na1")
      when is_binary(game_name) and is_binary(tag_line) do
    RiotGames.get(region, "/riot/account/v1/accounts/by-riot-id/:gameName/:tagLine",
      gameName: game_name,
      tagLine: tag_line
    )
  end

  @doc """
  Fetches the active shard for a Riot Games account.

  ## Required

  * `game` - The game to fetch the active shard for. Valid values are `val`, or `lor`
  * `puuid` - The PUUID of the account to fetch the active shard for.

  ## Optional

  * `region` - The region to fetch the active shard from. Defaults to `na1`.
  """
  def active_shard(game, puuid, region \\ "na1") when is_binary(game) and is_binary(puuid) do
    RiotGames.get(region, "/riot/account/v1/active-shards/by-game/:game/by-puuid/:puuid",
      game: game,
      puuid: puuid
    )
  end

  @doc """
  Fetches an endpoint for Riot Games' API.

  ## Required

  * `region` - The region to fetch the endpoint from.
  * `path` - The path to fetch the endpoint from.

  ## Optional

  * `path_params` - The path parameters to use in the endpoint.
  * `params` - The query parameters to use in the endpoint.
  """
  def get(region, path, path_params \\ [], params \\ []) do
    api_key = Application.get_env(:riot_games_client, :api_key)

    req =
      Req.new(
        base_url: "https://#{region}.api.riotgames.com",
        headers: [{"X-Riot-Token", "#{api_key}"}],
        decode_json: [keys: :atoms]
      )

    SimpleRateLimiter.wait_and_proceed(fn ->
      case Req.get(req, url: path, path_params: path_params, params: params) do
        {:ok, %Req.Response{status: 200, body: body}} ->
          {:ok, body}

        {:ok, %Req.Response{body: body}} ->
          {:error, body}

        {:error, reason} ->
          {:error, reason}
      end
    end)
  end
end
