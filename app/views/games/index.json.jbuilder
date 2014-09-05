json.array!(@games) do |game|
  json.extract! game, :id, :title_slug, :drm, :store_url
  json.title game.title.truncate(40)
  json.bundle game.bundle.title
  json.gamekeys_count game.gamekeys.count
end