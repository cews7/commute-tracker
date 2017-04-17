class TripsController < ApplicationController
  def show
    @commute = Trip.find_by(params[:id])
  end
end
