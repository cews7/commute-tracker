class TripsController < ApplicationController
  def show
    @commute = Trip.find(params[:id])
  end

  def new
    @commute = Trip.new
  end

  def create
    @commute = Trip.new(trip_params)
  end

  private

  def trip_params
    params.require(:trip).permit(:longitude, :latitude, :address_one, :address_two, :commute_name)
  end
end
