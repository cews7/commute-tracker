class GoogleMapService
  def self.directions_with_duration(address_one, address_two)
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?key=#{ENV['DIRECTIONS_KEY']}&origin=#{address_one}&destination=#{address_two}&departure_time=now&mode=driving")
    JSON.parse(response.body)["routes"]
  end
end
