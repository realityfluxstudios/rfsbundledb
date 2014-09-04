json.array!(@drmfreegames) do |drmfreegame|
  json.extract! drmfreegame, :title, :title_slug, :platform, :format
  json.url drm_free_game_url(drmfreegame.title_slug, format: :json)

  json.bundle drmfreegame.bundle.title
  json.bundle_url bundle_url(drmfreegame.bundle.title_slug, format: :json)
end