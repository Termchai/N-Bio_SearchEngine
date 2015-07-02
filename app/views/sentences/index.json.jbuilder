json.array!(@sentences) do |sentence|
  json.extract! sentence, :id, :sen
  json.url sentence_url(sentence, format: :json)
end
