class TripsController < ApplicationController
  def show
    @commute = Trip.find(params[:id])
  end
end
