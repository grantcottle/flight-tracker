json.array!(@airport) do |airport|
  json.name airport.name + '| ' + airport.code + '|' + airport.id.to_s
  json.id airport.id
end
