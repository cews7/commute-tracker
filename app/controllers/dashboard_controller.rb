class DashboardController < ApplicationController
  def index
      @commutes = Trip.all.reverse
      if @commutes.empty?
        @commutes = Trip.all.reverse
      else
        @duration = Duration
        .directions_with_duration(Trip.last.address_one, Trip.last.address_two)
        .first.time
      end
  end
end
