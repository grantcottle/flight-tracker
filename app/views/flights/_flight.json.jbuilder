json.extract! flight, :id, :flight_number, :origin_id, :destination_id, :departure_date, :departure_time, :description, :duration, :stops, :created_at, :updated_at
json.url flight_url(flight, format: :json)
