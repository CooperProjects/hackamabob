json.array!(@glossaries) do |glossary|
  json.extract! glossary, :id, :name, :link, :hitone, :hittwo, :hitthree, :x, :y, :z
  json.url glossary_url(glossary, format: :json)
end
