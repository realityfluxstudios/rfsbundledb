json.extract! @game, :id, :title, :title_slug, :drm, :price, :app_icon, :header_image, :store_url, :steam_id, :cheap_shark_id, :cheap_shark_url, :categories, :genres

json.gamekeys do |game_keys|
  game_keys.array! @game.gamekeys do |key|
    game_keys.extract! key, :key, :gift_url
  end
end
