json.array!(@androidgames) do |androidgame|
  json.extract! androidgame, :id
  json.url androidgame_url(androidgame, format: :json)
end
