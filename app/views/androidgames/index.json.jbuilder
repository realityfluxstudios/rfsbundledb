json.array!(@androidgames) do |androidgame|
  json.title androidgame.title.truncate(40)
  json.extract! androidgame, :title_slug, :format

  json.dev androidgame.dev
  json.dev_url androidgame.dev_url
  json.bundle androidgame.bundle.title.truncate(40)
  json.format androidgame.format
  json.http androidgame.http
  json.bt androidgame.bt
end
