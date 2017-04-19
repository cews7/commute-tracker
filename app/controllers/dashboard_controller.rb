class DashboardController < ApplicationController
  def index
    @commutes = Trip.all.reverse
    @duration = Duration.directions_with_duration(Trip.last.address_one, Trip.last.address_two).first.time
  end
end
