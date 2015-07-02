json.array!(@interacts) do |interact|
  json.extract! interact, :id, :m1, :m2, :source
  json.url interact_url(interact, format: :json)
end
