json.array!(@drmfreegames) do |drmfreegame|
  json.extract! drmfreegame, :title_slug, :platform, :format
  json.title drmfreegame.title.truncate(40)

  json.bundle drmfreegame.bundle.title
  json.unique_games drmfreegame.bundle.unique_drmfree.count
end