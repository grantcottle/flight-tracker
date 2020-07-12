# frozen_string_literal: true

require 'haversine' # Calculates distance between two points given their longitude/latitude

FLIGHTSPEED = 550 / 60.0 # Use average commercial flight speed of 550mph(9.17mpm) to estimate flight time

# Returns flight duration in minutes
def flight_time(origin, destination)
  distance = Haversine.distance(origin, destination)
  distance = distance.to_miles / FLIGHTSPEED
  distance.round
end

Airport.destroy_all
Flight.destroy_all
Airports.all.filter{|a| a if a.country == 'United States'}.each do |airport|
  Airport.create(
    { code: airport.iata,
      name: airport.name,
      city: airport.city,
      country: airport.country,
      latitude: airport.latitude,
      longitude: airport.longitude,
      timezone: airport.tz_name }
  )
end

# seed flights
Airport.all.each do |origin|
  Airport.all.each do |destination|
    rand(1..5).times do
      next if origin == destination

      d_time = Time.now + rand(10_000_000)
      duration = flight_time([origin[:latitude], origin[:longitude]], [destination[:latitude], destination[:longitude]])
      description = "#{origin.city} to #{destination.city}"

      Flight.create(
        flight_number: rand(1000..9999),
        origin_id: origin.id,
        destination_id: destination.id,
        departure_date: d_time.to_date,
        departure_time: d_time.to_s(:time),
        description: description,
        duration: duration,
        stops: rand(0..2)
      )
    end
  end
end
