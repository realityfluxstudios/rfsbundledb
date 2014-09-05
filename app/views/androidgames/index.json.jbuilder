json.array!(@androidgames) do |androidgame|
  json.extract! androidgame, :title_slug, :dev, :format
  json.title androidgame.title.truncate(40)
end
