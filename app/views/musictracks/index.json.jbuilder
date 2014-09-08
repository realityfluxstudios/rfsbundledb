json.array!(@musictracks) do |musictrack|
  json.title musictrack.title.truncate(40)
  json.extract! musictrack, :title_slug, :dev, :format
end