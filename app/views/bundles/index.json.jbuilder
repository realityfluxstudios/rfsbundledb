json.array! @bundles do |bundle|
  json.extract! bundle, :title_slug, :site
  json.title bundle.title.truncate(40)

  json.games_count bundle.games.count
  json.musictracks_count bundle.musictracks.count
  json.drmfreegames_count bundle.drm_free_games.count
  json.androidgames_count bundle.androidgames.count
  json.ebooks_count bundle.unique_ebooks.count
  json.gamekeys_count bundle.game_keys_count

end
