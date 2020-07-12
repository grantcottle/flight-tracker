class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  def self.valid_dates
    flights = Flight.all.order(departure_date: :asc)
    flights.map{ |f| f.departure_date.strftime('%d %b %Y') }.uniq
  end
end
