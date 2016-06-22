
json.array!(@articles) do |article|
  json.extract! article, :title
  json.extract! article, :published_at
end