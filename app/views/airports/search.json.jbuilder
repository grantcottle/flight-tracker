json.array!(@airport) do |airport|
  json.name airport.name + '| ' + airport.code 
  json.id airport.id
end
