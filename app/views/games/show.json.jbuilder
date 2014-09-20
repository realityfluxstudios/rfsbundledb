json.basic do
  json.id @game.id
  json.title @game.title
  json.title_slug @game.title_slug
  json.drm @game.drm
end

json.steam do
  json.steam_id @game.steam_id
  json.store_url @game.store_url
  json.price @game.price
  json.dev_info do
    json.dev @game.dev
    json.dev_url @game.dev_url
    json.dev_support_url @game.dev_support_url
  end
  json.images do
    json.app_icon @game.app_icon
    json.header_image @game.header_image
  end
  json.html do
    json.about @game.about
    json.description @game.description
  end
  json.categories @game.categories
  json.genres @game.genres
end

json.cheap_shark do
  json.cs_id @game.cheap_shark_id
  json.cs_url @game.cheap_shark_url
end

json.trans_ids do
  json.humblebundle_trans_id @game.humblebundle_trans_id
  json.paypal_trans_id @game.paypal_trans_id
  json.indiegala_trans_id @game.indiegala_trans_id
  json.bundlestars_trans_id @game.bundlestars_trans_id
  json.googlewallet_trans_id @game.googlewallet_trans_id
end

json.gamekeys do |game_keys|
  game_keys.array! @game.gamekeys do |key|
    game_keys.extract! key, :key, :gift_url
  end
end
