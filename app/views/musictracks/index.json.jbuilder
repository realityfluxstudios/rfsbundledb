json.array!(@musictracks) do |musictrack|
  json.extract! musictrack, :title, :dev
  json.url musictrack_url(musictrack.title_slug)
end
