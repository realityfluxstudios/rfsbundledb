json.array!(@ebooks) do |ebook|
  json.title ebook.title.truncate(40)
  json.extract! ebook, :title_slug, :format

  json.format ebook.format
  json.dev ebook.dev
  json.http ebook.http
  json.bt ebook.bt
end