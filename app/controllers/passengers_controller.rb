# frozen_string_literal: true

class PassengersController < ApplicationController
  def show
    @passenger = Passenger.fin_by_id(params[:id])
    @flight = @passenger.flight.last
    @booking = @passenger.booking

    @gate = rand(1..36).to_s + ('A'..'D').to_a.sample
    @seat = rand(10..48).to_s + ('A'..'F').to_a.sample
  end
end
