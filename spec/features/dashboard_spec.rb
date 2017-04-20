require 'rails_helper'

describe "User" do
  it "visits dashboard page" do
    VCR.use_cassette("login") do
      Trip.create!(commute_name: "Dad's", address_one: "1017 Dogwood Drive Golden CO", address_two: "6925 east Dickenson place denver CO")
      user = OpenStruct.new(
      first_name: 'Eric',
      last_name: 'Wahlgren-Sauro',
      oauth_token: ENV['GOOGLE_TOKEN']
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      expect(page).to have_content("CommuteTracker")
      expect(page).to have_content("Welcome, Eric!")
      expect(page).to have_content("Logout")
      expect(page).to have_content("Create Commute")
      expect(page).to have_content("ACT for most recently submitted is 15 days")
      expect(page).to have_content("CommuteTracker")
    end
  end
end
