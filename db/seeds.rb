# frozen_string_literal: true

Airport.destroy_all
Airports.all.each do |airport|
  Airport.create(
    { code: airport.iata,
      name: airport.name,
      city: airport.city,
      country: airport.country,
      latitude: airport.latitude,
      longitude: airport.longitude,
      timezone: airport.tz_name
    }
  )
end
