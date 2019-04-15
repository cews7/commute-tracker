class Duration
  attr_reader :time

  def initialize(attrs = {})
    @time = attrs["legs"][0]["duration"]["text"]
  end

  def self.directions_with_duration(address_one, address_two)
    GoogleMapService.directions_with_duration(address_one, address_two).map do |raw_trip|
      Duration.new(raw_trip)
    end
  end
end
