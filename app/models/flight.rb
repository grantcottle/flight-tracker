class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings


  def departure_time
    format_time(departure_date, origin.timezone)
  end

  def arrival_date
   departure_date + (duration * 60) 
  end

  def arrival_time
    format_time(arrival_date, destination.timezone)
  end


  def flight_time
    "#{(duration - (duration % 60)) / 60 } hrs #{duration % 60} mins" 
  end

  private

  def format_time(time, timezone)
    time.in_time_zone(timezone).strftime("%I:%M %p")
  end
end
