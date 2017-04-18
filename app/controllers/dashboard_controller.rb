class DashboardController < ApplicationController
  def index
    @commutes        = Trip.all.reverse
    @recent_duration = Duration.directions_with_duration(Trip.last.address_one, Trip.last.address_two)
  end
end
