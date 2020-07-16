class BookingsController < ApplicationController

  def new
    @flight = Flight.find_by_id(params[:flight])
    puts @flight
    @booking = Booking.new(flight: @flight)

    @num_passengers = params[:passengers].to_i
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new booking_params  

    @booking.passengers.each do | passenger|
      passenger.first_name = Faker::Name if passenger.first_name.empty?
      passenger.last_name = Faker::Name if passenger.last_name.empty?
      passenger.email = Faker::Internet.email if passenger.email.empty?

    end
    if @booking.save
      flash[:notice] = 'Booking Confirmed'
      @booking.passengers.each do |passenger|
        #TODO implement mailer
      end
      redirect_to @booking
    else
      flash.now[:alert] = 'Something went wrong'
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id]) 
  end

  private

  def booking_params  
    params.require(:booking).permit(:flight_id, passangers_attributes: [:first_name, :last_name, :email])
  end
end
