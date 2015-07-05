json.array!(@results) do |result|
  json.extract! result, :id, :name, :time_spend, :duplicate, :output
  json.url result_url(result, format: :json)
end
