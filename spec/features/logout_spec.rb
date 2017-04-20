require 'rails_helper'

describe "User" do
  it "logs out of commute-tracker" do
    VCR.use_cassette("logout") do
      trip = Trip.create!(id: 1, commute_name: "Dad's", address_one: "1017 Dogwood Drive Golden CO", address_two: "6925 east Dickenson place denver CO")
      user = OpenStruct.new(
      first_name: 'Eric',
      last_name: 'Wahlgren-Sauro',
      oauth_token: ENV['GOOGLE_TOKEN']
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/trips/1"

      click_on("Logout")
      expect(current_path).to eq "/"
    end
  end
end
