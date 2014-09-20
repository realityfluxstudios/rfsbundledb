json.extract! @bundle, :id, :title, :title_slug, :site

json.games do |games|
  games.array! @bundle.games do |game|
    games.extract! game, :title, :title_slug
    games.keycount game.gamekeys.count
    games.url game_url(game.title_slug)
  end
end

json.musictracks do |musictracks|
  musictracks.array! @bundle.musictracks do |musictrack|
    musictracks.extract! musictrack, :title, :title_slug, :dev, :dev_slug, :dev_url
    musictracks.url musictrack_url(musictrack.title_slug)
  end
end

json.drmfreegames do |drmfreegames|
  drmfreegames.array! @bundle.drm_free_games do |drmfreegame|
    drmfreegames.extract! drmfreegame, :title, :title_slug, :dev, :dev_slug, :dev_url, :platform
    drmfreegames.url drm_free_game_url(drmfreegame.title_slug)
  end
end

json.androidgames do |androidgames|
  androidgames.array! @bundle.androidgames do |androidgame|
    androidgames.extract! androidgame, :title, :title_slug, :dev, :dev_slug, :dev_url, :format
    androidgames.url androidgame_url(androidgame.title_slug)
  end
end