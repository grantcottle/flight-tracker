# frozen_string_literal: true

class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show]
  def index

    search_flights if params[:commit]
  end

  def search_flights
    if params[:origin] == params[:destination]
      flash.now[:alert] = 'Please choose different departure and arrical cities.'
    elsif params[:departure_date].empty?
      @pagy, @flights = pagy(Flight.where('origin_id = ? AND destination_id = ? ', params[:origin], params[:destination]))
    else
      date = Date.parse(params[:departure_date])
      date_begin = date.beginning_of_day

      date_end = date.end_of_day
      @flights = Flight.where('origin_id = ? AND destination_id = ? AND departure_date > ? AND departure_date < ?', params[:origin], params[:destination], date_begin, date_end)
    end
  end

  def show; end

  private

  def set_flight
    @flight = Flight.find(params[:id]) 
  end
end
