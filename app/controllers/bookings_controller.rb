class BookingsController < ApplicationController

  def new
    @flight = Flight.find_by_id(params[:flight])
    @booking = Booking.new(flight: @flight)

    @num_passengers = params[:passengers].to_i
    @num_passengers.times { @booking.passengers.build }
  end
end
