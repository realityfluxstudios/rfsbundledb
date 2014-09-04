json.array!(@games) do |game|
  json.extract! game, :id, :title, :title_slug, :drm, :store_url
  json.bundle game.bundle.title
  json.gamekeys_count game.gamekeys.count
  json.url game_url(game.title_slug, format: :json)
end