json.array!(@molecules) do |molecule|
  json.extract! molecule, :id, :name
  json.url molecule_url(molecule, format: :json)
end
