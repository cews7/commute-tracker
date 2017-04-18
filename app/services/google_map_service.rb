class GoogleMapService
  def self.directions_with_duration(address_one, address_two)
    response = Faraday.get("http://maps.googleapis.com/maps/api/directions/json?origin=#{address_one}&destination=#{address_two}&departure_time=now&mode=driving&$key=#{ENV['DIRECTIONS_KEY']}")
    JSON.parse(response.body, symbolize_names: true)[:routes][:legs]
  end
end
