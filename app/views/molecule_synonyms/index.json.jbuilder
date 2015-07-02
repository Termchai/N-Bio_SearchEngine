json.array!(@molecule_synonyms) do |molecule_synonym|
  json.extract! molecule_synonym, :id, :molecule_id, :synonym
  json.url molecule_synonym_url(molecule_synonym, format: :json)
end
