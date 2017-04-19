require 'rails_helper'

describe 'Google Service' do
  context '#duration_of_trip' do
    it 'retrieves duration of given commute' do
      VCR.use_cassette("duration") do

        user = OpenStruct.new(
        name: 'Eric Wahlgren-Sauro',
        oauth_token: ENV['GOOGLE_TOKEN']
        )

        trip = Trip.create(commute_name: "Dad's", address_one: "1017 Dogwood Drive Golden CO", address_two: "6925 east Dickenson place denver CO")

        commute_data = GoogleMapService.directions_with_duration(trip.address_one, trip.address_two)

        expect(commute_data).to be_an(Array)
        expect(commute_data[0]["bounds"]).to be_a(Hash)
        expect(commute_data[0]["bounds"]["northeast"]["lat"]).to eq 39.7256569
        expect(commute_data[0]["bounds"]["northeast"]["lng"]).to eq -104.9059148
      end
    end
  end
end
