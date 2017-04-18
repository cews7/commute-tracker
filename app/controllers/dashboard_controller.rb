class DashboardController < ApplicationController
  def index
    @commutes = Trip.all 
  end
end
