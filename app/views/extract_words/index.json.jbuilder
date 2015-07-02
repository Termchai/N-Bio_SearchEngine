json.array!(@extract_words) do |extract_word|
  json.extract! extract_word, :id, :word
  json.url extract_word_url(extract_word, format: :json)
end
