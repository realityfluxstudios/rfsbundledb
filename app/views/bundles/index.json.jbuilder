json.array! @bundles do |bundle|
  json.extract! bundle, :title, :title_slug, :site
  json.url bundle_url(bundle.title_slug)

  json.games_count bundle.games.count
  json.musictracks_count bundle.musictracks.count
  json.drmfreegames_count bundle.drm_free_games.count
  json.androidgames_count bundle.androidgames.count
end
